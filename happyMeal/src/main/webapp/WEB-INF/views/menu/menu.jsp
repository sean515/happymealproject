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

<style>
	.accordion-button {
    font-size: 15px;
    }
    
    .accordion-flush .accordion-item .accordion-button, .accordion-flush .accordion-item .accordion-button.collapsed {
    border-radius: 0;
    background-color: #8bc34a38;
    border: 3px solid #8bc34a40;
}

.accordion-button:not(.collapsed) {
    color: #008846;
}
</style>
<!-- 배너 -->
<div class= "banner" style="overflow: hidden;">
	<img src="img/bannerimg2.png" width="100%" height="300px;">
</div>

<div class="container">
	<div style="padding-top: 80px;">
		<!-- 검색 -->
		<div class="searchDiv" style="padding-top: 20px; float: right;">
			<form method="get" id="searchForm" action="recipe">
				<input type="text" name="searchWord" id="searchWord"
					class="form-control" placeholder="검색어를 입력해주세요"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default"
					style="width: 200px; height: 24.5px; display: inline;" /> <input
					type="submit" value="검색" class="btn-cta"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default"
					style="width: 70px; height: 30px; display: inline; background-color: #8BC34A; color: white; border: 0px;" />

			</form>
		</div>
		<!-- 소제목 -->
		<div class="row animate-box">
			<h1 class="title" style="display: inline; font-size: 40px">&nbsp전문 식단&nbsp&nbsp</h1>
		</div>
		<hr style="height: 1px; background: black" />
	</div>
	<!-- usermenu 버튼 -->
	<div class="searchDiv" style="padding-top:20px; padding-bottom:20px; float: right;">	
			<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a  style="color:white;"href="menu_user">사용자 식단</a></div></button>
	</div>
	
	
	<div>

		<!-- 아코디언 추가 -->
		<div>
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			 	맞춤 식단 보기
				</button>	
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				<form action="/happy/menu" method="get">
					<div id="btn-group">
						<button type="submit" id="btn1" class="btn" name="amenu_type_no"
							value="1">당뇨식</button>
						<button type="submit" id="btn2" class="btn" name="amenu_type_no"
							value="2">연식</button>
						<button type="submit" id="btn3" class="btn" name="amenu_type_no"
							value="3">일반식</button>
						<button type="submit" id="btn3" class="btn" name="amenu_type_no"
							value="4">저염식</button>
						<button type="submit" id="btn3" class="btn" name="amenu_type_no"
							value="5">저요오드식</button>
						<button type="submit" id="btn3" class="btn" name="amenu_type_no"
							value="6">항암식</button>	
					</div>			
				</form>
			</div>
			</div>
		</div>
		
		<div  class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			 	시간별 식단 보기
				</button>	
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				<form action="/happy/menu" method="get">
				<div id="btn-group">
					<input type="hidden" name="amenu_type_no" value="${vo.amenu_type_no}">
					<button type="submit" id="btn1" class="btn" name="amenu_time"
						value="1">아침</button>
					<button type="submit" id="btn2" class="btn" name="amenu_time"
						value="2">점심</button>
					<button type="submit" id="btn3" class="btn" name="amenu_time" 
						value="3">저녁</button>
				</div>
			</form>
			</div>
			</div>
		</div>
		</div>
			
			<c:choose>
			<c:when  test="${vo.amenu_time==null}">
				<ul class="recipe" style="overflow: hidden; padding-left: 0;">
					<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
					<c:set var="recordNum"
						value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
	
					<div "id="fh5co-blog">
						<div class="container">
	
							<div class="row">
								<c:set var="counter" value="-1" />
								<c:forEach var="MenuDTO" items="${list}">
									<c:if test="${counter == -1}">
										<h3 style="padding-top:30px; padding-left:12.5px;">${MenuDTO.amenu_type_name }</h3>
									</c:if>
									<c:set var="counter" value="${counter + 1}" />
	
									<c:if test="${counter % 3 == 0 and counter != 0}">
										<c:set var="pageNo" value="${(counter/ 3)+1}" />
										<c:set var="pageNo" value="${pageNo.intValue()}" />
										<h3 style="padding-top:30px; padding-left:12.5px;">${MenuDTO.amenu_type_name}</h3>
									</c:if>
									
									<div style="margin-bottom:10px; border-bottom:2px solid #ddd;"class="col-lg-4 col-md-4">
										<div class="fh5co-blog animate-box">
											<a href="menuView?amenu_type_no=${MenuDTO.amenu_type_no }&amenu_name=${MenuDTO.amenu_name }" class="blog-img-holder"
												style="position: center; background-image: url('/happy/uploadfile/amenu/${MenuDTO.amenu_thumbnail }');"></a>
											
											<div class="blog-text">
												<p></p>
												<%-- <p>${MenuDTO.amenu_no }</p> --%>
												<%-- <p>${MenuDTO.amenu_type_name }${MenuDTO.amenu_name }</p> --%>
												<c:if test="${MenuDTO.amenu_time==1}">
													<p>아침</p>
												</c:if>
												<c:if test="${MenuDTO.amenu_time==2}">
													<p>점심</p>
												</c:if>
												<c:if test="${MenuDTO.amenu_time==3}">
													<p>저녁</p>
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
			</c:when>
			<c:otherwise>
							<ul class="recipe" style="overflow: hidden; padding-left: 0;">
					<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
					<c:set var="recordNum"
						value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
	
					<div id="fh5co-blog">
						<div class="container">
	
							<div class="row">
								<c:set var="counter" value="-1" />
								<c:forEach var="MenuDTO" items="${list}">
									<div class="col-lg-4 col-md-4">
										<div class="fh5co-blog animate-box">
											<a href="menuView?amenu_type_no=${MenuDTO.amenu_type_no }&amenu_name=${MenuDTO.amenu_name }" class="blog-img-holder"
												style="background-image: url('/happy/uploadfile/amenu/${MenuDTO.amenu_thumbnail }');"></a>
											<div class="blog-text">
												<p></p>
												<%-- <p>${MenuDTO.amenu_no }</p> --%>
												<p>${MenuDTO.amenu_type_name }</p>
												<c:if test="${MenuDTO.amenu_time==1}">
													<p>아침</p>
												</c:if>
												<c:if test="${MenuDTO.amenu_time==2}">
													<p>점심</p>
												</c:if>
												<c:if test="${MenuDTO.amenu_time==3}">
													<p>저녁</p>
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
		      <a class="page-link" href="menu?nowPage=${vo.nowPage-1}&amenu_type_no=${vo.amenu_type_no }<c:if test="${vo.amenu_time!=null}">&amenu_time=${vo.amenu_time}</c:if> <c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
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
				<a class="page-link" href="menu?nowPage=${p}&amenu_type_no=${vo.amenu_type_no }<c:if test="${vo.amenu_time!=null}">&amenu_time=${vo.amenu_time}</c:if><c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
	   
	   	<!-- 다음페이지 -->
	   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
	    <li class="page-item">
	      <a class="page-link" href="menu?nowPage=${vo.nowPage+1}&amenu_type_no=${vo.amenu_type_no }<c:if test="${vo.amenu_time!=null}">&amenu_time=${vo.amenu_time}</c:if><c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
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
			</c:otherwise>
			</c:choose>
			<!-- 게시글 row 상단 -->

		</div>


		<div class="recipeHeader" style="float: right; margin-top: -50px;">
			<!-- <a href="recipeWrite">글쓰기</a> -->
			<!-- <button type="button" class="btn btn-outline-dark" onclick="location.href='recipeWrite'"
	style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button> -->
		</div>

	</div>

</div>
