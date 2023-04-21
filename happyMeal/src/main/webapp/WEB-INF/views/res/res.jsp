<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46d3750493a46ebe690cd8ac9d3be958&libraries=services"></script>
<style>
	.resContainer{
		display:flex;
		flex-direction:row;
		height:1000px;
	}
	.resList{
		width:70%;
		background-color:#FFF9E0;
	}
	.resSide{
		width:30%;
		background-color:#E3F8FF;
	}
</style>

<div class="resContainer">
	<div class="resList">resList</div>
	<div class="resSide">
		<div id="map" style="width:100%;height:450px;"></div>
		
	</div>
</div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
	    	center: new kakao.maps.LatLng(37.56596, 126.94513), // 지도의 중심좌표
	    	level: 7, // 지도의 확대 레벨
	    	mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('김해시 대청로210번길 13', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
</script>