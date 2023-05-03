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


	<form action="/happy/myPage/userResUpdate" method="get">
		<button type="submit" id="change-restaurant-button" name="state"
			value="2"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			식당 변경 정보</button>
		<button type="submit" id="add-restaurant-button" name="state"
			value="1"
			style="float: right; border: none; color: white; background-color: #8BC34A; padding: 4px 10px;">
			식당 추가 정보</button>
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
							<th>식당명</th>
							<th>식당 구분</th>
							<th>요청일</th>
							<th>요청 결과</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="ResDTO" items="${list1}">
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

						<c:forEach var="ResEditDTO" items="${list2}">
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

</div>