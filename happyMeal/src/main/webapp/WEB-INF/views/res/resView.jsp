<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.resContainer{
		display:flex;
		flex-direction:row;
		height:2000px;
	}
	.resContent{
		width:70%;
		padding:0 20px;
	}
	.resSide{
		width:30%;
		background-color:#E3F8FF;
	}
	.resInfo, .resReview{
		width:800px;
		margin:20px auto 0;
	}
	th{
		width:100px;
	}
	.update_date{
		float:right;
	}
</style>

<!-- 배너 -->
<div class= "banner">
	<img src="img/banner.png" width="100%" height="150px"/>
</div>

<div class="resContainer">
	<div class="resContent">
		<div class="inner">
			<div class="resInfo">
				<header>
					<div class="resTitle">
						<span class="title">
							<h1>${dto.res_name }</h1>
							<strong>
								<span>4.6</span>
							</strong>
							<p>${dto.res_type }</p>
						</span>
					</div>
					<div class="Status">
						<span>${dto.res_hit }</span>
						<span>${dto.res_like }</span>
						<span>리뷰</span>
					</div>
				</header>
				<hr style="height: 3px; background: black"/>
				<table class="resDetail">
					<tbody>
						<tr>
							<th>주소</th>
							<td>${dto.res_addr }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${dto.res_tel }</td>
						</tr>
						<tr>
							<th>식당구분</th>
							<td>${dto.res_type}</td>
						</tr>
						<tr>
							<th>음식종류</th>
							<td>${dto.res_category }</td>
						</tr>
						<tr>
							<th>영업시간</th>
							<td>${dto.res_time }</td>
						</tr>
						<tr>
							<th>특이사항</th>
							<td>${dto.res_note }</td>
						</tr>
					</tbody>
				</table>
				<p class="update_date">업데이트 : ${dto.res_date }</p>
			</div>
			<div class="resReview">
			
			</div>
		</div>
	</div><!-- resContent end -->
	<div class="resSide">
		<!-- 지도 -->
		<div id="map" style="width:100%;height:450px;"></div>
		
	</div><!-- resSide end -->
</div><!-- resContainer end -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46d3750493a46ebe690cd8ac9d3be958&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(${dto.res_latitude}, ${dto.res_longitude}), // 지도의 중심좌표
			level: 6, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${dto.res_latitude}, ${dto.res_longitude});
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	

</script>