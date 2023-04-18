<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="utf-8">

<style>


</style>
<script>
	/* 검색어 미입력 상태에서 검색을 진행할 때 발생하는 함수 */
	$(function(){
		$("#searchForm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색에를 입력하세요...");
				return false;
			}
			return true;
		});
	});
</script>


<div class="container">
	
	<!-- 검색 -->
	<div class="searchDiv">
		<form method="get" id="searchForm" action="recipe">
		<!-- 기간 select -->
			<select name="searchDate" class="form-select" aria-label="Default select example" style="width: auto; display: inline; white-space:nowrap;">
				<option value="">전체기간 </option>
				<option value="">오늘 </option>
				<option value="">이번주 </option>
			</select>
		<!-- 검색 시 제목 작성자 글내용 선택 -->
				<select name="searchKey"class="form-select" aria-label="Default select example" style=" display: inline; width: auto">
				<option value="subject">제목 </option>
				<option value="username">작성자 </option>
				<option value="content">글내용 </option>
			</select>
			<input type="text" name="searchWord" id="searchWord" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 200px;display: inline;"/>
			<input type="submit" value="검색"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 80px;display: inline; background-color: #03C75A; color: white"/>
		</form>
	</div>
	
	

	<!-- 소재목 -->
	<h1 style="display: inline; font-size: 48px"><b>&nbsp레시피&nbsp&nbsp</b></h1>
	
	<hr style="height: 3px; background: black"/>
	
	<div>
	<!-- 게시글 row 상단 -->
	<ul class="recipe" style="overflow: hidden; padding-left: 0;">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>등록일</li>
		
		<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
		
		<c:forEach var="bDTO" items="${list}">
		
			<li>${recordNum }</li><!-- bDTO.no  --> 
			<!-- 글 내용 보기 레코드 번호, 현재 페이지, 검색어가 있으면 검색키, 검색어를 가져가야 함. -->
			<li style="color: black;"><a href="recipeView?recipe_no=${bDTO.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.recipe_name }</a></li>
			<li><img src="${bDTO.recipe_thumbnail }"/></li>
			<li>${bDTO.username }</li>
			<li>${bDTO.recipe_hit }</li>
			<li>${bDTO.recipe_date }</li>
			<c:set var="recordNum" value="${recordNum-1 }"></c:set>
		</c:forEach>
		
	</ul>
	</div>
	
	
	<div class="recipeHeader" style="margin-bottom: 20px; margin-top: 10px">
	<!-- <a href="recipeWrite">글쓰기</a> -->
	<button type="button" class="btn btn-outline-dark" onclick="location.href='recipeWrite'"
	style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button></div>
	
	<!-- 페이징 -->
	<div class="pagingDiv">
		<ul style="margin-bottom: 50px">
		<!-- 이전페이지       : nowPage를 기준으로 -->
			<c:if test="${vo.nowPage==1}"> <!-- 현재페이지가 첫번쨰 페이지일때 -->
				<li></li>
			</c:if>
			<c:if test="${vo.nowPage>1}"> <!-- 현재페이지가 첫번째 페이지가 아닐때 -->
				<li><a href="recipe?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
			</c:if>
			<!-- 페이지 번호 -->
			
			<c:forEach var="p" begin="${vo.startPageNum}" end="${vo.startPageNum+vo.onePageNumCount-1}">
				<c:if test="${p<=vo.totalPage}"> <!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
				<!-- 현재페이지 표시하기 -->
				<c:if test="${p==vo.nowPage}">
				<li style="background:#ddd;">
				</c:if>
				<c:if test="${p!=vo.nowPage}">
				<li>
				</c:if>
				<a href="recipe?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음페이지 -->
			<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
				<li><a href="recipe?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">다음</a></li>
			</c:if>
			<c:if test="${vo.nowPage==vo.totalPage}"><!-- 현재페이지가 마지막일때 -->
				<li></li>
			</c:if>
		</ul>
	</div>
	
		
	
  <br>
	
</div>