<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
body {
	font-size: 140%;
}

h2 {
	text-align: left;
	padding: 0;
	margin-left: 15px;
	margin-top: -30px;
}

table caption {
	padding: .5em 0;
}

table.dataTable th, table.dataTable td {
	white-space: nowrap;
}

.p {
	text-align: center;
	padding-top: 140px;
	font-size: 14px;
}
</style>

<div class="container">
	<br /> <br />
	<h2 style="display: inline-block;">식당 정보 업데이트 요청</h2>


	<form action="/happy/myPage/userSupView" method="get">
		<button type="submit" id="change-restaurant-button" name="state"
			value="2"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			신고 내역</button>
		<button type="submit" id="add-restaurant-button" name="state"
			value="1"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			문의 사항</button>
	</form>
</div>

<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<table
				summary="This table shows how to create responsive tables using Datatables' extended functionality"
				class="table table-bordered table-hover dt-responsive">
				<c:if test="${param.state == '1' or param.state==null}">
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