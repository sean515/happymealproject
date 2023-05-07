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
		height:80px;
		padding:10px 0;
		display:flex;
		justify-content:flex-end;
		align-items:flex-end;
	}
	#listBtn{
		width:45px;
		height:30px;
		font-size:14px;
		margin:0;
	}
	.articleBox{
		padding:20px 20px 50px 20px;
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

	<!-- 배너 -->
	<div class= "banner" style="overflow: hidden;">
		<img src="img/bannerimg2.png" width="100%" height="300px;">
	</div>
	

<div class="container">
	
	
	
	<div class="topBtns">
		<a href="/happy/menu?amenu_type_no=3"  class="btn btn-light" id="listBtn">목록</a>
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
		width: 40%;
		height:300px;
		margin: 5px;
		}
	</style>
			<c:forEach var="nDTO" items="${list}">
				<div id="ingredients" style="padding-top:10px;border-bottom: 1px solid #ddd;">
					<h3>
						<c:if test="${nDTO.amenu_type_no == 1}">당뇨식 </c:if>
						<c:if test="${nDTO.amenu_type_no == 2}">연식 </c:if>
						<c:if test="${nDTO.amenu_type_no == 3}">일반식 </c:if>
						<c:if test="${nDTO.amenu_type_no == 4}">저염식 </c:if>
						<c:if test="${nDTO.amenu_type_no == 5}">저요오드식 </c:if>
						<c:if test="${nDTO.amenu_type_no == 6}">항암식 </c:if>
						<c:if test="${nDTO.amenu_time == 1}">아침 </c:if>
						<c:if test="${nDTO.amenu_time == 2}">점심 </c:if>
						<c:if test="${nDTO.amenu_time == 3}">저녁 </c:if>
						식단
					</h3> <p style=" line-height:30px; font-size:14px; font-family: 'Noto Sans KR', sans-serif;"> ${nDTO.amenu_text }</p>
				</div>
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
	
		<div class="articleContentBox">		
			<div id="manual">

			</div>
		</div>
		
		<div class="articleWriter">

		

		
				<div style="clear:right;text-align:right; width: 30%; float: right;">
					<a  style="font-size: 12px; float: right;" href="test">신고</a>
				</div>
			</div>
			
			
		<!-- 댓글 -->
		<div class="topBtns">
		<a href="/happy/menu?amenu_type_no=3"  class="btn btn-light" id="listBtn">목록</a>
		</div>
		
		</div>

		
	</div>
	
	
</div>

<div style="padding-bottom:100px;"></div>