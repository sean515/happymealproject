<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<style>

	#joinEditForm ul{
		overflow:auto;
	}
	#joinEditForm1 ul{
		overflow:auto;
	}
	
	#joinEditForm li{
		text-align:left;
		float:left;
		width:20%;
		padding:10px 0;
		display:block;
		line-height:40px;
	}
	#joinEditForm3 li{
		text-align:right;
	}
	#joinEditForm1 li{
		text-align:left;
		padding:0;
		line-height:30px;
	}
	
	#joinEditForm1 li img{
		margin-right:50px;
	}
	

	#joinEditForm2 li{
		text-align:right;
		border-bottom:2px solid #ddd;
	}
	#joinEditForm li:nth-child(2n){
		width:80%;
	}
	#joinEditForm li:last-child{
		width:100%;
	}
	#addr{width:80%;}
	.container{
	}
	.hr1{
		border:0;
		height:2px;
		background:black;
		width:100%;
	}
	.hr2{
		width:100%;
		border:0;
		height:2px;
		background:#ddd;
	}
	.hr3{
		border:0;
		height:1.2px;
		background:#ddd;
	}
	.hr4{
		border:0;
		height:1.6px;
		background:black;
	}
	.hr5{
		border:0;
		margin:0;
		height:2px;
		background:black;
		width:100%;
	}
	h1 { font-size:20px; float:center; margin:0 auto; }
	.clear:after {content:""; display:block; clear:both; margin:100px 100px 0px 0px;}
	.fr { float:right; }
	.fl { float:left; }
	.ft { float:right;}
	.box { padding:10px; width:1000px; margin:0 auto; }
	.fbox{ width:440px; height:300px; border:1px solid white; margin:0 0;}
	.hbox{ width:50px; height:50px; border:1px solid white; margin:0 auto;}
	.tbox{ width:100px; height:30px; border:1px solid white; margin:185px 0 0 380px; }
	
	.il_box { padding:20px; font-size:1; }
	.il_box > div { display:inline-block; width:33.333%; margin:0 auto; }
	.il_box > div > p { height:200px; border:1px solid #bbb; margin:0 auto; }
	
	.container2{
		padding: 30px 0;
    	border-top: solid 2px white;
	}
	
	.container3{
		padding: 25px 0;
	}
	
	#my_header{
		padding-bottom: 20px;
    	border-bottom: solid 1px #80808080;
	}
	
	#bottomline{
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
    background-image: linear-gradient(180deg,#1cc88a 10%,#1cc88a 100%);
    background-size: cover;
    width: 200px;
    padding: 10px;
}

.navbar-nav > li > a {
 	color: white;
}
.container {
    margin-bottom: 20px;
}

</style>
<div class="container" style="min-width: 1110px; ">
    <div id="wrapper" style="height: auto">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"  
        style="border-radius: 5px;margin-bottom: 10px; margin-right: 20px; height: 450px" >

            <!-- Divider -->

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/happy/myPage?level=mypage">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size: 15px;">마이 페이지</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider" style="margin: 0">

            <!-- 식당 관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo" >
                    <span>내가 쓴 글</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        	<a class="collapse-item" href="/happy/myPage?level=mypage">커뮤니티</a><br/>
                        	<a class="collapse-item" href="/happy/myPage?level=mypage">레시피</a><br/>
                        	<a class="collapse-item" href="/happy/myPage?level=mypage">식단</a>
                    </div>
                </div>
            </li>
            
            <!-- 식단 관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities" >
                    <i class="fas fa-fw fa-table"></i>
                    <span>내가 쓴 댓글</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                       <a class="collapse-item" href="/happy/myPage?level=mypage">커뮤니티</a><br/>
                       <a class="collapse-item" href="/happy/myPage?level=mypage">레시피</a><br/>
                       <a class="collapse-item" href="/happy/myPage?level=mypage">식단</a>
                    </div>
                </div>
            </li>
            
            <!-- 레시피 관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRecipe"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-book"></i>
                    <span>좋아요</span>
                </a>
                <div id="collapseRecipe" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/happy/myPage?level=mypage">커뮤니티</a><br/>
                        <a class="collapse-item" href="/happy/myPage?level=mypage">레시피</a><br/>
                        <a class="collapse-item" href="/happy/myPage?level=mypage">식단</a>
                    </div>
                </div>
            </li>
            
            <!-- 커뮤니티 관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMenu"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-list"></i>
                    <span>식당 요청</span>
                    </a>
                <div id="collapseMenu" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/happy/myPage?level=ras&state=1">식당 추가 요청</a><br/>
                        <a class="collapse-item" href="/happy/myPage?level=ras&state=2">식당 수정 요청</a><br/>
                    </div>
                </div>    
            </li>
            
            <!-- 커뮤니티 관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSub"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-list"></i>
                    <span>문의 내역</span>
                    </a>
                <div id="collapseSub" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/happy/myPage?level=Inq&state=1">문의 내역</a><br/>
                        <a class="collapse-item" href="/happy/myPage?level=Inq&state=2">신고 내역</a><br/>
                    </div>
                </div>  
            </li>

            
	</ul>
    </div>
    
    
    
    <c:if test="${param.level == 'mypage' or param.level == none}">
    <div id="box_b" style="height: 450px;">
    		<h4 style="margin: 0 0 10px 0; padding:0 10px; ">내 정보</h4>

