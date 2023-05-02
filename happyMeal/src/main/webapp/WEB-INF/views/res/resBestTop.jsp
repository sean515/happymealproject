<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.resContainer{
		height:2800px;
	}
	.resList{
		width:1000px;
		padding:0 15px;
		margin:0 200px;
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
	.bestList_list{
		display:flex;
		flex-direction:row;
		padding:30px 0;
		border-bottom:1px solid #ddd;
	}
	.resThumb img{
		width:150px;
		height:150px;
	}
	.resThumb{
		margin-right:50px;
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
			<h1 class="title" style="display: inline; font-size: 40px">맛집 TOP10</h1>
		</div>
	</div>
		
	<div class="resList">
		<!-- 식당리스트 -->
		<div class="resBestList">
			<ul>
				<c:forEach var="bDTO" items="${list}" varStatus="status" end="9">
					<li class="bestList_list">
						<div class="resThumb"><a href="resView?res_no=${bDTO.res_no }"><img src="http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00028_2.png"/></a></div>
						<a href="resView?res_no=${bDTO.res_no }">
							<div class="resInfo">
								<h3>${bDTO.res_name }</h3>
								<h6>${bDTO.res_addr }</h6>
								<h6>${bDTO.res_type }</h6>
								<h6>${bDTO.res_category }</h6>
								<h6>조회수   ${bDTO.res_hit }</h6>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>			
		</div>
	</div>
</div>