<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.table-striped > tbody > tr:nth-of-type(odd) {
    background-color: #f9f9f9;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.table > tbody > tr > td {
    padding: 8px;
    line-height: 1.42857;
    vertical-align: top;
    border-top: 1px solid #ddd;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<style>
.commHeader {
	text-align: right;
}

.comm_List li {
	float: left;
	width: 12.5%;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ddd;
}

.comm_List li:nth-child(5n+2) {
	width: 50%;
	/* 밑줄임표시하기 */
	white-space: nowrap; /* 줄바꾸지 않는다. */
	overflow: hidden; /* 넘치는 문자 숨기기 */
	text-overflow: ellipsis; /* 데이터가 넘친 경우 말줄임 표시 */
}

.pagingDiv ul {
	overflow: hidden;
	text-align: center
}

.pagingDiv li {
	display: inline-block;
	padding: 10px 20px;
}

.pagingDiv a:link, .pagingDiv a:hover, .pagingDiv a:visited, .board_list a:link,
	.board_list a:hover, .board_list a:visited {
	color: #000;
}

.col-sm-4 {
	position: relative;
}

.main_image_text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}
</style>
<style>
#joinEditForm ul {
	overflow: auto;
}

#joinEditForm1 ul {
	overflow: auto;
}

#joinEditForm li {
	text-align: left;
	float: left;
	width: 20%;
	padding: 10px 0;
	display: block;
	line-height: 40px;
}

#joinEditForm3 li {
	text-align: right;
}

#joinEditForm1 li {
	text-align: left;
	padding: 0;
	line-height: 30px;
}

#joinEditForm1 li img {
	margin-right: 50px;
}

#joinEditForm2 li {
	text-align: right;
	border-bottom: 2px solid #ddd;
}

#joinEditForm li:nth-child(2n) {
	width: 80%;
}

#joinEditForm li:last-child {
	width: 100%;
}

#addr {
	width: 80%;
}

.container {
	
}

.hr1 {
	border: 0;
	height: 2px;
	background: black;
	width: 100%;
}

.hr2 {
	width: 100%;
	border: 0;
	height: 2px;
	background: #ddd;
}

.hr3 {
	border: 0;
	height: 1.2px;
	background: #ddd;
}

.hr4 {
	border: 0;
	height: 1.6px;
	background: black;
}

.hr5 {
	border: 0;
	margin: 0;
	height: 2px;
	background: black;
	width: 100%;
}

h1 {
	font-size: 20px;
	float: center;
	margin: 0 auto;
}

.clear:after {
	content: "";
	display: block;
	clear: both;
	margin: 100px 100px 0px 0px;
}

.fr {
	float: right;
}

.fl {
	float: left;
}

.ft {
	float: right;
}

.box {
	padding: 10px;
	width: 1000px;
	margin: 0 auto;
}

.fbox {
	width: 440px;
	height: 300px;
	border: 1px solid white;
	margin: 0 0;
}

.hbox {
	width: 50px;
	height: 50px;
	border: 1px solid white;
	margin: 0 auto;
}

.tbox {
	width: 100px;
	height: 30px;
	border: 1px solid white;
	margin: 185px 0 0 380px;
}

.il_box {
	padding: 20px;
	font-size: 1;
}

.il_box>div {
	display: inline-block;
	width: 33.333%;
	margin: 0 auto;
}

.il_box>div>p {
	height: 200px;
	border: 1px solid #bbb;
	margin: 0 auto;
}

.container2 {
	padding: 30px 0;
	border-top: solid 2px white;
}

.container3 {
	padding: 25px 0;
}

#my_header {
	padding-bottom: 20px;
	border-bottom: solid 1px #80808080;
}

#bottomline {
	border-bottom: solid 1px #80808080;
	padding-bottom: 25px;
	margin-right: 10px;
	margin-left: 10px;
}

#box_a {
	float: left;
	width: auto;
	height: 400px;
	background: #fcb354;
}

#box_b {
	float: left;
	width: 80%;
	background: #f8f9fa;
	padding: 10px;
	border-radius: 5px;
}
</style>

<script>
	
