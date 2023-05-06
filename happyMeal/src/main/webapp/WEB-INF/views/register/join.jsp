<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	.container{
		position:relative;
	}
	#joinForm{
		width:600px;
		margin:0 auto;
		padding:10px;
		
	}
	#joinForm h2 {
  		text-align: center;
  		margin: 30px;
	}
	.input-box, .input-box2{
  		position:relative;
  		margin:20px 0;
	}
	.input-box > input{
  		background:transparent;
  		border:none;
  		border-bottom: solid 1px #ccc;
  		padding:20px 0px 5px 0px;
  		font-size:14pt;
  		width:100%;
	}
	.input-box2 > input{
		background:transparent;
		border:none;
		border-bottom: solid 1px #ccc;
		padding:20px 0px 5px 0px;
		width:100%;
	}
	.genderCheck > span, .diseaseCheck > span{
		font-size:19px;
		color:#aaa;
		margin-right:50px;
	}
	
	input::placeholder{
		color:transparent;
	}
	input:placeholder-shown + label{
  		color:#aaa;
  		font-size:14pt;
  		top:15px;
	}
	input:focus + label, label{
	  color:#8aa1a1;
	  font-size:10pt;
	  pointer-events: none;
	  position: absolute;
	  left:0px;
	  top:0px;
	  transition: all 0.2s ease ;
	  -webkit-transition: all 0.2s ease;
	  -moz-transition: all 0.2s ease;
	  -o-transition: all 0.2s ease;
	}
	input:focus, input:not(:placeholder-shown){
	  border-bottom: solid 1px #8aa1a1;
	  outline:none;
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
	.id-ok{
		color:#6A82FB;
		font-size:0.9em;
		display:none;
	}
	.id-already{
		color:red;
		font-size:0.9em;		
		display:none;
	}
	.id-invalid {
    	color:red;
		font-size:0.9em;		
		display:none;
    }
	.pwd2-ok{
		color:#6A82FB;
		font-size:0.9em;
		display:none;
	}
	.pwd2-discord{
		color:red;
		font-size:0.9em;		
		display:none;
	}
	.username-ok{
	    color:#6A82FB;
	    font-size:0.9em;
	    display:none;
	}
	.username-invalid{
	    color:red;
	    font-size:0.9em;
	    display:none;
	}
</style>
<script>
	function checkId(){
	    var userid = $("#userid").val(); //id값이 "userid"인 입력란의 값을 저장
			
	    if(/^[A-Za-z]{1}\w{4,11}$/.test(userid)){ // 정규식 패턴에 부합하는 경우
	        $.ajax({
	        	url: './idCheck', // Controller에서 요청받을 주소
	        	type:'POST', //POST 방식으로 전달
	        	data:{userid:userid},
	        	success:function(cnt){//컨트롤러에서 넘어온 cnt값을 받는다.
	            if(cnt==0){//cnt가 0이면 -> 사용 가능한 아이디
	            	$('.id-ok').css("display","inline-block");
	            	$('.id-already').css("display","none");
	            	$('.id-invalid').css("display","none");
	            } else{//cnt가 1일 경우 -> 이미 존재하는 아이디
	            	$('.id-already').css("display","inline-block");
	            	$('.id-ok').css("display","none");
	            	$('.id-invalid').css("display","none");
	            }
	
	        	},error:function(){
	            	alert("error!!!")
	        	}
	        });
	    }else{ // 정규식 패턴에 부합하지 않는 경우
	        $('.id-invalid').css("display","inline-block");
	        $('.id-ok').css("display","none");
	        $('.id-already').css("display","none");
	    }
	}
	$(function(){
		
		const userPwd = document.getElementById("userpwd");
		const userPwd2 = document.getElementById("userpwd2");
		const pwd2Ok = document.querySelector(".pwd2-ok");
		const pwd2Discord = document.querySelector(".pwd2-discord");

		userPwd2.addEventListener("keyup", function() {
		    if (userPwd.value === userPwd2.value) {
		    	pwd2Ok.style.display = "block";
		    	pwd2Discord.style.display = "none";
		    } else {
		    	pwd2Ok.style.display = "none";
		    	pwd2Discord.style.display = "block";
		    }
		});
		
		userPwd.addEventListener("keyup", function() {
			userPwd2.value = "";
			pwd2Ok.style.display = "none";
			pwd2Discord.style.display = "none";
		});

		userPwd.addEventListener("blur", function() {
			userPwd2.value = "";
			pwd2Ok.style.display = "none";
			pwd2Discord.style.display = "none";
		});
		
		
		function checkName(){
			var username = $("#username").val();
			    
			if(!/^[가-힣]{2,10}$/.test(username)){
				$('.username-invalid').css("display","inline-block");
				$('.username-ok').css("display","none");
			} else {
				$('.username-ok').css("display","inline-block");
				$('.username-invalid').css("display","none");
			}
		}
		
		$("#username").on("input", function(){
			checkName();
		});
			
		//유효성검사
		$("#joinForm").submit(function(){
			//아이디검사
			if($("#userid").val()==""){
				alert("아이디를 입력하세요..");
				return false;
			}
			//아이디검사
			//첫번째문자 영대소문자
			//영어대소문자, 숫자, _가능
			//글자길이 5~12글자
			//var reg = /^[A-Za-z]{1}[A-Za-z_]{7,14}$/
			var reg = /^[A-Za-z]{1}\w{4,11}$/
			
			if(!reg.test($("#userid").val()) ){//   유효한 값이면 true, 잘못된 데이터면 false
				alert("아이디는 알파벳 대소문자로 시작하여야 하며, 알파벳, 숫자, _가능, 길이는 5~12글자까지 가능");
				return false;
			}
			if($("#idStatus").val()=="N"){
				alert("아이디 중복검사를 하세요.");
				return false;
			}
			//비밀번호
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if($("#userpwd").val()!=$("#userpwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			//이름검사
			reg = /^[가-힣]{2,10}$/
			if(!reg.test($("#username").val())){
				alert("이름은 2~10글자까지 한글만 가능합니다.");
				return false;
			}
			//이메일검사
			//아이디는 5~12글자, @필수
			reg = /^\w{6,15}@[a-zA-Z]{2,8}.[a-z]{2,5}(.[a-z]{2,5})?$/
			if(!reg.test($("#email").val())){
				alert("이메일을 잘못입력하였습니다.");
				return false;
			}
			//질병 1개이상 반드시 선택
			var diseaseCount = 0;
			$("input[name=diseaseArr]").each(function(){
				if(this.checked==true)  diseaseCount++;
			});
			
			if(diseaseCount<1){
				alert("식단은 1개이상 선택하여야 합니다. 없을경우 '해당없음'을 선택하세요.");
				return false;
			}
			
			//form태그의 action속성 설정
			$("#joinForm").attr("action","joinOk");
		});
	});
</script>
<div class="container">	 
	<form method="post" id="joinForm">
		<h2>회원가입</h2>
		<div class="input-box">
        	<input type="text" name="userid" id="userid" value="" minlength="5" maxlength="12" placeholder="아이디" oninput="checkId()"/>
			<label for="userid">아이디</label>
			<span class="id-ok">사용 가능한 아이디입니다.</span>
			<span class="id-already">사용 불가능한 아이디입니다.</span>
			<span class="id-invalid">아이디는 알파벳 대소문자로 시작하여야 하며, 알파벳, 숫자, _가능, 길이는 5~12글자까지 가능</span>
		</div>
		
        <div class="input-box">
		    <input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" placeholder="비밀번호"/>
		    <label for="userpwd">비밀번호</label>
		</div>
		
		<div class="input-box">
		    <input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호 확인"/>
		    <label for="userpwd2">비밀번호 확인</label>
		    <span class="pwd2-ok">비밀번호가 일치합니다.</span>
			<span class="pwd2-discord">비밀번호가 일치하지 않습니다.</span>
		</div>
		
		<div class="input-box">
		    <input type="text" name="username" id="username" minlength="2" maxlength="10" placeholder="이름"/>
		    <label for="username">이름</label>
		    <span class="username-ok">이름이 유효합니다.</span>
			<span class="username-invalid">이름은 2~10글자까지 한글만 가능합니다.</span>
		</div>
		
	    <div class="input-box2">
	        <input type="date" name="age" id="age"/>
	    </div>
	    
	    <div class="input-box2 genderCheck">
	    	<span>성별</span>
		    <div class="form-check form-check-inline">
			  여<input type="radio" class="form-check-input" name="gender" value="여성" checked>
			</div>
			<div class="form-check form-check-inline">
			  남<input type="radio" class="form-check-input" name="gender" value="남성">
			</div>
	    </div>
	    
	    <div class="input-box">
	        <input type="text" name="nickname" id="nickname" placeholder="닉네임"/>
	        <label for="nickname">닉네임</label>
	    </div>
	    
	    <div class="input-box">
	        <input type="text" name="email" id="email" value="" placeholder="이메일"/>
	        <label for="email">이메일</label>
	    </div>
	    
		
		<!-- 식단 정보 라디오 버튼 -->
		<div class="input-box2">
	    	<span>맞춤 식단 추천 받기</span><br/>
		    <div class="form-check form-check-inline">
			  해당없음<input type="radio" class="form-check-input" name="diseaseArr" value="해당없음" checked>
			</div>
			<div class="form-check form-check-inline">
			  일반식<input type="radio" class="form-check-input" name="diseaseArr" value="일반식">
			</div>
			<div class="form-check form-check-inline">
			  당뇨식<input type="radio" class="form-check-input" name="diseaseArr" value="당뇨식">
			</div>
			<div class="form-check form-check-inline">
			  연식<input type="radio" class="form-check-input" name="diseaseArr" value="연식">
			</div>
			<div class="form-check form-check-inline">
			  저염식<input type="radio" class="form-check-input" name="diseaseArr" value="저염식">
			</div>
			<div class="form-check form-check-inline">
			  저요오드식<input type="radio" class="form-check-input" name="diseaseArr" value="저요오드식">
			</div>
			<div class="form-check form-check-inline">
			  항암식<input type="radio" class="form-check-input" name="diseaseArr" value="항암식">
			</div>
	    </div>
		
		
		
		
		<input type="submit" class="btn" value="Sign up"/>
	
	</form>
</div>
