<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page
	import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*"%>


<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<div class="banner">
	<img src="${pageContext.request.contextPath}/img/banner.png"
		width="100%" height="300px" />
</div>

<div class="container">
	<div style="padding-top: 80px;">
		<!-- 검색 -->
		<div class="searchDiv" style="padding-top: 20px; float: right;">
			<form method="get" id="searchForm" action="recipe">
				<!-- 기간 select -->
				<select name="searchDate" class="form-select"
					aria-label="Default select example"
					style="width: auto; display: inline; white-space: nowrap;">
					<option value="">전체기간</option>
					<option value="">오늘</option>
					<option value="">이번주</option>
				</select>
				<!-- 검색 시 제목 작성자 글내용 선택 -->
				<select name="searchKey" class="form-select"
					aria-label="Default select example"
					style="display: inline; width: auto">
					<option value="recipe_name">제목</option>
					<option value="recipe_date">글내용</option>
				</select> <input type="text" name="searchWord" id="searchWord"
					class="form-control" placeholder="검색어를 입력해주세요"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default"
					style="width: 200px; height: 24.5px; display: inline;" /> <input
					type="submit" value="검색" class="btn-cta"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default"
					style="width: 70px; height: 30px; display: inline; background-color: #8BC34A; color: white; border: 0px;" />


			</form>
			<a href="/happy/menu">menu 페이지로 이동</a>
		</div>
		<div class="row animate-box">
			<h1 class="title" style="display: inline; font-size: 40px">&nbsp식단&nbsp&nbsp</h1>
		</div>
		<hr style="height: 1px; background: black" />
	</div>
	<div>

		<!-- 아코디언 추가 -->

		<div class="accordion accordion-flush" id="accordionFlushExample">
			<form action="/happy/menu" method="get">

			</form>

			<!-- 게시글 row 상단 -->
			<ul class="recipe" style="overflow: hidden; padding-left: 0;">
				<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
				<c:set var="recordNum"
					value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>

				<div id="fh5co-blog">
					<div class="container">

						<div class="row">
							<c:forEach var="MenuUserDTO" items="${list}">

								<div class="col-lg-4 col-md-4">
									<div class="fh5co-blog animate-box">
										<a href="menuView_user?menu_no=${MenuUserDTO.menu_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" class="blog-img-holder"
											style="background-image: url('/happy/uploadfile/${fileDto.filename }${MenuUserDTO.menu_thumbnail }');"></a>
					

										<div class="blog-text">
											<p></p>
											<p>${MenuUserDTO.menu_title}</p>
											<p>${MenuUserDTO.menu_text}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</ul>
		</div>


		<div class="recipeHeader" style="float: right; margin-top: -50px;">
			<!-- <a href="recipeWrite">글쓰기</a> -->
			<button type="button" class="btn btn-outline-dark" onclick="location.href='menuWrite_user'"
		style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button> 
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
		      <a class="page-link" href="menu_user?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
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
				<a class="page-link" href="menu_user?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
	   
	   	<!-- 다음페이지 -->
	   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
	    <li class="page-item">
	      <a class="page-link" href="menu_user?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
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
</div>
  <br>