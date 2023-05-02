<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

</style>
<div class="container"><br/><br/>
	<h1>내가 작성한 댓글 리스트</h1>
				<form action="/happy/myPage/userWriteReply" method="get">
			<div id="btn-group">
				<input type="hidden" name="amenu_type_no" value="${vo.amenu_type_no}">
				<button type="submit" id="btn1" class="btn" name="cate"
					value="1">레시피</button>
				<button type="submit" id="btn2" class="btn" name="cate"
					value="2">식단</button>
				<button type="submit" id="btn3" class="btn" name="cate" 
					value="3">커뮤니티</button>
			</div>
		</form>
	<c:if test="${param.cate == '1' or param.cate==null}">
		<!-- 소재목 -->
	<div class="pFilter">
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp레시피&nbsp&nbsp</h1>
	<hr/>
			<c:forEach var="bDTO" items="${list}">	
				<div class="staff">
					<ul>
						<li><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }">${bDTO.recipe_name }</a></li>
						<li><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }"> ${bDTO.recipe_comment_date }</a></li>
						<li><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }"> ${bDTO.recipe_comment_text }</a></li>
					</ul>	
					<hr/>	
			</div>
		</c:forEach>
	
	</div>
	</div>
	</c:if>
	<c:if test="${param.cate == '2'}">
		<!-- 소재목 -->
	<div class="pFilter">
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp식단&nbsp&nbsp</h1>
		<hr/>
			<c:forEach var="bDTO" items="${list}">	
				<div class="staff">
					<ul>
						<li><a href="/happy/menuView_user?menu_no=${MenuUserDTO.menu_no}">${bDTO.menu_title }</a></li>
						<li><a href="/happy/menuView_user?menu_no=${MenuUserDTO.menu_no}"> ${bDTO.menu_comment_date }</a></li>
						<li><a href="/happy/menuView_user?menu_no=${MenuUserDTO.menu_no}"> ${bDTO.menu_comment_text }</a></li>
					</ul>	
					<hr/>	
			</div>
		</c:forEach>
	</div>
	</div>
	</c:if>
	<c:if test="${param.cate == '3'}">
		<!-- 소재목 -->
	<div class="pFilter">
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp커뮤니티&nbsp&nbsp</h1>
		<hr/>
			<c:forEach var="bDTO" items="${list}">	
				<div class="staff">
					<ul>
						<li><a href="/happy/commView?comm_no=${bDTO.comm_no }">${bDTO.comm_title }</a></li>
						<li><a href="/happy/commView?comm_no=${bDTO.comm_no }"> ${bDTO.comm_comment_date }</a></li>
						<li><a href="/happy/commView?comm_no=${bDTO.comm_no }"> ${bDTO.comm_comment_text }</a></li>
					</ul>	
					<hr/>	
			</div>
		</c:forEach>
	</div>
	</div>
	</c:if>
</div>