<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46d3750493a46ebe690cd8ac9d3be958&libraries=services"></script>
<style>
	.resContainer{
		display:flex;
		justify-content:flex-end;
		flex-direction:row;
		height:2000px;
	}
	.resList{
		width:1300px;
		padding:0 15px;
	}
	.resSide{
		width:450px;
	}
	.titleWrap{
		padding:80px 60px 0;
	}
	.searchDiv{
		float:right;
		padding-top:20px;
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
	
	.thumbnail{
		width:320px;
		height:180px;
	}
	.wrap{
		width:200px;
		height:100px;
	}
	.desc{
		font-size:0.9em;
	}
	
	
</style>
<script>
	/* 검색어 미입력 상태에서 검색을 진행할 때 발생하는 함수 */
	$(function(){
		$("#searchForm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색에를 입력하세요...");
				return false;
			}
			return true;
		});
	});
</script>

<!-- banner -->
<div class= "banner">
	<img src="${pageContext.request.contextPath}/img/banner.png" width="100%" height="300px"/>
</div>

<div class="resContainer">
	<div class="resList">
		<div class="titleWrap">
			<div class="searchDiv">
				<form method="get" id="searchForm" action="res">
					<select name="searchKey"class="form-select" aria-label="Default select example" style=" display: inline; width: auto">
						<option value="res_name">식당이름 </option>
						<option value="res_addr">주소 </option>
					</select>
				
					<input type="text" name="searchWord" id="searchWord" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 200px; height:24.5px; display: inline;"/>
					<input type="submit" value="검색" class="btn-cta" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 70px; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;" />
				</form>
				
			</div>
			<!-- 소제목 -->
			<div class="row animate-box">
				<h1 class="title" style="display: inline; font-size: 40px">&nbsp식당&nbsp&nbsp</h1>
			</div>
			<hr style="height: 1px; background: black"/>
			<div class="btn-group" role="group" aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='res'">전체</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='res?searchKey=res_type&searchWord=채식음식점'">채식</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='res?searchKey=res_type&searchWord=채식가능음식점'">채식가능</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='res?searchKey=res_type&searchWord=저염실천음식점'">저염</button>
			</div>
		</div>
		
		<!-- 식당리스트 -->
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
		
		<div class="updateRequest">
			<button class="btn btn-primary" onclick="location.href='resUpdateReq'">업데이트요청</button>
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
		<div id="map" style="width:100%;height:350px;"></div>
		<!-- 베스트 맛집 -->
		<div class="resBest">
			<ul>		
				<li>
					<a href="res?searchKey=res_type&searchWord=채식음식점">
						<img class="thumbnail" src="${pageContext.request.contextPath}/img/vege.png"/>
						<span>채식 맛집 TOP10</span>
					</a>
				</li>
				<li>	
					<a href="res?searchKey=res_type&searchWord=저염실천음식점">
						<img class="thumbnail" src="${pageContext.request.contextPath}/img/lowNa.png"/>
						<span>저염식 맛집 TOP10</span>
					</a>
				</li>
				<li>
					<a href="res?searchKey=res_type&searchWord=채식음식점">
						<img class="thumbnail" src="${pageContext.request.contextPath}/img/vege.png"/>
						<span>채식 맛집 TOP10</span>
					</a>
				</li>
				<li>	
					<a href="res?searchKey=res_type&searchWord=저염실천음식점">
						<img class="thumbnail" src="${pageContext.request.contextPath}/img/lowNa.png"/>
						<span>저염식 맛집 TOP10</span>
					</a>
				</li>
				<li>
					<a href="res?searchKey=res_type&searchWord=채식음식점">
						<img class="thumbnail" src="${pageContext.request.contextPath}/img/vege.png"/>
						<span>채식 맛집 TOP10</span>
					</a>
				</li>
				<li>	
					<a href="res?searchKey=res_type&searchWord=저염실천음식점">
						<img class="thumbnail" src="${pageContext.request.contextPath}/img/lowNa.png"/>
						<span>저염식 맛집 TOP10</span>
					</a>
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
	            	content: '<div class="wrap">'+
	            			 '    <div class="info">'+
	            			 '	      <div class="title" style="font-size:1.2em">'+
	            			 '            <a href="resView?res_no=${resDTO.res_no}&nowPage=${vo.nowPage}"><b>${resDTO.res_name}</b></a>'+
	            			 '        </div>'+
	            			 '        <div class="infobody">'+
	            			 '            <div class="desc">'+
	            			 '                <div class="info_restype">${resDTO.res_type}</div>'+
	            			 '                <div class="info_rescategory">${resDTO.res_category}</div>'+
	            			 '            </div>'+
	            			 '        </div>'+
	            			 '    </div>'+
	            			 '</div>',
	            			 
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