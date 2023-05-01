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
		<a href="menu">목록</a>
	</div>
	
	<div class="articleBox">
		<div class="articleHeader">
		
			<div class="articleTitle">
				<!-- 제목 -->
			</div>
			
			<div class="articleInfo row">
				<div class="col-8">
				</div>
				<div class="col-4">
				</div>
			</div>

	<style>
		.img1{
		width: 25%;
		height:150px;
		margin: 5px;
		}
	</style>
			<c:forEach var="nDTO" items="${list}">

				<p><h5>식단:</h5> ${nDTO.amenu_text }</p>
				<img class="img1" alt="" src="/happy/uploadfile/amenu/${nDTO.amenu_img1 }" <c:if test="${nDTO.amenu_img1 == null}"> style="visibility: hidden;"</c:if>>
				<img class="img1" alt="" src="/happy/uploadfile/amenu/${nDTO.amenu_img2 }" <c:if test="${nDTO.amenu_img2 == null}"> style="visibility: hidden;"</c:if>>
				<img class="img1" alt="" src="/happy/uploadfile/amenu/${nDTO.amenu_img3 }" <c:if test="${nDTO.amenu_img3 == null}"> style="visibility: hidden;"</c:if>>
				<img class="img1" alt="" src="/happy/uploadfile/amenu/${nDTO.amenu_img4 }" <c:if test="${nDTO.amenu_img4 == null}"> style="visibility: hidden;"</c:if>>
				<img class="img1" alt="" src="/happy/uploadfile/amenu/${nDTO.amenu_img5 }" <c:if test="${nDTO.amenu_img5 == null}"> style="visibility: hidden;"</c:if>>
				<img class="img1" alt="" src="/happy/uploadfile/amenu/${nDTO.amenu_img6 }" <c:if test="${nDTO.amenu_img6 == null}"> style="visibility: hidden;"</c:if>>
				
				
				<hr/>
				<br/>
			</c:forEach>
		</div>		
		<hr style="height: 3px; background: black"/>		
		<div class="articleContentBox">		
			<div id="manual">

			</div>
		</div>
		
		<div class="articleWriter">

		

		
				<div style="clear:right;text-align:right; width: 30%; float: right;">
					<a href="test">신고</a>
				</div>
			</div>
		</div>
		
		<hr style = "height: 1px; background-color: black;"/>
		
		
		<!-- 댓글 -->
		
	</div>
	
	<div class="topBtns">
		<a href="menu">목록</a>
	</div>
	
</div>