<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style>
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
	function recipeDel(){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href= "recipeDel?recipe_no=${dto.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>";
		}
	}
	
	
</script>

<div class="container">

	<ul id="view"  style="margin-top: 30px; padding:0;">
		<li><a href="recipe?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" style="float:right; color: black;">전체 글 보기</a></li>
		
		<!-- 제목 -->
		<li style="margin: 30px 0"><h1>${dto.recipe_name }</h1></li>
		
		<li style="display: inline;float :left; font-size: 1.2em"><img src="img/loginImg.png" width="60px" height="60px"/></li>
		<li style="display: inline; font-size: 24px; position: relative; left:10px;">${dto.username}</li>

		<br/>
		<div style= "width: 30%; float: left;">
			<li style="display: inline; position: relative; left:10px;">${dto.recipe_date }</li>
			<li style="display: inline; position: relative; left:10px;">조회 </li>
			<li style="display: inline; position: relative; left:10px;">${dto.recipe_hit } </li>
		</div>
		<div id="menu" style="clear:right;text-align:right; width: 30%; float: right;">
		
		
		<c:if test="${logId==dto.userid }">
		<li style=" display: inline;width: auto; white-space:nowrap;"><a href="#">...</a>
			<ul>	
				<li><a href="recipeEdit?recipe_no=${dto.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">수정</a></li>
				<li><a href="javascript:recipeDel()">삭제</a></li>
			</ul>
		</c:if>		
		</div>
		<div>
			<br/>
		
			<hr style="height: 3px; background: black"/>	
			<ul>
				
					<li>${dto.recipe_manual01 }</li>
					<li><img src="${dto.recipe_manual_img01 }"/></li>
				
			</ul>
			<div style="overflow: hidden; margin-top: 50px;">
				<li style="display: inline;float :left;"><img src="img/loginImg.png" width="50px" height="50px"/></li>
				<li style="display: inline; font-size: 24px; position: relative; left:10px;">${dto.username} 님의 게시글 더보기</li>
			</div>
			<div style= "overflow: hidden">
				<div style= "width: 30%; float: left; overflow: hidden">
					<li style="display: inline;">좋아요</li>
					<li style="display: inline;">0</li>
					<li style="display: inline;">댓글</li>

				</div>
				<div style="clear:right;text-align:right; width: 30%; float: right;">
					<a href="test">신고</a>
				</div>
			</div>
		</div>
	</ul>
	<hr style = "height: 1px; background-color: black;"/>
	
</div>