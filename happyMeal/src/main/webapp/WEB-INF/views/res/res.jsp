<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46d3750493a46ebe690cd8ac9d3be958&libraries=services"></script>
<style>
	.resContainer{
		display:flex;
		flex-direction:row;
		height:2000px;
	}
	.resList{
		width:70%;
	}
	.resSide{
		width:30%;
		background-color:#E3F8FF;
	}

	.justify-content-center {
	    justify-content: center!important;
	}
	
	.page-link {
	    color: #8BC34A; 
	    background-color: #000;
	    border-color: #444;
	}
	
	.page-item.active .page-link {
	    z-index: 1;
	    color: white;
	    font-weight:bold;
	    background-color: #8BC34A ;
	    border-color: #8BC34A;
	 
	}
	
	.page-link:focus, .page-link:hover {
	    color: #ccc;
	    background-color: #222; 
	    border-color: #444;
	}
	  
	.pagination > li > a, .pagination > li > span {
	    position: relative;
	    float: left;
	    padding: 7px 15px;
	    text-decoration: none;
	    color: #8BC34A;
	    background-color: #fff;
	    border: 0.5px solid #8BC34A;
	    margin-left: -1px;
	    font-size: 12px;
	}
	
	
</style>

<!-- banner -->
<div class= "banner">
	<img src="${pageContext.request.contextPath}/img/banner.png" width="100%" height="300px"/>
</div>

<div class="resContainer">
	<!-- 식당리스트 -->
	<div class="resList">
		<!-- 소제목 -->
		<div class="row animate-box">
			<h1 class="title" style="display: inline; font-size: 40px">&nbsp식당&nbsp&nbsp</h1>
		</div>
		
		<div>
			<ul class="res" style="overflow: hidden; padding-left: 0;">
				<div id="fh5co-staff">
					<div class="container">
						<div class="row">
							<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
							<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
								<c:forEach var="rDTO" items="${list}">	
									<div class="col-md-3 animate-box text-center">
										<div class="staff">
											<div class="staff-img" style="background-image: url('http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00028_2.png');">
											</div>
											<h3><a href="resView?res_no=${rDTO.res_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${rDTO.res_name }</a></h3>
											<p> </p>
											<p>${rDTO.res_type } </p>	
										</div>
									</div>
								</c:forEach>
							<c:set var="recordNum" value="${recordNum-1 }"></c:set>	
						</div>
					</div>
				</div>
			</ul>
		</div>
		
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
				      <a class="page-link" href="res?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
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
						<a class="page-link" href="res?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
						</c:if>
					</c:forEach>
			   
			   	<!-- 다음페이지 -->
			   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
			    <li class="page-item">
			      <a class="page-link" href="res?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
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
		
		
	</div>
	<!-- 사이드페이지 -->
	<div class="resSide">
		<!-- 지도 -->
		<div id="map" style="width:100%;height:450px;"></div>
		<!-- 베스트 맛집 -->
		<div class="resBest">
			<ul>
				<li>
					
				</li>
			</ul>
		</div>
	</div>
</div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
	    	center: new kakao.maps.LatLng(37.63700, 127.02504), // 지도의 중심좌표
	    	level: 6, // 지도의 확대 레벨
	    	mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 
	
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>    
			<c:forEach var="resDTO" items="${list}" varStatus="status">
	        	{
	            	content: '<div>${resDTO.res_name}</div>', 
	            	latlng: new kakao.maps.LatLng(${resDTO.res_latitude}, ${resDTO.res_longitude})
	        	}${not status.last ? ',' : ''}
	    	<c:set var="recordNum" value="${recordNum-1 }"></c:set>
	    </c:forEach>
	];
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	    
	    bounds.extend(positions[i].latlng);
		
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    
	    setBounds();
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
	
</script>