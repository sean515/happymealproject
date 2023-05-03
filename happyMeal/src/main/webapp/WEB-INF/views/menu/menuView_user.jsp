<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style>

	
	a{
	 color:black;
	}
	
	.topBtns{
		height:50px;
		padding:10px 0;
	}
	#listBtn{
		width:45px;
		height:30px;
		font-size:14px;
		float:right;
		margin:0;
	}
	.articleBox{
		padding:30px 30px 0;
		border: 0.8px solid #ddd;
		border-radius:10px;
		position:relative;
		display:flex;
		flex-direction:column;
	}
	#ingredients{
		margin:20px 10px 50px;
	}
	.articleWriter{
		margin-top:40px;
	}
	ul{
	margin-bottom:0;
	}
	#manual ul{
		overflow:auto;
	}
	#manual li{
		float:left;
		width:60%;
	}
	#manual li:nth-child(2n){
		width:40%;
		font-size:24px;
	}
	#manualImage{
		max-width:350px;
		max-height:300px;
	}
	#menu_comment_text{
		width:100%;
		height:auto;
		border: none;
		outline: none;
		
	}
	#menucommentList>li{
		padding:10px 0;
		border-bottom:1px solid #ddd;
	}
	a:link{
		text-decoration:none;
	}
	
</style>
<script>
	function menuDel(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href= "menuDel?menu_no=${dto.menu_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>";
		}
	}
	
	$(function(){
		function menu_like_hit(){
			$.ajax({
				url:"/happy/menu_count_like_hit",
				data:{menu_no:${dto.menu_no}},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					var tag = "";

					$(comment).each(function(i, cDTO){
						tag += cDTO.menu_like_hit;
					});
					
					$("#menu_like_hit").html(tag);
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		
		//ajax로 좋아요 상태 확인
		function count_comment_hit(){
			$.ajax({
				url:"/happy/menulike",
				data:{userid:'${dto.userid}',
					menu_no:${dto.menu_no}
					},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					console.log("112345");
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
			      url: "/happy/delmenulike", // 좋아요 취소
			      data: { 
			    	  userid:'${dto.userid}',
					menu_no:'${dto.menu_no}' 
					},
					type:"GET",
					dataType:"json",
			      success: function(response) {
			    	menu_like_hit();
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
			      url: "/happy/menulikeup", 
			      data: { userid:'${dto.userid}',
						menu_no:'${dto.menu_no}'
						}, 
						type:"GET",
						dataType:"json",
			      success: function(response) {
			    	  menu_like_hit();
			    	  $('.LikeBtn').attr('src', 'img/heart.PNG');
			        alert('좋아요를 선택하셨습니다');

			      },
			      error: function(xhr, status, error) {
			        // 요청이 실패한 경우 에러 핸들링 로직 구현
			      }
			    });
			  }
		});
		menu_like_hit();
		count_comment_hit();
	});//jquery
	
	$(function(){
		//ajax로 전체 댓글 수 표시
		function count_comment_hit(){
			$.ajax({
				url:"/happy/menu_count_comment_hit",
				data:{menu_no:${dto.menu_no}},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					console.log("댓글 수 불러오기");
					var tag = "";

					$(comment).each(function(i, cDTO){
						tag += cDTO.menu_comment_hit;
					});
					
					$("#menu_comment_hit").html(tag);
					
					
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		

		//댓글 목록 ajax로 해당 게시물에 대한 모든 댓글을 선택하여 뷰에 표시하는 함수 -------------
		function menucommentList(){
			$.ajax({
				url:"/happy/menucommentList",
				data:{menu_no:${dto.menu_no}},
				type:"GET",
				dataType:"json",
				success:function(comment1){	
					var tag = "";
					$(comment1).each(function(i, cDTO){
						tag += "<li><div style='font-size: 12px;'><b>"+cDTO.userid+" ("+cDTO.menu_comment_date+")</b>";
						//본인이 쓴 댓글 일때
						if(cDTO.userid == '${logId}'){ //cDTO.userid(클라이언트 실행 ) = 'goguma' ${logId}(서버에서 실행)goguma
							tag +="<input type='button' value='수정' style='background-color:white; border:none; color:#8BC34A;'/>";
							tag +="<input type='button' value='삭제' style='background-color:white; border:none; color:#8BC34A;' title='"+cDTO.menu_comment_no+"'/>";
							
							tag += "<p style='white-space: pre-line'>"+cDTO.menu_comment_text+"</p></div>";
							
							//댓글 수정폼을 만들기 - 기존댓글과, 댓글번호(c_no)가 폼에 있어야 한다.
							tag += "<div style='display:none'>"
							tag += "<form method='post'>"
							tag += "<input type='hidden' name='menu_comment_no' value='"+cDTO.menu_comment_no+"'/>";//댓글일련번호
							tag += "<textarea name='menu_comment_text' style='width:400px; height:80px;'>"+cDTO.menu_comment_text+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기'>"
							tag += "</form>"
							tag += "</div>"
							
						}else{
							tag += "<p>"+cDTO.menu_comment_text+"</p></div>";
						}
	
						tag += "</li>"
					});
					
					$("#menucommentList").html(tag);
					count_comment_hit();
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		
		//댓글쓰기---------------------------------------------------------------------------------
		$("#menucommentForm").submit(function(){
			//코멘트가 있을 때 ajax실행
			if($("#menu_comment_text").val()==""){
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
				url:"/happy/menucommentSend",
				data: query,
				type: "POST",
				success:function(result){
					console.log(result);
					console.log("test2");
					
					//기존에 입력한 댓글 지우기
					$("#menu_comment_text").val("");
					
					//댓글목록을 다시 뿌려준다.
					menucommentList();
					count_comment_hit();
				},error:function(e){
					console.log(e.responseText)
				}
			});
			return false; //form의 기본 이벤트 때문 다음 실행이
		});
		//댓글 수정폼 보여주기 : 본인이 쓴 글일 때 Edit버튼을 클릭하면 글 내용은 숨기고, 폼을 보여준다.
		$(document).on('click','#menucommentList input[value=수정]',function(){
			
			//var dom = $(document).cjildren("li");
			//기존의 열어놓은 폼이나, 숨겨놓은 댓글내용을 처리하고
			//$("#commentList>li>div:nth-first").css('display','block');
			//$("#commentList>li>div:nth-last").css('display','none');
			$(this).parent().css("display","none");	//댓글 숨기고
			$(this).parent().next().css("display","block");//폼 보여주고
			
		});
		//댓글 수정 - DB
		$(document).on('click','#menucommentList input[value=댓글수정하기]',function(){
			//데이터 준비
			console.log("test1");
			var params = $(this).parent().serialize();// c_no=34&coment=test
			//console.log("params",params);
			var url = "/happy/menucommentEdit";
			console.log("test2");
			
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(result){
					console.log(result);
					//댓글목록을 다시 뿌려주기
					menucommentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});	
			
			return false;
		});
			//댓글 삭제
			$(document).on('click','#menucommentList input[value=삭제]',function(){
				if(confirm("댓글을 삭제할까요?")){
					var params = "menu_comment_no=" +$(this).attr("title");
					console.log(params);
					var url ="/happy/menucommentDelete";
					
					$.ajax({
						url:url,
					data:params,
					success:function(result){
						console.log(result);
						//댓글목록을 다시 뿌려주기
						menucommentList();
					},error:function(error){
						console.log(error.responseText);
					}
				})
				}
		});
			
			
		//댓글 목록 뿌려주기 -- 처음에 글내용 보기로 오면 댓글 보여주기
		menucommentList();
		
	});//jquery
</script>

<!-- 배너 -->
	<div class= "banner" style="overflow: hidden;">
		<img src="img/bannerimg2.png" width="100%" height="300px;">
	</div>

<div class="container">

	<div class="topBtns">
		<a href="menu_user?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-light" id="listBtn">목록</a>
	</div>
	
	<div class="articleBox">
	
	
		<div class="articleHeader">
			<div style="border-bottom: 1px solid gray;">
				<ul id="view"  style="margin-top: 30px; padding:0;">
				<li style="margin: 15px 0px 15px 10px; width: 80%; display:inline-block;">
					<!-- 제목 -->
					<h2 style="width: 80%; display:inline-block;">${dto.menu_title }</h2>
				</li>
				<c:if test="${logId==dto.userid }">
					<div class="searchDiv" style="padding-top:20px; float: right;">	
						<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a style="color: white;" href="menuEdit?menu_no=${dto.menu_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" >수정</a></div></button>
						<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a style="color: white;" href="javascript:menuDel()">삭제</a></div></button>
					</div>
				</c:if>	
				</ul>
			</div>
		</div>	
						
		<div class="articleContentBox">
			
			<div id="ingredients">
			</div>
			
<style>
	#manual > img{
		width: 30%;
		margin-left: 5px;
		margin-bottom: 5px;
	}
</style>


			<div id="manual">
				<h2>식단 메뉴</h2>
				<br/>
					<img src="${dto.menu_img1 }"/>
					<img src="${dto.menu_img2 }"/>
					<img src="${dto.menu_img3 }"/>
					<img src="${dto.menu_img4 }"/>
					<img src="${dto.menu_img5 }"/>
					<img src="${dto.menu_img6 }"/>
				<ul>			
					<li style="font-size: 14px;">${dto.menu_text }</li>
				</ul>
			</div>
		</div>
		
		<!-- 작성자시작 -->
		<ul>
		<div style="padding-top:20px;">
		<li style="display: inline; font-size: 14px; position: relative; left:10px;">
		<a style="color:black;" href=href="menu_user?searchKey=username&searchWord=${dto.username}"><b>${dto.username}</b>님의 게시글 더보기</li></a>
		</div>
		<div>
		<li style="display: inline; position: relative; left:10px; font-size: 12px;">${dto.menu_date }</li>
		<li style="display: inline; position: relative; left:10px; font-size: 12px;">조회 </li>
		<li style="display: inline; position: relative; left:10px; font-size: 12px;">${dto.menu_hit } </li>
		<li style="display: inline; position: relative;  font-size: 12px; float: right;"><a href="test">신고</a></li>
		
		</div>
			<div style= "overflow: hidden">	
				<div style="clear:right;text-align:right; width: 30%;  font-size: 14px;">
					
				</div>
			</div>
		</ul>
		
		<hr style = "height: 1px; background-color: black;"/>
		<!-- 작성자 끝 -->
		
		<div style="padding-top:10px; padding-bottom:40px;">
			<div style="width: 5%;  display: inline-block; float: left;">
				<h4 style="padding-left:10px;">댓글</h4>
			</div>
			<div style= "padding-left:10px; width: 30%; float: left; overflow: hidden">
				<img src="" class="LikeBtn" style="width:18px; margin-top:-5px;"></img>
				<li style="display: inline;  font-size: 12px;" > 좋아요</li>
				<li style="display: inline;  font-size: 12px;" id="menu_like_hit"></li>
				<li style="display: inline;  font-size: 12px;" > 댓글</li>
				<li style="display: inline;  font-size: 12px;" id="menu_comment_hit"></li>
			</div>
		</div>
		
		
		<!-- 댓글 -->
		<h4>댓글</h4>
		<div>
			<c:if test="${logStatus=='Y'}"><!-- 로그인한 경우 댓글쓰기 폼 보여주기 -->
				<div style="border: 1px solid gray;border-radius: 10px;padding : 10px 10px; margin-bottom: 30px; "><!-- 댓글 입력 테두리 -->
					<form method="post" id="menucommentForm">
						<p style="padding-left: 10px; font-size: 12px;">		${sessionScope.logId}님</p>
						<input type="hidden" name="menu_no" value="${dto.menu_no}"/><!-- 원글 글번호 -->
						<textarea name="menu_comment_text" id="menu_comment_text"  placeholder="댓글을 남겨보세요"
							style="padding: 10px 0px 0px 10px;
							width: 100%;
							box-sizing: border-box;
							border: none;
							border-radius: 3px;
							font-size: 12px;
							resize : none;"></textarea>
						<!-- 댓글 등록 버튼 -->
						<div class="commHeader" style="margin-bottom: 20px; margin-top: 10px; overflow: hidden;">
							<button type="submit" class="btn btn-outline-dark" style=" float: right">
								<img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px">
								댓글등록
							</button>
						</div>
					</form>
				</div>
			</c:if>
			<!-- 댓글리스트 -->
			<ul id ="menucommentList">
		
			</ul>
		</div>
		<div class="topBtns">
		<a href="menu?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-light" id="listBtn">목록</a>
	</div>
	</div>
	
	
	
</div>
<div style="padding-bottom:100px;"></div>