<div class="container2">
		<form method="post" id="joinEditForm1">
			<ul>
			<div style="background-color: blue; width: auto; height: auto;">
			<div style="width: 20%; height:auto; float: left;">
			<li><img src="img/testface.png" width="100" height="100" align="left" style="border-radius: 20px"/></li>
			</div>
			
			<div style="width: 30%; height:auto; float: left; padding-right: 30px;">
			<li>아이디: <b>${dto.username}</b></li>
			<li>닉네임: <b>${dto.nickname}</b></li>
			<li>성별: ${dto.gender}</li>
			<li>생년월일: ${dto.age}</li>
			<li>이메일: ${dto.email}</li>
			<li>선호 식단: ${dto.disease}</li><br/><br/>
			<li style="float: right ;"><a href="/happy/myPage/checkPassword" >개인정보 수정</a></li>
			</div>
			</div>
			<div style="width: 47%; height:auto; background-color: white; padding-right:10px; padding-bottom:10px; margin-right:20px; border-radius:7px; float: left;">
			<ul style="line-height:30px;">
				<c:if test="${dto.bmi ne 0.0}">
					<li><b>BMI: ${dto.bmi}</b></li>
					<li><b>비만도: ${dto.standardBmi}</b></li>
					<li>하루 권장 섭취 칼로리: ${dto.kal} kcal</li>
				<c:if test="${dto.standardBmi eq '저체중'}">
					<li>
						식이요법: 칼로리 섭취량을 늘리는 것이 중요합니다. 하루 섭취 칼로리는 체질에 맞게 적정량을 늘려줘야 합니다.<br/>
						관리법: 규칙적인 식사와 수면을 유지하고, 근육운동을 통해 체중을 늘려주는 것이 좋습니다.
					</li>
				</c:if>
				<c:if test="${dto.standardBmi eq '정상체중'}">
					<li> 
					식이요법: 균형잡힌 식단을 유지하면서 적정한 칼로리를 섭취하는 것이 중요합니다.<br/>
					관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 특히 유산소 운동을 하여 건강한 체중을 유지하는 것이 좋습니다.
					</li>
				</c:if>
				<c:if test="${dto.standardBmi eq '과체중'}">
					<li> 
						식이요법: 하루 권장 칼로리를 지키면서 식사량을 조절하는 것이 중요합니다. 단, 갑작스런 급감식은 건강에 해로울 수 있으므로 천천히 조절해야 합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 유산소 운동을 더 많이 하여 체중을 조절하는 것이 좋습니다.
					</li>
				</c:if>
				<c:if test="${dto.standardBmi eq '경도비만'}">
					<li>
						식이요법: 하루 권장 칼로리보다 적게 섭취하고, 탄수화물과 지방 섭취량을 줄이는 것이 중요합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다.
					</li>
				</c:if>
				
				<c:if test="${dto.standardBmi eq '중등도비만'}">
					<li>
						식이요법: 하루 권장 칼로리보다 적게 섭취하고, 탄수화물과 지방 섭취량을 더욱 줄이는 것이 중요합니다. 단, 단백질 섭취는 충분히 해야합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다. 건강한 체중 감량을 위해 전문의의 도움도 받을 수 있습니다.
					</li>
				</c:if>
				
				<c:if test="${dto.standardBmi eq '고도비만'}">
					<li>
						식이요법: 하루 권장 칼로리보다 적게 섭취하고, 건강한 식습관으로 바꾸는 것이 중요합니다. 단, 영양소 섭취에 유의해야 합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다. 전문의의 도움을 받아 건강한 체중 감량을 위해 진행해야 합니다.
					</li>
				</c:if>
					<li style="float: right;"><a href="/happy/myPage/checkBmi">BMI 수정하기</a></li>
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


	<c:if test="${param.level == 'ras'}">
		<div class="container">
	<br /> <br />
	<h2 style="display: inline-block;">식당 정보 업데이트 요청</h2>


	<form action="/happy/myPage/" method="get">
		<input id="te" type="text" name="level" value="ras"style="display: none;"/>
		<button type="submit" id="change-restaurant-button" name="state"
			value="2"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			식당 변경 정보</button>
		<button type="submit" id="add-restaurant-button" name="state"
			value="1"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			식당 추가 정보</button>
	</form>
	<br/>
	<br/>


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
								<td>
								<c:if test="${ResEditDTO.res_edit_type==1}">
                                    수정
                                </c:if>
                                <c:if test="${ResEditDTO.res_edit_type==2}">
                                <div class="delres" style="color:#007bff">
                                    삭제
                                </div>
                                </c:if>
								</td>
								
								<td>
								<c:if test="${ResEditDTO.res_status==4}">
		       						심사중
		    					</c:if> 
		    					<c:if test="${ResEditDTO.res_status==2}">
			  						 승인
								</c:if> 
								<c:if test="${ResEditDTO.res_status==3}">
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








	<c:if test="${param.level == 'Inq'}">
	<div class="container">
	<h3 style="display: inline-block;">문의 사항</h3>


	<form action="/happy/myPage" method="get">
	<input id="te" type="text" name="level" value="Inq" style="display: none;">
		<button type="submit" id="change-restaurant-button" name="state"
			value="2"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			신고 내역</button>
		<button type="submit" id="add-restaurant-button" name="state"
			value="1"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			문의 사항</button>
	</form>
	<br/><br/>

