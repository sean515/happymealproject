<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style>
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
	#recipe_comment_text{
		width:100%;
		height:auto;
		border: none;
		outline: none;
		
	}
	#recipecommentList>li{
		padding:10px 0;
		border-bottom:1px solid #ddd;
	}
	a:link{
		text-decoration:none;
	}
	
</style>
<script>
	function recipeDel(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href= "recipeDel?recipe_no=${dto.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>";
		}
	}
	
	$(function(){
		//ajax로 전체 댓글 수 표시
		function count_comment_hit(){
			$.ajax({
				url:"/happy/recipe_count_comment_hit",
				data:{recipe_no:${dto.recipe_no}},
				type:"GET",
				dataType:"json",

				success:function(comment){	
					var tag = "";

					$(comment).each(function(i, cDTO){
						tag += cDTO.recipe_comment_hit;
					});
					
					$("#recipe_comment_hit").html(tag);
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		

		//댓글 목록 ajax로 해당 게시물에 대한 모든 댓글을 선택하여 뷰에 표시하는 함수 -------------
		function recipecommentList(){
			$.ajax({
				url:"/happy/recipecommentList",
				data:{recipe_no:${dto.recipe_no}},
				type:"GET",
				dataType:"json",
				success:function(comment1){	
					var tag = "";
					$(comment1).each(function(i, cDTO){
						tag += "<li><div><b>"+cDTO.userid+" ("+cDTO.recipe_comment_date+")</b>";
						//본인이 쓴 댓글 일때
						if(cDTO.userid == '${logId}'){ //cDTO.userid(클라이언트 실행 ) = 'goguma' ${logId}(서버에서 실행)goguma
							tag +="<input type='button' value='Edit'/>";
							tag +="<input type='button' value='Del' title='"+cDTO.recipe_comment_no+"'/>";
							
							tag += "<p style='white-space: pre-line'>"+cDTO.recipe_comment_text+"</p></div>";
							
							//댓글 수정폼을 만들기 - 기존댓글과, 댓글번호(c_no)가 폼에 있어야 한다.
							tag += "<div style='display:none'>"
							tag += "<form method='post'>"
							tag += "<input type='hidden' name='recipe_comment_no' value='"+cDTO.recipe_comment_no+"'/>";//댓글일련번호
							tag += "<textarea name='recipe_comment_text' style='width:400px; height:80px;'>"+cDTO.recipe_comment_text+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기'>"
							tag += "</form>"
							tag += "</div>"
							
						}else{
							tag += "<p>"+cDTO.recipe_comment_text+"</p></div>";
						}
	
						tag += "</li>"
					});
					
					$("#recipecommentList").html(tag);
					count_comment_hit();
				},error:function(e){
					console.log(e.responseText)
					console.log("test")
				}
			});
		}
		
		//댓글쓰기---------------------------------------------------------------------------------
		$("#recipecommentForm").submit(function(){
			//코멘트가 있을 때 ajax실행
			if($("#recipe_comment_text").val()==""){
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
				url:"/happy/recipecommentSend",
				data: query,
				type: "POST",
				success:function(result){
					console.log(result);
					console.log("test2");
					
					//기존에 입력한 댓글 지우기
					$("#recipe_comment_text").val("");
					
					//댓글목록을 다시 뿌려준다.
					recipecommentList();
					count_comment_hit();
				},error:function(e){
					console.log(e.responseText)
				}
			});
			return false; //form의 기본 이벤트 때문 다음 실행이
		});
		//댓글 수정폼 보여주기 : 본인이 쓴 글일 때 Edit버튼을 클릭하면 글 내용은 숨기고, 폼을 보여준다.
		$(document).on('click','#recipecommentList input[value=Edit]',function(){
			
			//var dom = $(document).cjildren("li");
			//기존의 열어놓은 폼이나, 숨겨놓은 댓글내용을 처리하고
			//$("#commentList>li>div:nth-first").css('display','block');
			//$("#commentList>li>div:nth-last").css('display','none');
			$(this).parent().css("display","none");	//댓글 숨기고
			$(this).parent().next().css("display","block");//폼 보여주고
			
		});
		//댓글 수정 - DB
		$(document).on('click','#recipecommentList input[value=댓글수정하기]',function(){
			//데이터 준비
			console.log("test1");
			var params = $(this).parent().serialize();// c_no=34&coment=test
			//console.log("params",params);
			var url = "/happy/recipecommentEdit";
			console.log("test2");
			
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(result){
					console.log(result);
					//댓글목록을 다시 뿌려주기
					recipecommentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});	
			
			return false;
		});
			//댓글 삭제
			$(document).on('click','#recipecommentList input[value=Del]',function(){
				if(confirm("댓글을 삭제할까요?")){
					var params = "recipe_comment_no=" +$(this).attr("title");
					console.log(params);
					var url ="/happy/recipecommentDelete";
					
					$.ajax({
						url:url,
					data:params,
					success:function(result){
						console.log(result);
						//댓글목록을 다시 뿌려주기
						recipecommentList();
					},error:function(error){
						console.log(error.responseText);
					}
				})
				}
		});
			
			
		//댓글 목록 뿌려주기 -- 처음에 글내용 보기로 오면 댓글 보여주기
		recipecommentList();
		
	});//jquery
	
</script>



<div class="container">
	
	<!-- 배너 -->
	<div class= "banner">
		<img src="img/banner.png" width="100%" height="150px"/>
	</div>
	
	<div class="topBtns">
		<a href="recipe?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-light" id="listBtn">목록</a>
	</div>
	
	<div class="articleBox">
		<div class="articleHeader">
			<div class="articleTitle">
				<!-- 제목 -->
				<h1>${dto.recipe_name }</h1>
			</div>
			
			<div class="articleInfo row">
				<div class="col-8">
					<img src="img/loginImg.png" width="60px" height="60px"/>
					<span style="font-size:24px">${dto.username}</span>
					<br/>
					<span>${dto.recipe_date }&nbsp;&nbsp;&nbsp;조회&nbsp;&nbsp;${dto.recipe_hit }</span>
			
				</div>
				<div class="col-4">
					<c:if test="${logId==dto.userid }">
						<a href="recipeEdit?recipe_no=${dto.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-secondary">수정</a>
						<a href="javascript:recipeDel()" class="btn btn-secondary">삭제</a>
					</c:if>		
				</div>
			</div>
		</div>	
	
		<hr style="height: 3px; background: black"/>
			
		<div class="articleContentBox">
			
			<div id="ingredients">
				<h2>재료</h2>
				<pre>${dto.recipe_parts }</pre>
			</div>
			
			<div id="manual">
				<ul >			
					<li>${dto.recipe_manual01 }</li>
				</ul>
			</div>
		</div>
		
		<div class="articleWriter">
			<div>
				<ul>
					<li style="display: inline;float :left;"><img src="img/loginImg.png" width="50px" height="50px"/></li>
					<li style="display: inline; font-size: 15px; position: relative; left:10px;"><a href="recipe?searchKey=username&searchWord=${dto.username}"><b>${dto.username}</b> 님의 게시글 더보기</a></li>
				</ul>
			</div>
		
			<div style= "overflow: hidden">
				<div style= "width: 30%; float: left; overflow: hidden">
					<ul>
						<li style="display: inline;">좋아요</li>
						<li style="display: inline;">0</li>
						<li style="display: inline;">댓글</li>
						<li style="display: inline;" id="count_comment_hit"></li>
					</ul>
				</div>
		
				<div style="clear:right;text-align:right; width: 30%; float: right;">
					<a href="test">신고</a>
				</div>
			</div>
		</div>
		
		<hr style = "height: 1px; background-color: black;"/>
		
		
		<!-- 댓글 -->
		<h4>댓글</h4>
		<div>
			<c:if test="${logStatus=='Y'}"><!-- 로그인한 경우 댓글쓰기 폼 보여주기 -->
				<div style="border: 1px solid gray;border-radius: 10px;padding : 10px 10px; margin-bottom: 30px; "><!-- 댓글 입력 테두리 -->
					<form method="post" id="recipecommentForm">
						<p>		${dto.username }님</p>
						<input type="hidden" name="recipe_no" value="${dto.recipe_no}"/><!-- 원글 글번호 -->
						<textarea name="recipe_comment_text" id="recipe_comment_text"  placeholder="댓글을 남겨보세요"
							style="padding: 10px;
							width: 100%;
							box-sizing: border-box;
							border: none;
							border-radius: 5px;
							font-size: 16px;
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
			<ul id ="recipecommentList">
		
			</ul>
		</div>
		
	</div>
	
	<div class="topBtns">
		<a href="recipe?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-light" id="listBtn">목록</a>
	</div>
	
</div>