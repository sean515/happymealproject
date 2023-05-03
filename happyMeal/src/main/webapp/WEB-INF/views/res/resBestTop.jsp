<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.resContainer{
		height:2900px;
	}
	.resList{
		width:1000px;
		padding:0 15px;
		margin:0 auto;
	}
	.titleWrap{
		width:100%;
		height:200px;
		background-color:#f7f7f7;
		text-align:center;
	}
	.title{
		margin-top:70px;
	}
	.resBestList{
		margin:0 auto;
	}
	.bestList_list{
		display:flex;
		flex-direction:row;
		padding:30px 0;
		border-bottom:1px solid #ddd;
	}
	.resThumb img{
		width:250px;
		height:200px;
	}
	.resThumb{
		margin-right:100px;
	}
	.resInfo{
		width:400px;
	}
		
</style>

<!-- banner -->
<div class= "banner">
	<img src="${pageContext.request.contextPath}/img/banner.png" width="100%" height="300px"/>
</div>

<div class="resContainer">
	<div class="titleWrap">
		<!-- 소제목 -->
		<div class="row animate-box">
			<h1 class="title" style="display: inline; font-size: 40px">
				<c:set var="paramName" value="res_type"/><!-- 파라미터 이름 지정 -->
				<c:if test="${empty param.res_type }">
					<c:set var="paramName" value="res_category"/><!-- 파라미터 이름을 res_category로 변경 -->
				</c:if>
				<p>${param[paramName]} 맛집 TOP10</p>
			</h1>
		</div>
	</div>
		
	<div class="resList">
		<!-- 식당리스트 -->
		<div class="resBestList">
			<ul>
				<c:forEach var="bDTO" items="${list}" varStatus="status" end="9">
					<li class="bestList_list">
						<div class="resThumb"><a href="resView?res_no=${bDTO.res_no }"><img src="${empty bDTO.res_image ? "http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00028_2.png" : bDTO.res_image}"/></a></div>
						<a href="resView?res_no=${bDTO.res_no }">
							<div class="resInfo">
								<h2>${bDTO.res_name }</h2>
								<h5>${bDTO.res_addr }</h5>
								<h6>${bDTO.res_type }, ${bDTO.res_category }</h6>
								<h6>조회수   ${bDTO.res_hit }</h6>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>			
		</div>
	</div>
</div>