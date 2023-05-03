<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style>
	a{
	text-decoration: none;
	color: black;
	}
	
	.articleBox{
		padding:20px 20px 50px 20px;
		border: 0.8px solid #ddd;
		border-radius:10px;
		position:relative;
		display:flex;
		flex-direction:column;
	}
	.topBtns{
		height:50px;
		padding:10px 0;
	}
	
	ul{
	margin-bottom:0;
	}
	.boardSubMenu{
		background:gray;
		padding:50px 0;
	}
	#comm_comment_text{
		width:100%;
		height:auto;
		border: none;
		outline: none;
		
	}
	#commcommentList>li{
		padding:10px 0;
		border-bottom:1px solid #ddd;
	}
	#menu > li > ul {
		display:none;
		position: absolute;
		font-size:14px;
		float: left;
	}
	#menu > li:hover > ul {
		display:block;
	}
	#menu > li > ul > li {
		float:left;
		display:block;
		width: 305px; 
		white-space:nowrap;
	}	
</style>
<script>
	function commDel(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href= "commDel?comm_no=${dto.comm_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>";
		}
	}
	
	$(function(){
		//ajax로 좋아요 상태 확인
		function count_comment_hit(){
			$.ajax({
				url:"/happy/commlike",
				data:{userid:'${dto.userid}',
					comm_no:${dto.comm_no}
					},
				type:"GET",
				dataType:"json",

				success:function(comment){	

					$(comment).each(function(i, lDTO){
						if(lDTO.result>0){
							console.log("112345");
							$('.LikeBtn').attr('src', 'img/heart.PNG');

						}
						else{
							$('.LikeBtn').attr('src', 'img/grayheart.PNG');
						}
						
					});
				
			},error:function(e){
				console.log(e.responseText)
				console.log("test")
			}
		});
	}
	
		$('.LikeBtn').click(function() {
			  // 버튼의 현재 값이 "좋아요"인 경우
			  if ($(this).attr('src') === "img/heart.PNG") {
			    // AJAX 요청을 보내서 서버에 좋아요를 추가하는 로직 구현
			    $.ajax({
			      method: "GET",
			      url: "/happy/delcommlike", // 좋아요 취소
			      data: { 
			    	  userid:'${dto.userid}',
					comm_no:'${dto.comm_no}' 
					},
					type:"GET",
					dataType:"json",
			      success: function(response) {
			        // 요청이 성공하면 버튼의 텍스트를 "좋아요 취소"로 변경
			        $('.LikeBtn').attr('src', 'img/grayheart.PNG');
			        alert('좋아요를 취소하였습니다.');
			      },
			      error: function(xhr, status, error) {
			        // 요청이 실패한 경우 에러 핸들링 로직 구현
			      }
			    });
			  } else { // 버튼의 현재 값이 "좋아요인 경우
			    $.ajax({
			      method: "GET",
			      url: "/happy/commlikeup", 
			      data: { userid:'${dto.userid}',
						comm_no:'${dto.comm_no}'
						}, 
						type:"GET",
						dataType:"json",
			      success: function(response) {
			    	  $('.LikeBtn').attr('src', 'img/heart.PNG');
			        alert('좋아요를 선택하셨습니다');

			      },
			      error: function(xhr, status, error) {
			        // 요청이 실패한 경우 에러 핸들링 로직 구현
			      }
			    });
			  }
		});
	
	count_comment_hit();
	});//jquery
	
	$(function(){
		//ajax로 전체 댓글 수 표시
		function count_comment_hit(){
			$.ajax({
				url:"/happy/count_comment_hit",
				data:{comm_no:${dto.comm_no}},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					var tag = "";

					$(comment).each(function(i, cDTO){
						tag += cDTO.comm_comment_hit;
					});
					
					$("#count_comment_hit").html(tag);
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		

		//댓글 목록 ajax로 해당 게시물에 대한 모든 댓글을 선택하여 뷰에 표시하는 함수 -------------
		function commcommentList(){
			$.ajax({
				url:"/happy/commcommentList",
				data:{comm_no:${dto.comm_no}},
				type:"GET",
				dataType:"json",
				success:function(comment1){	
					var tag = "";
					$(comment1).each(function(i, cDTO){
						tag += "<li><div style='font-size: 12px;''><b>"+cDTO.userid+" ("+cDTO.comm_comment_date+")</b>";
						//본인이 쓴 댓글 일때
						if(cDTO.userid == '${logId}'){ //cDTO.userid(클라이언트 실행 ) = 'goguma' ${logId}(서버에서 실행)goguma
							tag +="<input type='button' value='수정'style='background-color:white; border:none; color:#8BC34A;'/>";
							tag +="<input type='button' value='삭제' style='background-color:white; border:none; color:#8BC34A;' title='"+cDTO.comm_comment_no+"'/>";
							
							tag += "<p style='white-space: pre-line'>"+cDTO.comm_comment_text+"</p></div>";
							
							//댓글 수정폼을 만들기 - 기존댓글과, 댓글번호(c_no)가 폼에 있어야 한다.
							tag += "<div style='display:none'>"
							tag += "<form method='post'>"
							tag += "<input type='hidden' name='comm_comment_no' value='"+cDTO.comm_comment_no+"'/>";//댓글일련번호
							tag += "<textarea name='comm_comment_text' style='width:400px; height:80px;'>"+cDTO.comm_comment_text+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기'>"
							tag += "</form>"
							tag += "</div>"
							
						}else{
							tag += "<p>"+cDTO.comm_comment_text+"</p></div>";
						}
	
						tag += "</li>"
					});
					
					$("#commcommentList").html(tag);
					count_comment_hit();
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		
		//댓글쓰기---------------------------------------------------------------------------------
		$("#commcommentForm").submit(function(){
			//코멘트가 있을 때 ajax실행
			if($("#comm_comment_text").val()==""){
				alert("댓글을 입력 후 등록하세요.");
				return false;
			}
			//코멘트가 있을 때
			//폼의 값을 쿼리문으로 만들기 no=44&coment=asd
			//form의 component의 data를 name 값과 value속성의 값을 이용하여 쿼리문을 만들어 준다.
			//$("commcommentForm")
			console.log("test");
			
			var query = $(this).serialize();	// no=45&coment=asdasd			
			console.log(query);
			$.ajax({
				url:"/happy/commcommentSend",
				data: query,
				type: "POST",
				success:function(result){
					console.log(result);
					console.log("test2");
					
					//기존에 입력한 댓글 지우기
					$("#comm_comment_text").val("");
					
					//댓글목록을 다시 뿌려준다.
					commcommentList();
					count_comment_hit();
				},error:function(e){
					console.log(e.responseText)
				}
			});
			return false; //form의 기본 이벤트 때문 다음 실행이
		});
		//댓글 수정폼 보여주기 : 본인이 쓴 글일 때 Edit버튼을 클릭하면 글 내용은 숨기고, 폼을 보여준다.
		$(document).on('click','#commcommentList input[value=수정]',function(){
			
			//var dom = $(document).cjildren("li");
			//기존의 열어놓은 폼이나, 숨겨놓은 댓글내용을 처리하고
			//$("#commentList>li>div:nth-first").css('display','block');
			//$("#commentList>li>div:nth-last").css('display','none');
			$(this).parent().css("display","none");	//댓글 숨기고
			$(this).parent().next().css("display","block");//폼 보여주고
			
		});
		//댓글 수정 - DB
		$(document).on('click','#commcommentList input[value=댓글수정하기]',function(){
			//데이터 준비
			console.log("test1");
			var params = $(this).parent().serialize();// c_no=34&coment=test
			//console.log("params",params);
			var url = "/happy/commcommentEdit";
			console.log("test2");
			
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(result){
					console.log(result);
					//댓글목록을 다시 뿌려주기
					commcommentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});	
			
			return false;
		});
			//댓글 삭제
			$(document).on('click','#commcommentList input[value=삭제]',function(){
				if(confirm("댓글을 삭제하시겠습니까?")){
					var params = "comm_comment_no=" +$(this).attr("title");
					console.log(params);
					var url ="/happy/commcommentDelete";
					
					$.ajax({
						url:url,
					data:params,
					success:function(result){
						console.log(result);
						//댓글목록을 다시 뿌려주기
						commcommentList();
					},error:function(error){
						console.log(error.responseText);
					}
				})
				}
		});
			
			
		//댓글 목록 뿌려주기 -- 처음에 글내용 보기로 오면 댓글 보여주기
		commcommentList();
		
	});//jquery
	
	
	//신고--------------------------------------------------------------------------------
	$(function(){
		$("input[value=신고]").click(function(){
			if(${logStatus!='Y'}){
				alert('로그인후 이용가능합니다');
				return false;
			}else{
				// url에서 쿼리 문자열 가져옴
				const queryString = window.location.search;
				// 쿼리 문자열에서 ? 문자를 제거후 & 문자를 기준으로 분할하여 배열에 담음
				const params = queryString.substr(1).split("&");
				//값을 담을 변수 선언
				let board_type, board_no;
				//분할된 배열의 각 요소를 돌면서 값이 있는지 확인
				for(let i=0; i<params.length; i++){
					const keyValue = params[i].split("="); // = 를 기준으로 키와 값으로 분리
					const key = keyValue[0];
					const value = keyValue[1];
					
					if(key === "comm_no" || key === "recipe_no" || key === "menu_no"){
						// board_type 변수에 값을 할당
						board_type = key;
						
						// board_no 변수에 값을 할당
						board_no = parseInt(value);
						
						break; //값을 찾으면 반복문 중지
					}
				}
				var popupX = (window.screen.width/2)-(500/2);
				var popupY = (window.screen.height/2)-(500/2);
				window.open("reportForm?"+board_type+"="+board_no, "reportSend", "width=500, height=500, left=${popupX}, top=${popupY}");
			}
		});
	});
</script>

<!-- 배너 -->
<div class= "banner" style="overflow: hidden;">
	<img src="img/bannerimg2.png" width="100%" height="300px;">
</div>

<div class="container">

		<div class="topBtns">
		<a href="comm_List?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-light" id="listBtn">목록</a>
		</div>
		
	<div class="articleBox">
	
	<ul id="view"  style="margin-top: 30px; padding:0;">
		<li style="padding-left:10px;display: inline;font-size: 12px;"> [ ${dto.comm_bullet_point} ]</li>
		
		<!-- 제목 -->
		<div style="border-bottom: 1px solid gray;">
		<li style="margin: 15px 0px 15px 10px; width: 80%; display:inline-block;"><h2 style="width: 80%; display:inline-block;">${dto.comm_title }</h2></li>
		<c:if test="${logId==dto.userid }">
		<div class="searchDiv" style="padding-top:20px; float: right;">	
			<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a style="color: white;" href="commEdit?comm_no=${dto.comm_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">수정</a></div></button>
			<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a style="color: white;" href="javascript:commDel()">삭제</a></div></button>
		</div>
		</c:if>	
		</div>
		
	
		

		
		
			
		
		<div>

		<li style="font-size: 14px; padding-top: 50px; padding-bottom: 100px; padding-left: 20px; padding-right: 20px;">${dto.comm_text }</li>
		<div style="overflow: hidden; margin-top: 50px;">
		<li style="display: inline; font-size: 14px; position: relative; left:10px;">
		<b>${dto.username}</b>님의 게시글 더보기</li>
		</div>
		<div>
		<li style="display: inline; position: relative; left:10px; font-size: 12px;">${dto.comm_date }</li>
		<li style="display: inline; position: relative; left:10px; font-size: 12px;">조회 </li>
		<li style="display: inline; position: relative; left:10px; font-size: 12px;">${dto.comm_hit } </li>
		<li style="display: inline; position: relative;  font-size: 12px; float: right;">
			<c:if test="${logStatus=='Y' and logId!=dto.userid }">
				<input type="button" value="신고"/>
			</c:if>
		</li>
		</div>
			<div style= "overflow: hidden">	
				<div style="clear:right;text-align:right; width: 30%;  font-size: 14px;">
					
				</div>
			</div>
		</div>
	</ul>
	<hr style = "height: 1px; background-color: black;"/>
	
	
	<!-- 댓글 -->
	<div style="padding-top:10px; padding-bottom:40px;">
		<div style="width: 5%;  display: inline-block; float: left;">
			<h4 style="padding-left:10px;">댓글</h4>
		</div>
		<div style= "padding-left:10px; width: 30%; float: left; overflow: hidden">
			<img src="" class="LikeBtn" style="width:18px; margin-top:-5px;"></img>
			<li style="display: inline;  font-size: 12px;"> 좋아요</li>
			<li style="display: inline;  font-size: 12px;">0</li>
			<li style="display: inline;  font-size: 12px;"> 댓글</li>
			<li style="display: inline;  font-size: 12px;" id="count_comment_hit"></li>
		</div>
	</div>
	<div>
	<c:if test="${logStatus=='Y'}"><!-- 로그인한 경우 댓글쓰기 폼 보여주기 -->
	<div style="border: 1px solid gray;border-radius: 10px;padding : 10px 10px;
		margin-bottom: 30px; "><!-- 댓글 입력 테두리 -->
			<form method="post" id="commcommentForm">
				<p style="padding-left: 10px; font-size: 12px;">		${dto.username }님</p>
				<input type="hidden" name="comm_no" value="${dto.comm_no}"/><!-- 원글 글번호 -->
				<textarea name="comm_comment_text" id="comm_comment_text"  placeholder="댓글을 남겨보세요"
					style="padding: 10px 0px 0px 10px;
					width: 100%;
					box-sizing: border-box;
					border: none;
					border-radius: 3px;
					font-size: 12px;
					resize : none;"
			></textarea>
				<!-- 댓글 등록 버튼 -->
					<div class="commHeader" style="margin-bottom: 20px; margin-top: 10px; overflow: hidden;">
					<button type="submit" class="btn btn-outline-dark"
					style=" float: right"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 댓글등록</button>
					</div>
			</form>
	</div>
		</c:if>

		<ul id ="commcommentList">

		</ul>
	</div>
	</div>
</div>
<div style="padding-bottom:100px;"></div>