<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.resContainer {
		display: flex;
		justify-content:flex-end;
		flex-direction: row;
		height: 2000px;
	}
	
	.resContent {
		width: 1200px;
		padding: 0 15px;
	}
	
	.resSide {
		width: 366.5px;
	}
	
	.resInfo, .resReview {
		width: 100%;
		margin: 20px auto 0;
	}
	
	.EditRequest {
		float: right;
	}
	
	th {
		width: 100px;
	}
	
	.update_date {
		float: right;
	}
	.modal {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal.show {
        display: block;
    }

    .modal_body {
        position: fixed;
        top: 50%;
        left: 50%;
        width: 450px;
        height: 550px;
        padding: 40px;
        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
        transform: translateX(-50%) translateY(-50%);
    }
    .requestHeader{
    	text-align:center;
    }
	.requestBody{
		margin: 50px auto;
	}
	.requestType{
		margin-bottom:30px;
	}
	.requestBtn{
		background-color: #8aa1a1;
		border:none;
		color:white;
		border-radius: 5px;
		width:100%;
		height:35px;
		font-size: 14pt;
	}
	#res_comment_text{
		width:100%;
		height:auto;
		border: none;
		outline: none;
		
	}
	#resCommentList>li{
		padding:10px 0;
		border-bottom:1px solid #ddd;
	}
	#res_Comment_text{
		padding: 10px;
		width: 100%;
		box-sizing: border-box;
		border: none;
		border-radius: 5px;
		font-size: 16px;
		resize : none;
	}
	#resCommentForm fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	}
	#resCommentForm fieldset legend{
	    text-align: right;
	}
	#resCommentForm input[type=radio]{
	    display: none;
	}
	#resCommentForm label{
	    font-size: 2em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#resCommentForm label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#resCommentForm label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#resCommentForm input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#commentStar > span{
		color: transparent;
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	
</style>
<script>
	//좋아요
	$(function(){
		//좋아요 수
		function res_like_hit(){
			$.ajax({
				url:"/happy/res_count_like_hit",
				data:{res_no:${dto.res_no}},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					var tag = "";

					$(comment).each(function(i, rDTO){
						tag += rDTO.res_like_hit;
					});
					
					$("#res_like_hit").html(tag);
				},error:function(e){
					console.log(e.responseText)
				}
			});
		}
		
		//ajax로 좋아요 상태 확인
		function res_like_status(){
			$.ajax({
				url:"/happy/resLike",
				data:{userid:'${dto.userid}',
					res_no:${dto.res_no}
					},
				type:"GET",
				dataType:"json",
				success:function(comment){	
					$(comment).each(function(i, lDTO){
						if(lDTO.result>0){
							$('.LikeBtn').attr('src', 'img/heart.PNG');
						}
						else{
							$('.LikeBtn').attr('src', 'img/grayheart.PNG');
						}
					});
				},error:function(e){
					console.log(e.responseText)
				}
			});
		}
	
		$('.LikeBtn').click(function() {
			//로그인상태 확인  
			if(${logStatus!='Y'}){
				alert("로그인후 이용가능합니다");
				return false;
			}
			// 버튼의 현재 값이 "좋아요"인 경우
			if ($(this).attr('src') === "img/heart.PNG") {
			  	// AJAX 요청을 보내서 서버에 좋아요를 추가하는 로직 구현
			    $.ajax({
			        method: "GET",
			        url: "/happy/delResLike", // 좋아요 취소
			        data: { 
			    	    userid:'${dto.userid}',
					    res_no:'${dto.res_no}' 
					},
					type:"GET",
					dataType:"json",
			        success: function(response) {
			        	res_like_hit();
			            // 요청이 성공하면 버튼의 텍스트를 "좋아요 취소"로 변경
			            $('.LikeBtn').attr('src', 'img/grayheart.PNG');
			        },
			        error: function(xhr, status, error) {
			            // 요청이 실패한 경우 에러 핸들링 로직 구현
			        }
			    });
			} else { // 버튼의 현재 값이 "좋아요인 경우
			    $.ajax({
			        method: "GET",
			        url: "/happy/resLikeup", 
			        data: { userid:'${dto.userid}',
						  res_no:'${dto.res_no}'
					}, 
					type:"GET",
					dataType:"json",
			      	success: function(response) {
			      		res_like_hit();
			      		$('.LikeBtn').attr('src', 'img/heart.PNG');
			        	alert('좋아요를 선택하셨습니다');
	
			        },
			        error: function(xhr, status, error) {
			            // 요청이 실패한 경우 에러 핸들링 로직 구현
			        }
			    });
			}
		});
		res_like_hit()
		res_like_status();
	});//jquery


	//정보수정제안
	$(function(){
		$("#resEditReq").submit(function(){
			event.preventDefault();
			
			if(document.querySelector('input[name="res_edit_type"]:checked')===null){
				alert("요청 유형을 선택하세요");
				return false;
			}
			if(document.querySelector('textarea[name="res_edit_text"]').value===""){
				alert("요청 내용을 입력하세요");
				return false;
			}
			
			if(${logStatus!='Y'}){
				alert("로그인후 이용가능합니다");
				return false;
			}
			
			var url = 'resEditReq';
			var params = $("#resEditReq").serialize();
			
			$.ajax({
				url : url,
				data : params,
				type: 'POST',
				success:function(result){
					if(result>0){
						alert('요청 성공하였습니다');
						modal.classList.toggle('show');
						body.style.overflow='auto';
					}else{
						alert('요청 실패하였습니다');
					}
				},error:function(){
					console.log(e.responseText);
				}
			});
		});
	});
	
	//리뷰========================================================================================
	$(function(){
		//ajax로 전체 리뷰 수 표시
		function resCommentCount(){
			$.ajax({
				url:"resCommentCount",
				data:{res_no:${dto.res_no}},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					var tag = "";

					$(comment).each(function(i, DTO){
						tag += DTO.resCommentCount;
					});
					
					$("#resCommentCount").html(tag);
				},error:function(e){
					console.log(e.responseText)
				}
			});
		}
		

		//리뷰 목록 --- ajax로 해당 게시물에 대한 모든 리뷰를 선택하여 뷰에 표시하는 함수 -------------
		function resCommentList(){
			
			$.ajax({
				url:"resCommentList",
				data:{res_no:${dto.res_no}},
				type:"GET",
				dataType:"json",
				success:function(comment1){	
					var tag = "";
					$(comment1).each(function(i, DTO){
						
						tag += "<li><div style='display:block'><b>"+DTO.nickname+" ("+DTO.res_comment_date+")</b>";
						tag +="<div id='commentStar'>";
						for(let i=0; i<DTO.res_star; i++){
							tag += "<span>★</sapn>";
						}
						tag +="</div>";
						//본인이 쓴 리뷰 일때
						if(DTO.userid == '${logId}'){ //DTO.userid(클라이언트 실행 ) = 'goguma' ${logId}(서버에서 실행)goguma
							tag +="<input type='button' value='Edit'/>";
							tag +="<input type='button' value='Del' title='"+DTO.res_comment_no+"'/>";
							
							tag += "<p style='white-space: pre-line'>"+DTO.res_comment_text+"</p></div>";
							
							
							//리뷰 수정폼을 만들기 - 기존리뷰와, 리뷰번호(res_no)가 폼에 있어야 한다.
							tag += "<div style='display:none'>"
							tag += "<form method='post' id='resCommentEditForm'>"
							tag += "<input type='hidden' name='res_comment_no' value='"+DTO.res_comment_no+"'/>";//리뷰일련번호
							tag += "<textarea name='res_comment_text' style='width:400px; height:80px;'>"+DTO.res_comment_text+"</textarea>";
							tag += "<input type='submit' value='리뷰수정하기'/>"
							tag += "<input type='button' name='editCancel' value='취소'/>"
							tag += "</form>"
							tag += "</div>"
							
							
							
							
						}else{
							tag += "<p>"+DTO.res_comment_text+"</p></div>";
						}
	
						tag += "</li>"
					});
					
					$("#resCommentList").html(tag);
					resCommentCount();
				},error:function(e){
					console.log(e.responseText)
				}
			});
		}
		
		//리뷰쓰기---------------------------------------------------------------------------------
		$("#resCommentForm").submit(function(){
			//코멘트가 있을 때 ajax실행
			if(${logStatus!='Y'}){
				alert("로그인후 이용가능합니다");
				return false;
			}
			
			if($("#res_comment_text").val()==""){
				alert("리뷰 내용을  입력 후 등록하세요.");
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
				url:"resCommentSend",
				data: query,
				type: "POST",
				success:function(result){
					//console.log(result);
					
					//기존에 입력한 리뷰 지우기
					$("#res_comment_text").val("");
					
					//리뷰목록을 다시 뿌려준다.
					resCommentList();
					resCommentCount();
				},error:function(e){
					console.log(e.responseText)
				}
			});
			return false; //form의 기본 이벤트 때문 다음 실행이
		});
		//리뷰 수정폼 보여주기 : 본인이 쓴 글일 때 Edit버튼을 클릭하면 글 내용은 숨기고, 폼을 보여준다.
		$(document).on('click','#resCommentList input[value=Edit]',function(){
			
			//var dom = $(document).cjildren("li");
			//기존의 열어놓은 폼이나, 숨겨놓은 댓글내용을 처리하고
			//$("#commentList>li>div:nth-first").css('display','block');
			//$("#commentList>li>div:nth-last").css('display','none');
			$(this).parent().css("display","none");	//리뷰 숨기고
			$(this).parent().next().css("display","block");//폼 보여주고
		});
		//리뷰 수정 취소(수정폼 가리기)
		$(document).on('click','#resCommentEditForm input[name=editCancel]',function(){
			
			$(this).parent().css("display","none");	//폼 숨기고
			$(this).parent().prev().css("display","block");//리뷰 보여주고
		});
		
		//리뷰 수정 - DB
		$(document).on('click','#resCommentList input[value=리뷰수정하기]',function(){
			//데이터 준비
			var params = $(this).parent().serialize();// c_no=34&coment=test
			var url = "resCommentEdit";
			
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(result){
					//console.log(result);
					//리뷰목록을 다시 뿌려주기
					resCommentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});	
			
			return false;
		});
			//리뷰 삭제
			$(document).on('click','#resCommentList input[value=Del]',function(){
				if(confirm("리뷰를 삭제할까요?")){
					var params = "res_comment_no=" +$(this).attr("title");
					console.log(params);
					var url ="resCommentDel";
					
					$.ajax({
						url:url,
					data:params,
					success:function(result){
						console.log(result);
						//리뷰목록을 다시 뿌려주기
						resCommentList();
					},error:function(error){
						console.log(error.responseText);
					}
				})
				}
		});
			
			
		//리뷰 목록 뿌려주기 -- 처음에 글내용 보기로 오면 리뷰 보여주기
		resCommentList();
		
	});//jquery
