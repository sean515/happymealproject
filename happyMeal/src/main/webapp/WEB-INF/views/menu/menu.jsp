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
			<a href="/happy/menu_user">menu_user 페이지로 이동</a>
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
				<div id="btn-group">
					<button type="submit" id="btn1" class="btn" name="amenu_type_no1"
						value="1">당뇨식</button>
					<button type="submit" id="btn2" class="btn" name="amenu_type_no2"
						value="2">연식</button>
					<button type="submit" id="btn3" class="btn" name="amenu_type_no3"
						value="3">일반식</button>
					<button type="submit" id="btn3" class="btn" name="amenu_type_no4"
						value="4">저염식</button>
					<button type="submit" id="btn3" class="btn" name="amenu_type_no5"
						value="5">저요오드식</button>
					<button type="submit" id="btn3" class="btn" name="amenu_type_no6"
						value="6">항암식</button>
				</div>
			</form>

			<!-- 게시글 row 상단 -->
			<ul class="recipe" style="overflow: hidden; padding-left: 0;">
				<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
				<c:set var="recordNum"
					value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>

				<div id="fh5co-blog">
					<div class="container">

						<div class="row">
							<c:set var="counter" value="-1" />
							<c:forEach var="MenuDTO" items="${list}">
								<c:if test="${counter == -1}">
									<h1>${MenuDTO.amenu_type_name }${1}</h1>
								</c:if>
								<c:set var="counter" value="${counter + 1}" />

								<c:if test="${counter % 3 == 0 and counter != 0}">
									<c:set var="pageNo" value="${(counter/ 3)+1}" />
									<c:set var="pageNo" value="${pageNo.intValue()}" />
									<h1>${MenuDTO.amenu_type_name}${pageNo}</h1>
								</c:if>
								<div class="col-lg-4 col-md-4">
									<div class="fh5co-blog animate-box">
										<a href="menuView?amenu_type_no=${MenuDTO.amenu_type_no }&amenu_name=${MenuDTO.amenu_name }" class="blog-img-holder"
											style="background-image: url('/happy/uploadfile/amenu/${MenuDTO.amenu_thumbnail }');"></a>
										<div class="blog-text">
											<p></p>
											<p>${MenuDTO.amenu_no }</p>
											<p>${MenuDTO.amenu_type_name }${MenuDTO.amenu_name }</p>
											<c:if test="${MenuDTO.amenu_time==1}">
												<p>조식</p>
											</c:if>
											<c:if test="${MenuDTO.amenu_time==2}">
												<p>중식</p>
											</c:if>
											<c:if test="${MenuDTO.amenu_time==3}">
												<p>석식</p>
											</c:if>
											<p>${MenuDTO.amenu_text }</p>
										</div>
									</div>
								</div>
								<c:set var="recordNum" value="${recordNum-1 }"></c:set>
							</c:forEach>
						</div>

					</div>
				</div>
			</ul>
		</div>


		<div class="recipeHeader" style="float: right; margin-top: -50px;">
			<!-- <a href="recipeWrite">글쓰기</a> -->
			<!-- <button type="button" class="btn btn-outline-dark" onclick="location.href='recipeWrite'"
	style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button> -->
		</div>

	</div>

</div>
