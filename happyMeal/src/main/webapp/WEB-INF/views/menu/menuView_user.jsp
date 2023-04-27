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

	
</script>



<div class="container">
	
	<!-- 배너 -->
	<div class= "banner">
		<img src="img/banner.png" width="100%" height="150px"/>
	</div>
	
	<div class="topBtns">
		<a href="menu_user?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-light" id="listBtn">목록</a>
	</div>
	
	<div class="articleBox">
		<div class="articleHeader">
			<div class="articleTitle">
				<!-- 제목 -->
				<h1>${dto.menu_title }</h1>
			</div>
			
			<div class="articleInfo row">
				<div class="col-8">
					<img src="img/loginImg.png" width="60px" height="60px"/>
					<span style="font-size:24px">${dto.username}</span>
					<br/>
					<span>${dto.menu_date }&nbsp;&nbsp;&nbsp;조회&nbsp;&nbsp;${dto.menu_hit }</span>
			
				</div>
				<div class="col-4">
					<c:if test="${logId==dto.userid }">
						<a href="menuEdit?recipe_no=${dto.menu_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" class="btn btn-secondary">수정</a>
						<a href="javascript:recipeDel()" class="btn btn-secondary">삭제</a>
					</c:if>		
				</div>
			</div>
		</div>	
	
		<hr style="height: 3px; background: black"/>
			
		<div class="articleContentBox">
			
			<div id="ingredients">
				<h2>타이틀</h2>
				<pre>${dto.amenu_type_no }</pre>
			</div>
			
			<div id="manual">
				<ul >			
					<li>${dto.menu_text }</li>
				</ul>
			</div>
		</div>
		
		<div class="articleWriter">
			<div>
				<ul>
					<li style="display: inline;float :left;"><img src="img/loginImg.png" width="50px" height="50px"/></li>
					<li style="display: inline; font-size: 15px; position: relative; left:10px;"><a href="menu_user?searchKey=username&searchWord=${dto.username}"><b>${dto.username}</b> 님의 게시글 더보기</a></li>
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
						<input type="hidden" name="recipe_no" value="${dto.menu_no}"/><!-- 원글 글번호 -->
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