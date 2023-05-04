<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	#registerEditForm ul{
		overflow:auto;
	}
	#registerEditForm li{
		float:left;
		width:20%;
		padding:10px 0;
		border-bottom:1px solid #ddd;
		line-height:40px;
		margin:0 auto;
	}
	#registerEditForm2 ul{
		overflow:auto;
	}
	#registerEditForm2 li{
		float:left;
		width:20%;
		padding:10px 0;
		line-height:40px;
		margin:0 auto;
	}
	#registerEditForm li:nth-child(2n){
		width:80%;
	}
	#registerEditForm li:last-child{
		width:80%;
		border-bottom:0;
	}
	#addr{width:80%;}
	.container{
		width:1000px;
	}
	.wrap {
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -86px;
		margin-left: -89px;
		text-align: center;
	}
	
	input[type=submit]{
		color: rgba(30, 22, 54, 0.6);
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
		border:none;
		
		border-radius: 5px;
		font-size: 12pt;
		margin-top:30px;
		width:100%;
		
		-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		display: block;
		max-width: 180px;
		text-decoration: none;
	}
	input[type=submit]:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
</style>
<script>
	$(function(){
		//유효성검사
		$("#registerEditForm").on('submit', function(){
			
			// 닉네임
			if($("#nickname").val()==""){
				alert("닉네임은 필수 입력 사항입니다.");
				return false;
			}
			})
			// 성별
			var genderCount = 0;
			$("input[name=gender]").each(function(){
				if(this.checked==true)  genderCount++;
			});
			
			if(genderCount<1){
				alert("성별은 반드시 선택하여야 합니다.");
				return false;
			}
			//아이디는 6~15글자, @필수
			reg = /^\w{6,15}@[a-zA-Z]{2,8}.[a-z]{2,5}(.[a-z]{2,5})?$/
			if(!reg.test($("#email").val())){
				alert("이메일을 잘못입력하였습니다.");
				return false;
			}
			// 질병 정보 1개 이상 반드시 선택
			var diseaseCount = 0;
			$("input[name=diseaseArr]").each(function(){
				if(this.checked == true) diseaseCount++;
			});
			
			if(diseaseCount < 1){
				alert("질병 정보는 1개이상 선택하여야 합니다. 없을 경우 '해당사항 없음'을 선택하세요.");
				return false;
			}
			// 질병 정보 "해당사항 없음"을 선택하면 나머지 체크박스 비활성화
			/*
			function chkDisable(){
				document.getElementById("chk1").disabled=document.getElementById("chk5").checked;
				document.getElementById("chk2").disabled=document.getElementById("chk5").checked;
				document.getElementById("chk3").disabled=document.getElementById("chk5").checked;
				document.getElementById("chk4").disabled=document.getElementById("chk5").checked;
			}
			*/
			
			$(document).ready(function(){
				$("#chk5").click(function(){
					if(this.checked){
						$("input.applicable:checkbox").prop("disabled", true);
						$("input.applicable:checkbox").css("background", "#ccc");
					}
				});
				$("#chk1").click(function(){
					if(this.checked){
						$("input.applicable:checkbox").prop("disabled",false);
						$("input.applicable:checkbox").css("background", "none");
					}
				});
			});
			
			//form태그의 action속성 설정
			$("#registerEditForm").attr("action","registerEditOk");
		});
	});
</script>
<div class="container"><br/><br/>
	<h1>개인 정보 수정</h1><br/><br/>
	<form method="post" action="registerEditOk" id="registerEditForm">
		<ul>
			<li>이름</li>
			<li><input type="text" name="username" id="username" minlength="2" maxlength="10" value="${dto.username}" style="height:40px;"readonly/></li>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${dto.userid}" style="height:40px;" readonly/></li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" value="${dto.userpwd}" style="height:40px;"/></li>
			<li>닉네임</li>
			<li><input type="text" name="nickname" id="nickname" minlength="2" maxlength="10" value="${dto.nickname}" style="height:40px;"/></li>
			<li>생년월일</li>
			<li><input type="date" name="age" id="age" style="height:40px;"/></li>
			<li>성별</li>
			<li>
				<input type="radio" name="gender" value="남성" <c:forEach var="h" items="${dto.gender}"><c:if test="${h=='남성'}">checked</c:if></c:forEach>/>남성
				<input type="radio" name="gender" value="여성" <c:forEach var="h" items="${dto.gender}"><c:if test="${h=='여성'}">checked</c:if></c:forEach>/>여성
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" style="height:40px;" value="${dto.email}"/></li>
			<li>맞춤 식단 추천 받기</li>
			<li>
			<!-- 식단 정보 라디오 버튼 -->
		<div class="input-box2">
		    <div class="form-check form-check-inline">
			  해당없음<input type="radio" class="form-check-input" name="diseaseArr" value="해당없음" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='해당없음'}">checked</c:if></c:forEach>/>
			</div>
			<div class="form-check form-check-inline">
			  일반식<input type="radio" class="form-check-input" name="diseaseArr" value="일반식" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='일반식'}">checked</c:if></c:forEach>/>
			</div>
			<div class="form-check form-check-inline">
			  당뇨식<input type="radio" class="form-check-input" name="diseaseArr" value="당뇨식"<c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='당뇨식'}">checked</c:if></c:forEach>/>
			</div>
			<div class="form-check form-check-inline">
			  연식<input type="radio" class="form-check-input" name="diseaseArr" value="연식"<c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='연식'}">checked</c:if></c:forEach>/>
			</div>
			<div class="form-check form-check-inline">
			  저염식<input type="radio" class="form-check-input" name="diseaseArr" value="저염식"<c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='저염식'}">checked</c:if></c:forEach>/>
			</div>
			<div class="form-check form-check-inline">
			  저요오드식<input type="radio" class="form-check-input" name="diseaseArr" value="저요오드식"<c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='저요오드식'}">checked</c:if></c:forEach>/>
			</div>
			<div class="form-check form-check-inline">
			  항암식<input type="radio" class="form-check-input" name="diseaseArr" value="항암식"<c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='항암식'}">checked</c:if></c:forEach>/>
			</div>
	    </div>
			</li>
				
			<li>
				<input type="submit" value="회원정보 수정하기" style="height:40px;"/>
			</li>
		</ul>
	</form>
</div>