</script>
<style>
.bg-gradient-primary {
	background-color: #1cc88a;
	background-image: linear-gradient(180deg, #1cc88a 10%, #1cc88a 100%);
	background-size: cover;
	width: 200px;
	padding: 10px;
}

.navbar-nav>li>a {
	color: white;
}

.container {
	margin-bottom: 20px;
}
</style>

<div class="container" style="min-width: 1110px;">
	<div id="wrapper" style="height: auto">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar"
			style="border-radius: 5px; margin-bottom: 10px; margin-right: 20px; height: 450px">

			<!-- Divider -->

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="/happy/myPage?level=mypage"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span
					style="font-size: 15px;">마이 페이지</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider" style="margin: 0">

			<!-- 식당 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <span>내가
						쓴 글</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/happy/myPage?level=write&cate=1">커뮤니티</a><br />
						<a class="collapse-item" href="/happy/myPage?level=write&cate=2">레시피</a><br />
						<a class="collapse-item" href="/happy/myPage?level=write&cate=3">식단</a>
					</div>
				</div></li>

			<!-- 식단 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-table"></i> <span>내가 쓴 댓글</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/happy/myPage?level=comm&cate=1">커뮤니티</a><br />
						<a class="collapse-item" href="/happy/myPage?level=comm&cate=2">레시피</a><br />
						<a class="collapse-item" href="/happy/myPage?level=comm&cate=3">식단</a>
					</div>
				</div></li>

			<!-- 레시피 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseRecipe"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-book"></i> <span>좋아요</span>
			</a>
				<div id="collapseRecipe" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/happy/myPage?level=like&state=1">레시피</a><br />
						<a class="collapse-item" href="/happy/myPage?level=like&state=2">식단</a><br />
						<a class="collapse-item" href="/happy/myPage?level=like&state=3">식당</a>
					</div>
				</div></li>

			<!-- 식당 요청 정보 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseMenu"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-list"></i> <span>식당 요청</span>
			</a>
				<div id="collapseMenu" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/happy/myPage?level=ras&state=1">식당
							추가 요청</a><br /> <a class="collapse-item"
							href="/happy/myPage?level=ras&state=2">식당 수정 요청</a><br />
					</div>
				</div></li>

			<!-- 문의내역 관리 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseSub"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-list"></i> <span>문의 내역</span>
			</a>
				<div id="collapseSub" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/happy/myPage?level=Inq&state=1">문의
							내역</a><br /> <a class="collapse-item"
							href="/happy/myPage?level=Inq&state=2">신고 내역</a><br />
					</div>
				</div></li>


		</ul>
	</div>


	<!-- 마이페이지 -->
	<c:if test="${param.level == 'mypage' or param.level == none}">
		<div id="box_b" style="height: 450px;">
			<h4 style="margin: 0 0 10px 0; padding: 0 10px;">내 정보</h4>

			<div class="container2">
				<form method="post" id="joinEditForm1">
					<ul>
						<div style="background-color: blue; width: auto; height: auto;">
							<div style="width: 20%; height: auto; float: left;">
								<li><img src="img/testface.png" width="100" height="100"
									align="left" style="border-radius: 20px" /></li>
							</div>

							<div
								style="width: 30%; height: auto; float: left; padding-right: 30px;">
								<li>아이디: <b>${dto.username}</b></li>
								<li>닉네임: <b>${dto.nickname}</b></li>
								<li>성별: ${dto.gender}</li>
								<li>생년월일: ${dto.age}</li>
								<li>이메일: ${dto.email}</li>
								<li>선호 식단: ${dto.disease}</li>
								<br />
								<br />
								<li style="float: right;"><a
									href="/happy/myPage/checkPassword">개인정보 수정</a></li>
							</div>
						</div>
						<div
							style="width: 47%; height: auto; background-color: white; padding-right: 10px; padding-bottom: 10px; margin-right: 20px; border-radius: 7px; float: left;">
							<ul style="line-height: 30px;">
								<c:if test="${dto.bmi ne 0.0}">
									<li><b>BMI: ${dto.bmi}</b></li>
									<li><b>비만도: ${dto.standardBmi}</b></li>
									<li>하루 권장 섭취 칼로리: ${dto.kal} kcal</li>
									<c:if test="${dto.standardBmi eq '저체중'}">
										<li>식이요법: 칼로리 섭취량을 늘리는 것이 중요합니다. 하루 섭취 칼로리는 체질에 맞게 적정량을
											늘려줘야 합니다.<br /> 관리법: 규칙적인 식사와 수면을 유지하고, 근육운동을 통해 체중을 늘려주는 것이
											좋습니다.
										</li>
									</c:if>
									<c:if test="${dto.standardBmi eq '정상체중'}">
										<li>식이요법: 균형잡힌 식단을 유지하면서 적정한 칼로리를 섭취하는 것이 중요합니다.<br />
											관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 특히 유산소 운동을 하여 건강한 체중을 유지하는 것이
											좋습니다.
										</li>
									</c:if>
									<c:if test="${dto.standardBmi eq '과체중'}">
										<li>식이요법: 하루 권장 칼로리를 지키면서 식사량을 조절하는 것이 중요합니다. 단, 갑작스런
											급감식은 건강에 해로울 수 있으므로 천천히 조절해야 합니다.<br /> 관리법: 규칙적인 식습관과 운동 습관을
											유지하면서, 유산소 운동을 더 많이 하여 체중을 조절하는 것이 좋습니다.
										</li>
									</c:if>
									<c:if test="${dto.standardBmi eq '경도비만'}">
										<li>식이요법: 하루 권장 칼로리보다 적게 섭취하고, 탄수화물과 지방 섭취량을 줄이는 것이
											중요합니다.<br /> 관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여
											체중감량을 유도하는 것이 좋습니다.
										</li>
									</c:if>

									<c:if test="${dto.standardBmi eq '중등도비만'}">
										<li>식이요법: 하루 권장 칼로리보다 적게 섭취하고, 탄수화물과 지방 섭취량을 더욱 줄이는 것이
											중요합니다. 단, 단백질 섭취는 충분히 해야합니다.<br /> 관리법: 규칙적인 식습관과 운동 습관을
											유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다. 건강한 체중 감량을 위해
											전문의의 도움도 받을 수 있습니다.
										</li>
									</c:if>

									<c:if test="${dto.standardBmi eq '고도비만'}">
										<li>식이요법: 하루 권장 칼로리보다 적게 섭취하고, 건강한 식습관으로 바꾸는 것이 중요합니다. 단,
											영양소 섭취에 유의해야 합니다.<br /> 관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과
											유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다. 전문의의 도움을 받아 건강한 체중 감량을 위해
											진행해야 합니다.
										</li>
									</c:if>
									<li style="float: right;"><a href="/happy/myPage/checkBmi">BMI
											수정하기</a></li>
								</c:if>
								<c:if test="${dto.bmi eq 0.0}">
									<li><a href="/happy/myPage/checkBmi">BMI 계산하러 가기</a></li>
								</c:if>
							</ul>
						</div>



					</ul>
				</form>
			</div>
		</div>

	</c:if>

	<!-- 댓글 -->
	<c:if test="${param.level == 'comm'}">
		<div class="container">
			<h3 style="display: inline-block;">내가 쓴 댓글</h3>


			<form action="/happy/myPage" method="get">
				<input id="te" type="text" name="level" value="comm"
					style="display: none;">
				<button type="submit" id="change-restaurant-button" name="cate"
					value="3"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					식단</button>
				<button type="submit" id="change-restaurant-button" name="cate"
					value="2"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					레시피</button>
				<button type="submit" id="add-restaurant-button" name="cate"
					value="1"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					커뮤니티</button>
			</form>
			<br />
			<br />

			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<table id="example" class="table table-striped"
							style="width: 100%; table-layout: fixed">
							<thead>
									<tr>
										<th style="width:10%">글번호</th>
										<th style="width:40%">제목</th>
										<th>댓글</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>

							<c:if test="${param.cate == '1'}">


									<c:forEach var="bDTO" items="${list11}">
										<tr>
											<td style="width: 10%"><a href="/happy/commView?comm_no=${bDTO.comm_no }">${bDTO.comm_no }</a></td>
											<td style="width: 40%"><a href="/happy/commView?comm_no=${bDTO.comm_no }">${bDTO.comm_title }</a></td>
											<td style="width: 40%"><a href="/happy/commView?comm_no=${bDTO.comm_no }">${bDTO.comm_comment_text }</a></td>
											<td style="width: 10%"><a href="/happy/commView?comm_no=${bDTO.comm_no }">${bDTO.comm_comment_date }</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>

							<c:if test="${param.cate == '2'}">
	
								<c:forEach var="bDTO" items="${list13}">
										<tr>
											<td><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }">${bDTO.recipe_no }</a></td>
											<td><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }">${bDTO.recipe_name }</a></td>
											<td><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }">${bDTO.recipe_comment_date  }</a></td>
											<td><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }">${bDTO.recipe_comment_text }</a></td>

										</tr>
									</c:forEach>
								</tbody>
								</div>
							</c:if>
							<c:if test="${param.cate == '3'}">
	
								<c:forEach var="bDTO" items="${list12}">
										<tr>
											<td><a href="/happy/menuView_user?menu_no=${bDTO.menu_no}">${bDTO.menu_no }</a></td>
											<td><a href="/happy/menuView_user?menu_no=${bDTO.menu_no}">${bDTO.menu_title }</a></td>
											<td><a href="/happy/menuView_user?menu_no=${bDTO.menu_no}">${bDTO.menu_comment_date }</a></td>
											<td><a href="/happy/menuView_user?menu_no=${bDTO.menu_no}">${bDTO.menu_comment_text }</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</c:if>

							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>


	<!-- 내가 쓴 글 -->
	<c:if test="${param.level == 'write'}">
		<div class="container">
			<h1>내가 쓴 글</h1>
			<c:set var="recordNum"
				value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
			<div style="height: 50px;">
				<form action="/happy/myPage" method="get">
					<input id="te" type="text" name="level" value="write"
						style="display: none;" />
					<button type="submit" id="change-restaurant-button" name="cate"
						value="3"
						style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
						식단</button>
					<button type="submit" id="change-restaurant-button" name="cate"
						value="2"
						style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
						레시피</button>
					<button type="submit" id="add-restaurant-button" name="cate"
						value="1"
						style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
						커뮤니티</button>
				</form>
			</div>
			<c:if test="${param.cate == '1'}">
				<!-- 소재목 -->
				<div class="pFilter">
					<div style="height: 320px">
						<!-- 게시글 row 상단 -->
						<ul class="comm_List" style="overflow: hidden; padding-left: 0;">
							
							<li style="background-color: #dddddd45;">글머리</li>
							<li style="background-color: #dddddd45;">제목</li>
							<li style="background-color: #dddddd45;">작성자</li>
							<li style="background-color: #dddddd45;">조회수</li>
							<li style="background-color: #dddddd45;">등록일</li>
							<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
							<c:set var="recordNum"
								value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>

							<c:forEach var="bDTO" items="${list10}">

								
								<!-- bDTO.no  -->
								<li>${bDTO.comm_bullet_point }</li>
								<!-- bDTO.no  -->
								<!-- 글 내용 보기 레코드 번호, 현재 페이지, 검색어가 있으면 검색키, 검색어를 가져가야 함. -->
								<li style="color: black;"><a
									href="commView?comm_no=${bDTO.comm_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.comm_title }</a></li>
								<li>${bDTO.username }</li>
								<li>${bDTO.comm_hit }</li>
								<li>${bDTO.comm_date }</li>
								<c:set var="recordNum" value="${recordNum-1 }"></c:set>
							</c:forEach>
						</ul>
					</div>
					<div>
						<center>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<!-- 이전페이지       : nowPage를 기준으로 -->
									<c:if test="${vo.nowPage==1}">
										<!-- 현재페이지가 첫번쨰 페이지일때 -->
										<li></li>
									</c:if>
									<c:if test="${vo.nowPage>1}">
										<!-- 현재페이지가 첫번째 페이지가 아닐때 -->
										<li class="page-item"><a class="page-link"
											href="comm_List?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

									<!-- 이전페이지 끝 -->
									<!-- 페이지 번호 -->
									<c:forEach var="p" begin="${vo.startPageNum}"
										end="${vo.startPageNum+vo.onePageNumCount-1}">
										<c:if test="${p<=vo.totalPage}">
											<!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
											<!-- 현재페이지 표시하기 -->
											<c:if test="${p==vo.nowPage}">
												<li class="page-item active"
													style="background-color: #8BC34A;">
											</c:if>
											<c:if test="${p!=vo.nowPage}">
												<li class="page-item">
											</c:if>
											<a class="page-link"
												href="comm_List?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
											</li>
										</c:if>
									</c:forEach>

									<!-- 다음페이지 -->
									<c:if test="${vo.nowPage<vo.totalPage}">
										<!-- 다음페이지가 있다 -->
										<li class="page-item"><a class="page-link"
											href="comm_List?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:if test="${vo.nowPage==vo.totalPage}">
										<!-- 현재페이지가 마지막일때 -->
										<li></li>
									</c:if>
								</ul>
							</nav>
						</center>
					</div>
					<div class="row animate-box"></div>
				</div>
		</div>




		<div class="commHeader" style="margin-bottom: 20px; margin-top: 10px">
	</c:if>
	<c:if test="${param.cate == '3'}">
		<div class="row">
			<c:forEach var="MenuUserDTO" items="${list9}">

				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a
							href="menuView_user?menu_no=${MenuUserDTO.menu_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							class="blog-img-holder"
							style="height:200px; background-image: url('/happy/uploadfile/${fileDto.filename }${MenuUserDTO.menu_thumbnail }');"></a>


						<div class="blog-text" style="padding: 20px 15px;">
							<h5>${MenuUserDTO.menu_title}</h5>
							<p style="margin-bottom: 5px; display: inline-block;">${MenuUserDTO.nickname}</p>
							<p
								style="margin-bottom: 5px; display: inline-block; float: right;">
								조회수 : ${MenuUserDTO.menu_hit}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 게시글 row 상단 -->