</script>
<div class="modal">
	<div class="modal_body">
		<form method="post" id="resEditReq">
			<div class="requestHeader">
				<h2>정보 수정 제안</h2>
			</div>
			<div class="requestBody">
				<div class="requestType">
					<span>요청 유형</span>
						<input type="hidden" name="res_no" value="${dto.res_no }">
					<div class="form-check">
					    <input class="form-check-input" type="radio" name="res_edit_type" value="1" id="flexRadioDefault1">
					    <label class="form-check-label" for="flexRadioDefault1">수정</label>
					</div>
					<div class="form-check">
					    <input class="form-check-input" type="radio" name="res_edit_type" value="2" id="flexRadioDefault2">
					    <label class="form-check-label" for="flexRadioDefault2">삭제</label>
					</div>
				</div>
				<div class="requestText">
					<div class="mb-3">
					    <label for="exampleFormControlTextarea1" class="form-label">요청 내용</label>
					    <textarea class="form-control" name="res_edit_text" id="exampleFormControlTextarea1" 
					    	rows="5" value="" placeholder=
					    	"내용을 입력해주세요&#13;&#10;(예시)&#13;&#10;A업체 B업체로 상호변경하였습니다. 수정해주세요.&#13;&#10;A업체 폐업하였습니다. 삭제해주세요."
					    	></textarea>
					</div>
				</div>
				<input type="hidden" name="res_status" value="4"/>
			</div>
			<div class="requestFooter">
				<button class="requestBtn">요청</button>
			</div>
		</form>
	</div>
