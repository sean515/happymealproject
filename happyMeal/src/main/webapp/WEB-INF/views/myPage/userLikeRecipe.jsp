<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

</style>
<div class="container"><br/><br/>
	<h1>즐겨찾기한 레시피 리스트</h1>
		<ul>
			<li>
			<c:set var="recordNum"
				value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
				
				<c:forEach var="RecipeDTO" items="${list}">
				<a href="//happy/recipeView?recipe_no=${RecipeDTO.recipe_no}"><img src="/happy/uploadfile/${RecipeDTO.recipe_thumbnail}" width="100" height="100" align="left"/>&emsp;&emsp;&emsp;</a>
				식단명 : ${RecipeDTO.recipe_name}<br/>&emsp;&emsp;&emsp;
				작성일 : ${RecipeDTO.recipe_date}<br/>&emsp;&emsp;&emsp;
				작성자 : ${RecipeDTO.userid}&emsp;&emsp;&emsp;
				<hr class="hr3"/>
				
			</c:forEach>
			</li>
		</ul>
</div>