</div>


<div class="recipeHeader" style="float: center; margin-top: -50px;">
	<!-- <a href="recipeWrite">글쓰기</a> -->


	<!-- 페이지네이션 부트스트랩 -->
	<div style="margin-top: -80px;">
		<center>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전페이지       : nowPage를 기준으로 -->
					<c:if test="${vo.nowPage==1}">
						<!-- 현재페이지가 첫번쨰 페이지일때 -->
						<li></li>
					</c:if>
					<c:if test="${vo.nowPage>1}">
						<!-- 현재페이지가 첫번째 페이지가 아닐때 -->
						<li class="page-item"><a class="page-link"
							href="menu_user?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<!-- 이전페이지 끝 -->
					<!-- 페이지 번호 -->
					<c:forEach var="p" begin="${vo.startPageNum}"
						end="${vo.startPageNum+vo.onePageNumCount-1}">
						<c:if test="${p<=vo.totalPage}">
							<!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
							<!-- 현재페이지 표시하기 -->
							<c:if test="${p==vo.nowPage}">
								<li class="page-item active" style="background-color: #8BC34A;">
							</c:if>
							<c:if test="${p!=vo.nowPage}">
								<li class="page-item">
							</c:if>
							<a class="page-link"
								href="menu_user?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
							</li>
						</c:if>
					</c:forEach>

					<!-- 다음페이지 -->
					<c:if test="${vo.nowPage<vo.totalPage}">
						<!-- 다음페이지가 있다 -->
						<li class="page-item"><a class="page-link"
							href="menu_user?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${vo.nowPage==vo.totalPage}">
						<!-- 현재페이지가 마지막일때 -->
						<li></li>
					</c:if>
				</ul>
			</nav>
		</center>
	</div>

	</c:if>

	<style>
