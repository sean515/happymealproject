<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style>


.accordion-button {
    font-size: 15px;
    }

.btn {
    border-radius: 0;
    }

.justify-content-center {
    justify-content: center!important;
}

.page-link {
  color: #8BC34A; 
  background-color: #000;
  border-color: #444;
}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: #8BC34A ;
  border-color: #8BC34A;
 
}

.page-link:focus, .page-link:hover {
  color: #ccc;
  background-color: #222; 
  border-color: #444;
  }
  
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 7px 15px;
    text-decoration: none;
    color: #8BC34A;
    background-color: #fff;
    border: 0.5px solid #8BC34A;
    margin-left: -1px;
    font-size: 12px;
}

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

 <!-- banner -->
 <div class= "banner">
	<img src="${pageContext.request.contextPath}/img/banner.png" width="100%" height="300px"/>
</div>
<div class="container">
	<div style="padding-top: 80px;">
	<!-- 검색 -->
	<div class="searchDiv" style="padding-top:20px; float: right;">
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
			<input type="text" name="searchWord" id="searchWord" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 200px; height:24.5px; display: inline;"/>
			<input type="submit" value="검색" class="btn-cta" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 70px; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;" />
			

		</form>
	</div>

	<!-- 소재목 -->
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp레시피&nbsp&nbsp</h1>
	</div>
	<hr style="height: 1px; background: black"/>
	</div>
	<div>
	
	<!-- 아코디언 추가 -->
			
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			 	개인 맞춤 레시피 찾기
				</button>
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				<input type="checkbox" checked data-toggle="toggle" data-onstyle="primary">
				<input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
				<input type="checkbox" checked data-toggle="toggle" data-onstyle="info">
				<input type="checkbox" checked data-toggle="toggle" data-onstyle="warning">
				<input type="checkbox" checked data-toggle="toggle" data-onstyle="danger">
				<input type="checkbox" checked data-toggle="toggle" data-onstyle="default">
				
			<!-- 체크박스 -->
			<div class="list-group">
				<label class="list-group-item">
				    <input class="form-check-input me-1" type="checkbox" value="">
				    당뇨식
				</label>
				<label class="list-group-item">
				    <input class="form-check-input me-1" type="checkbox" value="">
				    고혈압
				</label>
				<label class="list-group-item">
				    <input class="form-check-input me-1" type="checkbox" value="">
				    채식
				</label>
				<label class="list-group-item">
				    <input class="form-check-input me-1" type="checkbox" value="">
				    저염식
				</label>
				<label class="list-group-item">
				    <input class="form-check-input me-1" type="checkbox" value="">
				    글루텐프리
				</label>
				<!-- 체크박스 가로 -->
				<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
					  <label class="form-check-label" for="inlineCheckbox1">당뇨식</label>
				</div>
				<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
					  <label class="form-check-label" for="inlineCheckbox2">저염식</label>
				</div>
				<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
					  <label class="form-check-label" for="inlineCheckbox3">채식 (disabled)</label>
				</div>
			</div>
				
			 <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
			 </div>
		</div>
	<!-- 게시글 row 상단 -->
	<ul class="recipe" style="overflow: hidden; padding-left: 0;">
		<div id="fh5co-staff">
		<div class="container">
		<div class="row">
		<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
		<c:forEach var="bDTO" items="${list}">	
			<div class="col-md-3 animate-box text-center">
				<div class="staff">
					<div class="staff-img" style="background-image: url('${bDTO.recipe_thumbnail }');">
					</div>
					<h3><a href="recipeView?recipe_no=${bDTO.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.recipe_name }</a></h3>
					<p> </p>
					<p>${bDTO.recipe_date }</p>
					<p>${bDTO.username }</p>		
				</div>
			</div>
		<c:set var="recordNum" value="${recordNum-1 }"></c:set>	
		</c:forEach>
		</div>
		</div>
		</div>
		</ul>
	</div>	
	
	
	<div class="recipeHeader" style="float: right; margin-top: -50px; " >
	<!-- <a href="recipeWrite">글쓰기</a> -->
	<button type="button" class="btn btn-outline-dark" onclick="location.href='recipeWrite'"
	style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button>
	</div>
	</div>
	
	<!-- 페이지네이션 부트스트랩 -->
	<div>
	<center>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  <!-- 이전페이지       : nowPage를 기준으로 -->	
		<c:if test="${vo.nowPage==1}"> <!-- 현재페이지가 첫번쨰 페이지일때 -->
			<li></li>
		</c:if>
		<c:if test="${vo.nowPage>1}"> <!-- 현재페이지가 첫번째 페이지가 아닐때 -->
		    <li class="page-item">
		      <a class="page-link" href="recipe?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
	    </c:if>
	   <!-- 이전페이지 끝 -->
	   <!-- 페이지 번호 -->
	   <c:forEach var="p" begin="${vo.startPageNum}" end="${vo.startPageNum+vo.onePageNumCount-1}">
				<c:if test="${p<=vo.totalPage}"> <!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
				<!-- 현재페이지 표시하기 -->
				<c:if test="${p==vo.nowPage}">
				<li class="page-item active" style="background-color: #8BC34A;">
				</c:if>
				<c:if test="${p!=vo.nowPage}">
				<li class="page-item">
				</c:if>
				<a class="page-link" href="recipe?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
	   
	   	<!-- 다음페이지 -->
	   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
	    <li class="page-item">
	      <a class="page-link" href="recipe?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	    </c:if>
	    <c:if test="${vo.nowPage==vo.totalPage}"><!-- 현재페이지가 마지막일때 -->
			<li></li>
		</c:if>
	  </ul>
	</nav>
	</center>
	</div>
	
  <br>