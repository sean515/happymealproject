<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.container{
		position:relative;
	}
	#resUpdateForm{
		width:600px;
		margin:0 auto;
		padding:10px;
	}
	#resUpdateForm h2 {
  		text-align: center;
  		margin: 30px;
	}
	input[type=submit]{
		background-color: #8aa1a1;
		border:none;
		color:white; 
		border-radius: 5px;
		width:100%;
		height:40px;
		font-size: 14pt;
		margin-top:100px;
	}
	
	
</style>
<script>
	$(function(){
		
		$("#resUpdateForm").submit(function(){
			if($("#res_type").val()==""){
				alert('식당유형을 선택하세요');
				return false;
			}
			if($("#res_name").val()==""){
				alert('점포명을 입력하세요');
				return false;
			}
			if($("#res_addr1").val()==""){
				alert('주소를 입력하세요');
				return false;
			}
			
			var res_addr = $("#res_addr1").val()+$("#res_addrExtra").val()+" "+$("#res_addrDetail").val();
			document.getElementById("res_addr").value = res_addr;
			
			$("#resUpdateForm").attr("action", "resUpdateOk");
		});
	});
	
	function addOpeningHours() {
		var dayOfWeek = document.getElementById("dayOfWeek").value;
		var openingTime = document.getElementById("openingTime").value;
		var closingTime = document.getElementById("closingTime").value;

		// 요일, 영업 시작 시간, 종료 시간을 출력
		document.getElementById("openingHours").innerHTML += dayOfWeek + ": " + openingTime + " - " + closingTime + "<br>";

		// 추가된 영업시간 값을 res_time 요소에 저장
		var resTimeElement = document.getElementById("res_time");
		resTimeElement.value += dayOfWeek + ": " + openingTime + " - " + closingTime + ";";
	}
	
</script>

<div class="container">	 
	<form method="post" id="resUpdateForm">
		<h2>식당 업데이트 요청</h2>
		
		<!-- 식당유형 -->
		<div class="res_Type">
	    	<span style="margin-right:20px">식당유형 <span style="color:red;">※필수</span></span>
		    <div class="form-check form-check-inline">
			  채식<input type="radio" class="form-check-input" name="res_type" id="res_type" value="채식음식점">
			</div>
			<div class="form-check form-check-inline">
			  채식가능<input type="radio" class="form-check-input" name="res_type" id="res_type" value="채식가능음식점">
			</div>
			<div class="form-check form-check-inline">
			  저염<input type="radio" class="form-check-input" name="res_type" id="res_type" value="저염실천음식점">
			</div>
	    </div>
		<!-- 점포명 -->
		<div class="res_name mb-3">
		    <input class="form-control" type="text" name="res_name" id="res_name" placeholder="점포명    ※필수" aria-label="default input example">
		</div>
		<!-- 식당주소 -->
		<div class="res_addr mb-3">
			<input type="button" onclick="res_addrSearch()" value="주소 찾기"><br>
			<input class="form-control" type="text" name="res_addr1" id="res_addr1" placeholder="주소    ※필수" aria-label="default input example">
			<input class="form-control" type="text" name="res_addrExtra" id="res_addrExtra" placeholder="참고주소    ※필수" aria-label="default input example">
			<input class="form-control" type="text" name="res_addrDetail" id="res_addrDetail" placeholder="상세주소" aria-label="default input example">
			<input type="hidden" name="res_addr" id="res_addr" value="">
			<input type="hidden" name="res_latitude" id="res_latitude" value="">
			<input type="hidden" name="res_longitude" id="res_longitude" value="">
		</div>
		<!-- 전화번호 -->
		<div class="res_tel mb-3">
		    <input class="form-control" type="text" name="res_tel" id="res_tel" placeholder="전화번호  -  포함해서 입력해주세요(예시: 02-1234-5678)" aria-label="default input example">
		</div>
		<!-- 식당카테고리 -->
		<div class="res_category mb-3">
			<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="res_category" id="res_category">
			    <option value="">식당 카테고리</option>
			    <option value="한식">한식</option>
			    <option value="중국식">중국식</option>
			    <option value="일식">일식</option>
			    <option value="양식">양식</option>
			    <option value="동남아">동남아</option>
			    <option value="인도/중동">인도/중동</option>
			    <option value="분식">분식</option>
			    <option value="탕류">탕류</option>
			    <option value="복어취급">복어취급</option>
			    <option value="김밥(도시락)">김밥(도시락)</option>
			    <option value="술집">술집</option>
			    <option value="카페">카페</option>
			    <option value="베이커리">베이커리</option>
			    <option value="기타(일반음식점)">기타(일반음식점)</option>
			    
			</select>
		</div>
		
		
		<div class="res_time mb-3">
			<span>영업시간</span>
			<br>
			<label for="dayOfWeek">요일:</label>
			<select id="dayOfWeek" name="dayOfWeek">
				<option value="월">월요일</option>
				<option value="화">화요일</option>
				<option value="수">수요일</option>
				<option value="목">목요일</option>
				<option value="금">금요일</option>
				<option value="토">토요일</option>
				<option value="일">일요일</option>
			</select>
			<label for="openingTime">영업 시작 :</label>
			<input type="time" id="openingTime" name="openingTime">
			<label for="closingTime">영업 종료 :</label>
			<input type="time" id="closingTime" name="closingTime">
			<input type="button" value="추가" onclick="addOpeningHours()">
			<input type="button" value="리셋" onclick="delOpeningHours()">
			<p>입력된 영업시간:</p>
			<div id="openingHours">
			</div>
			<input type="hidden" name="res_time" id="res_time">
		</div>
		
			    
	    <div class="res_note mb-3">
	        <textarea class="form-control" name="res_note" id="exampleFormControlTextarea1" value="" rows="4" placeholder="특이사항"></textarea>
	    </div>
	    
	    <input type="hidden" name="res_status" value="4">
	    
		<input type="submit" class="btn" value="요청"/>
	
	</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46d3750493a46ebe690cd8ac9d3be958&libraries=services"></script>
<script>
    
	//res_time 요소에 저장된 값을 출력
	var resTimeElement = document.getElementById("res_time");
	resTimeElement.addEventListener("change", function() {
	    document.getElementById("openingHours").innerHTML = "";
	    var openingHours = this.value.split(";");
	    for (var i = 0; i < openingHours.length; i++) {
	        if (openingHours[i] === "") {
	            continue;
	        }
	        var openingHour = openingHours[i].split(": ");
	        document.getElementById("openingHours").innerHTML += openingHour[0] + ": " + openingHour[1] + "<br>";
	    }
	});
	function delOpeningHours(){
        // 추가된 영업시간 제거
        document.getElementById("openingHours").innerHTML = "";
        
        // 추가된 영업시간 값을 저장하는 요소 초기화
        var resTimeElement = document.getElementById("res_time");
        resTimeElement.value = "";
     }
    
    
    function res_addrSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("res_addrExtra").value = extraAddr;
                
                } else {
                    document.getElementById("res_addrExtra").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("res_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("res_addrDetail").focus();
                
             	// 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch(addr, function(result, status) {

                    // 정상적으로 검색이 완료됐으면 
                    if (status === kakao.maps.services.Status.OK) {

                        var latlng = new kakao.maps.LatLng(result[0].y, result[0].x);
                        var res_lat = latlng.getLat();
                        var res_lng = latlng.getLng();
						
                        document.getElementById("res_latitude").value = res_lat;
                        document.getElementById("res_longitude").value = res_lng;
                        console.log(res_lat);
                        console.log(res_lng);
                    } 
                });
            }
        }).open();
    }
</script>