.staff {
	padding: 0;
}
</style>
	<c:if test="${param.cate == '2'}">
		<!-- 소재목 -->
		<!-- 게시글 row 상단 -->
		<ul class="recipe" style="overflow: hidden; padding-left: 0;">
			<div id="fh5co-staff" style="padding: 0; height: 90%">
				<div class="row">
					<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
					<c:set var="recordNum"
						value="${vo.totalRecord -  (vo.nowPage-1)*vo.onePageRecord }"></c:set>
					<c:forEach var="bDTO" items="${list8}">
						<div class="col-md-3 animate-box text-center">
							<div class="staff" style="padding: 0">
								<div class="staff-img"
									style="height: 150px; background-image: url('/happy/uploadfile/${fileDto.filename }${bDTO.recipe_thumbnail }'); ">
								</div>
								<h3>
									<a
										href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.recipe_name }</a>
								</h3>
								<p></p>
								<p>${bDTO.recipe_date }</p>
							</div>
						</div>
						<c:set var="recordNum" value="${recordNum-1 }"></c:set>
					</c:forEach>
				</div>
			</div>
		</ul>
		<!-- 페이지네이션 부트스트랩 -->
		<div style="margin-top: -30px;">
			<center>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전페이지       : nowPage를 기준으로 -->
					<c:if test="${vo.nowPage==1}">
						<!-- 현재페이지가 첫번쨰 페이지일때 -->
						<li></li>
					</c:if>
					<c:if test="${vo.nowPage>1}">
						<!-- 현재페이지가 첫번째 페이지가 아닐때 -->
						<li class="page-item"><a class="page-link"
							href="recipe_user?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<!-- 이전페이지 끝 -->
					<!-- 페이지 번호 -->
					<c:forEach var="p" begin="${vo.startPageNum}"
						end="${vo.startPageNum+vo.onePageNumCount-1}">
						<c:if test="${p<=vo.totalPage}">
							<!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
							<!-- 현재페이지 표시하기 -->
							<c:if test="${p==vo.nowPage}">
								<li class="page-item active" style="background-color: #8BC34A;">
							</c:if>
							<c:if test="${p!=vo.nowPage}">
								<li class="page-item">
							</c:if>
							<a class="page-link"
								href="recipe_user?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
							</li>
						</c:if>
					</c:forEach>

					<!-- 다음페이지 -->
					<c:if test="${vo.nowPage<vo.totalPage}">
						<!-- 다음페이지가 있다 -->
						<li class="page-item"><a class="page-link"
							href="recipe_user?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${vo.nowPage==vo.totalPage}">
						<!-- 현재페이지가 마지막일때 -->
						<li></li>
					</c:if>
				</ul>
			</nav>

		</div>

		<div class="recipeHeader" style="float: center; margin-top: -50px;">
		</div>
	</c:if>
	</c:if>

	<!-- 좋아요 -->
	<c:if test="${param.level == 'like'}">
		<div class="container">
			<h1>즐겨찾기한 글</h1>
			<ul>
				<li><c:set var="recordNum"
						value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
					<div style="height: 50px;">
						<form action="/happy/myPage/" method="get">
							<input id="te" type="text" name="level" value="like"
								style="display: none;" />
							<button type="submit" id="change-restaurant-button" name="state"
								value="3"
								style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
								식당</button>
							<button type="submit" id="change-restaurant-button" name="state"
								value="2"
								style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
								식단</button>
							<button type="submit" id="add-restaurant-button" name="state"
								value="1"
								style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
								레시피</button>
						</form>
					</div> <c:if test="${param.state == '2'}">
						<c:forEach var="MenuDTO" items="${list5}">
							<a href="/happy/menuView_user?menu_no=${MenuDTO.menu_no}"><img
								src="/happy/uploadfile/${MenuDTO.menu_thumbnail}" width="90"
								height="90" align="left" />&emsp;&emsp;&emsp;</a>
				식단명 : ${MenuDTO.menu_title}<br />&emsp;&emsp;&emsp;
				작성일 : ${MenuDTO.menu_date}<br />&emsp;&emsp;&emsp;
				작성자 : ${MenuDTO.userid}&emsp;&emsp;&emsp;
				<hr class="hr3" style="height: 2px;"/>

						</c:forEach>
					</c:if> <c:if test="${param.state == '1'}">
						<c:forEach var="RecipeDTO" items="${list7}">
							<a href="//happy/recipeView?recipe_no=${RecipeDTO.recipe_no}"><img
								src="/happy/uploadfile/${RecipeDTO.recipe_thumbnail}" width="90"
								height="90" align="left" />&emsp;&emsp;&emsp;</a>
				식단명 : ${RecipeDTO.recipe_name}<br />&emsp;&emsp;&emsp;
				작성일 : ${RecipeDTO.recipe_date}<br />&emsp;&emsp;&emsp;
				작성자 : ${RecipeDTO.userid}&emsp;&emsp;&emsp;
				<hr class="hr3" style="height: 2px;" />

						</c:forEach>
					</c:if> <c:if test="${param.state == '3'}">
						<c:forEach var="ResDTO" items="${list6}">
							<a href="/happy/resView?res_no=${ResDTO.res_no}"><img
								src="${ResDTO.res_image}" width="90" height="90" align="left" />&emsp;&emsp;&emsp;</a>
				식당 이름 : ${ResDTO.res_name}<br />&emsp;&emsp;&emsp;
				주소 : ${ResDTO.res_addr}<br />&emsp;&emsp;&emsp;
				전화 번호 : ${ResDTO.res_tel}&emsp;&emsp;&emsp;
							<hr class="hr3" style="height: 2px;"/>
						</c:forEach>
					</c:if></li>
			</ul>
		</div>
	</c:if>