</div>

<!-- 배너 -->
<div class= "banner">
	<img src="img/banner.png" width="100%" height="150px"/>
</div>

<div class="resContainer">
	<div class="resContent">
		<div class="inner">
			<div class="resInfo">
				<header>
					<div class="resTitle">
						<span class="title">
							<h1>${dto.res_name }</h1>
							<p>${dto.res_type }</p>
						</span>
					</div>
					<div class="EditRequest">
						<button class="btn-open-popup">정보수정제안</button>
					</div>
					<div class="Status">
						<span>조회수 ${dto.res_hit }</span>
						<span>좋아요</span>
						<img src="" class="LikeBtn" style="width:18px"></img>
						<span id="res_like_hit"></span>
						<span>리뷰</span>
						<span id="resCommentCount"></span>
					</div>
				</header>
				<hr style="height: 1px; background: black"/>
				<table class="resDetail">
					<tbody>
						<tr>
							<th>주소</th>
							<td>${dto.res_addr }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${dto.res_tel }</td>
						</tr>
						<tr>
							<th>식당구분</th>
							<td>${dto.res_type}</td>
						</tr>
						<tr>
							<th>음식종류</th>
							<td>${dto.res_category }</td>
						</tr>
						<tr>
							<th>영업시간</th>
							<td>${dto.res_time }</td>
						</tr>
						<tr>
							<th>특이사항</th>
							<td>${dto.res_note }</td>
						</tr>
					</tbody>
				</table>
				<p class="update_date">업데이트 : ${dto.res_date }</p>
			</div>
			<div class="resReview">
				<!-- 리뷰 -->
				<div>
					<c:if test="${logStatus=='Y'}"><!-- 로그인한 경우 댓글쓰기 폼 보여주기 -->
						<h4>리뷰</h4>
						<div style="border: 1px solid gray;border-radius: 10px;padding : 10px 10px; margin-bottom: 30px; "><!-- 리뷰 입력 테두리 -->
							<form method="post" id="resCommentForm">
								<p>님</p>
								<input type="hidden" name="res_no" value="${dto.res_no}"/><!-- 원글 글번호 -->
								<fieldset>
									<span class="text-bold">별점을 선택해주세요</span>
									<input type="radio" name="res_star" value="5" id="rate1"><label
										for="rate1">★</label>
									<input type="radio" name="res_star" value="4" id="rate2"><label
										for="rate2">★</label>
									<input type="radio" name="res_star" value="3" id="rate3"><label
										for="rate3">★</label>
									<input type="radio" name="res_star" value="2" id="rate4"><label
										for="rate4">★</label>
									<input type="radio" name="res_star" value="1" id="rate5"><label
										for="rate5">★</label>
								</fieldset>
								<textarea name="res_comment_text" id="res_comment_text"  placeholder="리뷰를 작성해주세요"
								></textarea>
								<!-- 댓글 등록 버튼 -->
								<div class="resHeader" style="margin-bottom: 20px; margin-top: 10px; overflow: hidden;">
									<button type="submit" class="btn btn-outline-dark" style=" float: right">
										<img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px">
										리뷰등록
									</button>
								</div>
							</form>
						</div>
					</c:if>
					<!-- 리뷰리스트 -->
					<ul id ="resCommentList">
				
					</ul>
				</div>
			</div>
		</div>
	</div><!-- resContent end -->
	<div class="resSide">
		<!-- 지도 -->
		<div id="map" style="width:100%;height:450px;"></div>
	</div><!-- resSide end -->
	
</div><!-- resContainer end -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46d3750493a46ebe690cd8ac9d3be958&libraries=services"></script>
<script>
	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	const btnOpenPopup = document.querySelector('.btn-open-popup');
	
	btnOpenPopup.addEventListener('click', () => {
	  modal.classList.toggle('show');
	
	  if (modal.classList.contains('show')) {
	    body.style.overflow = 'hidden';
	  }
	});
	
	modal.addEventListener('click', (event) => {
	  if (event.target === modal) {
	    modal.classList.toggle('show');
	
	    if (!modal.classList.contains('show')) {
	      body.style.overflow = 'auto';
	    }
	  }
	});
	
	
	/* 지도 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(${dto.res_latitude}, ${dto.res_longitude}), // 지도의 중심좌표
			level: 6, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${dto.res_latitude}, ${dto.res_longitude});
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

</script>