<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<table
				summary="This table shows how to create responsive tables using Datatables' extended functionality"
				class="table table-bordered table-hover dt-responsive">
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

					<c:forEach var ="ReportDTO" items="${list2}">
                                    	<tr>
                                          <td>
                                            <c:if test="${ReportDTO.report_response != 1}">
                                            <c:if test="${ReportDTO.board_type==1}">
				                                <a href="/happy/menuUserView?menu_no=${ReportDTO.report_post_no}">${ReportDTO.report_post_no}</a> 
				                                </c:if>
				                                <c:if test="${ReportDTO.board_type==2}">
				                                <a href="/happy/recipeUserView?recipe_no=${ReportDTO.report_post_no}">${ReportDTO.report_post_no}</a> 
				                                </c:if>
				                                <c:if test="${ReportDTO.board_type==3}">
				                                <a href="/happy/commView?comm_no=${ReportDTO.report_post_no}">${ReportDTO.report_post_no}</a> 
				                                </c:if>
				                            </c:if>    
                                            </td>
                                            <td>
                                             <c:if test="${ReportDTO.board_type==1}">
			                                    	식단
			                                    </c:if>
			                                 <c:if test="${ReportDTO.board_type==2}">
			                                    	레시피
			                                    </c:if>
			                                 <c:if test="${ReportDTO.board_type==3}">
			                                    	커뮤니티
			                                    </c:if>
                                            </td>

                                            <td>
                                             <c:if test="${ReportDTO.report_reason==1}">
			                                    	광고
			                                    </c:if>
			                                 <c:if test="${ReportDTO.report_reason==2}">
			                                    	비방
			                                    </c:if>
			                                 <c:if test="${ReportDTO.report_reason==3}">
			                                    	허위정보
			                                    </c:if>
			                                 <c:if test="${ReportDTO.report_reason==4}">
			                                    	기타
			                                    </c:if>
                                            </td>
											<td>${ReportDTO.report_text}</td>
                                            <td>${ReportDTO.report_date}</td>
                                            <td style="text-align:center; font-size:16px; ">
                                             <c:if test="${ReportDTO.report_status==0}">
			                                    	<b>처리예정</b>
			                                    </c:if>
			                                    <c:if test="${ReportDTO.report_status==1}">
			                                    	<div class="reportcomplete" style="color:red">
			                                    	<b>처리완료</b>
			                                    	</div>
			                                    </c:if>
                                            </td>
                                            <td style="text-align:center; font-size:16px;">
                                             <c:if test="${ReportDTO.report_response==0}">
			                                    	
			                                    </c:if>
			                                     <c:if test="${ReportDTO.report_response==1}">
			                                    	<b>승인</b>
			                                    </c:if>
			                                    <c:if test="${ReportDTO.report_response==2}">
			                                    	<div class="reportrescomplete" style="color:blue">
			                                    	<b>반려</b>
			                                    	</div>
			                                    </c:if>
                                            </td>
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