<!-- 페이지네이션 부트스트랩 -->
		<div style="margin-top: -80px;">
			<center>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전페이지       : nowPage를 기준으로 -->
					<c:if test="${vo.nowPage==1}">
						<!-- 현재페이지가 첫번쨰 페이지일때 -->
						<li></li>
					</c:if>
					<c:if test="${vo.nowPage>1}">
						<!-- 현재페이지가 첫번째 페이지가 아닐때 -->
						<li class="page-item"><a class="page-link"
							href="recipe_user?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<!-- 이전페이지 끝 -->
					<!-- 페이지 번호 -->
					<c:forEach var="p" begin="${vo.startPageNum}"
						end="${vo.startPageNum+vo.onePageNumCount-1}">
						<c:if test="${p<=vo.totalPage}">
							<!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
							<!-- 현재페이지 표시하기 -->
							<c:if test="${p==vo.nowPage}">
								<li class="page-item active" style="background-color: #8BC34A;">
							</c:if>
							<c:if test="${p!=vo.nowPage}">
								<li class="page-item">
							</c:if>
							<a class="page-link"
								href="recipe_user?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
							</li>
						</c:if>
					</c:forEach>

					<!-- 다음페이지 -->
					<c:if test="${vo.nowPage<vo.totalPage}">
						<!-- 다음페이지가 있다 -->
						<li class="page-item"><a class="page-link"
							href="recipe_user?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<c:if test="${vo.nowPage==vo.totalPage}">
						<!-- 현재페이지가 마지막일때 -->
						<li></li>
					</c:if>
				</ul>
			</nav>

		</div>

	<!-- 식당 요청 정보 -->
	<c:if test="${param.level == 'ras'}">
		<div class="container">
			<br /> <br />
			<h2 style="display: inline-block;">식당 정보 업데이트 요청</h2>


			<form action="/happy/myPage/" method="get">
				<input id="te" type="text" name="level" value="ras"
					style="display: none;" />
				<button type="submit" id="change-restaurant-button" name="state"
					value="2"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					식당 변경 정보</button>
				<button type="submit" id="add-restaurant-button" name="state"
					value="1"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					식당 추가 정보</button>
			</form>
			<br /> <br />


			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<table
							summary="This table shows how to create responsive tables using Datatables' extended functionality"
							class="table table-bordered table-hover dt-responsive">
							<c:if test="${param.state == '1' or param.state==null}">
								<thead>
									<tr>
										<th>식당명</th>
										<th>식당 구분</th>
										<th>요청일</th>
										<th>요청 결과</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="ResDTO" items="${list3}">
										<tr>
											<td>${ResDTO.res_name }</td>
											<td>${ResDTO.res_type }</td>
											<td>${ResDTO.res_date }</td>
											<td><c:if test="${ResDTO.res_status==2}">
													<div class="resYes" style="color: red">
														<b>승인</b>
													</div>
												</c:if> <c:if test="${ResDTO.res_status==3}">
													<div class="resNo" style="color: blue">
														<b>반려</b>
													</div>
												</c:if> <c:if test="${ResDTO.res_status==4}">
													<b>심사중</b>
												</c:if> <c:if test="${ResDTO.res_status==5}">
													<div class="resYes" style="color: red">
														<b>승인</b>
													</div>
												</c:if></td>
										</tr>
									</c:forEach>

								</tbody>
							</c:if>


							<c:if test="${param.state == '2'}">
								<thead>
									<tr>
										<th>식당명</th>
										<th>식당 구분</th>
										<th>요청일</th>
										<th>요청 유형</th>
										<th>요청 결과</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="ResEditDTO" items="${list4}">
										<tr>
											<td>${ResEditDTO.res_name }</td>
											<td>${ResEditDTO.res_type }</td>
											<td>${ResEditDTO.res_edit_date }</td>
											<td><c:if test="${ResEditDTO.res_edit_type==1}">
                                    수정
                                </c:if> <c:if
													test="${ResEditDTO.res_edit_type==2}">
													<div class="delres" style="color: #007bff">삭제</div>
												</c:if></td>

											<td><c:if test="${ResEditDTO.res_status==4}">
		       						심사중
		    					</c:if> <c:if test="${ResEditDTO.res_status==2}">
			  						 승인
								</c:if> <c:if test="${ResEditDTO.res_status==3}">
			  						 반려
								</c:if></td>
										</tr>
									</c:forEach>

								</tbody>
							</c:if>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
	</c:if>




	<!-- 문의사항 -->

	<c:if test="${param.level == 'Inq'}">
		<div class="container">
			<h3 style="display: inline-block;">문의 사항</h3>


			<form action="/happy/myPage" method="get">
				<input id="te" type="text" name="level" value="Inq"
					style="display: none;">
				<button type="submit" id="change-restaurant-button" name="state"
					value="2"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					신고 내역</button>
				<button type="submit" id="add-restaurant-button" name="state"
					value="1"
					style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
					문의 사항</button>
			</form>
			<br />
			<br />

			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<table id="example" class="table table-striped"
							style="width: 100%">
							<c:if test="${param.state == '1'}">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>조회수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="SupDTO" items="${list1}">
										<tr>
											<td>${SupDTO.sup_no }</td>
											<td>${SupDTO.sup_title }</td>
											<td>${SupDTO.sup_hit }</td>
											<td>${SupDTO.sup_date }</td>

										</tr>
									</c:forEach>
								</tbody>
							</c:if>

							<c:if test="${param.state == '2'}">
								<thead>
									<tr>
										<th>신고글 번호</th>
										<th>게시판 유형</th>
										<th>신고 유형</th>
										<th>신고 내용</th>
										<th>신고 날짜</th>
										<th>진행 상태</th>
										<th>진행 결과</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="ReportDTO" items="${list2}">
										<tr>
											<td><c:if test="${ReportDTO.report_response != 1}">
													<c:if test="${ReportDTO.board_type==1}">
														<a
															href="/happy/menuUserView?menu_no=${ReportDTO.report_post_no}">${ReportDTO.report_post_no}</a>
													</c:if>
													<c:if test="${ReportDTO.board_type==2}">
														<a
															href="/happy/recipeUserView?recipe_no=${ReportDTO.report_post_no}">${ReportDTO.report_post_no}</a>
													</c:if>
													<c:if test="${ReportDTO.board_type==3}">
														<a
															href="/happy/commView?comm_no=${ReportDTO.report_post_no}">${ReportDTO.report_post_no}</a>
													</c:if>
												</c:if></td>
											<td><c:if test="${ReportDTO.board_type==1}">
			                                    	식단
			                                    </c:if> <c:if
													test="${ReportDTO.board_type==2}">
			                                    	레시피
			                                    </c:if> <c:if
													test="${ReportDTO.board_type==3}">
			                                    	커뮤니티
			                                    </c:if></td>

											<td><c:if test="${ReportDTO.report_reason==1}">
			                                    	광고
			                                    </c:if> <c:if
													test="${ReportDTO.report_reason==2}">
			                                    	비방
			                                    </c:if> <c:if
													test="${ReportDTO.report_reason==3}">
			                                    	허위정보
			                                    </c:if> <c:if
													test="${ReportDTO.report_reason==4}">
			                                    	기타
			                                    </c:if></td>
											<td>${ReportDTO.report_text}</td>
											<td>${ReportDTO.report_date}</td>
											<td style="text-align: center; font-size: 16px;"><c:if
													test="${ReportDTO.report_status==0}">
													<b>처리예정</b>
												</c:if> <c:if test="${ReportDTO.report_status==1}">
													<div class="reportcomplete" style="color: red">
														<b>처리완료</b>
													</div>
												</c:if></td>
											<td style="text-align: center; font-size: 16px;"><c:if
													test="${ReportDTO.report_response==0}">

												</c:if> <c:if test="${ReportDTO.report_response==1}">
													<b>승인</b>
												</c:if> <c:if test="${ReportDTO.report_response==2}">
													<div class="reportrescomplete" style="color: blue">
														<b>반려</b>
													</div>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>

							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>
</div>
