<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	#checkPasswordForm ul{
		overflow:auto;
	}
	#checkPasswordForm li{
		float:left;
		width:20%;
		padding:10px 0;
		border-bottom:1px solid #ddd;
		line-height:40px;
		margin:0 auto;
	}
	#checkPasswordForm li:nth-child(2n){
		width:80%;
	}
	#checkPasswordForm li:last-child{
		width:80%;
		border-bottom:0;
		display:flex;
	}
	.container{
		width:1000px;
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
	
	input[type=button]{
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
	input[type=button]:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
</style>
<script>
	$(function(){
		//유효성검사
		$("#checkPasswordForm").submit(function(){
			
			// 비밀번호
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하셔야 회원정보수정이 가능합니다.");
				return false;
			}
			
		});
	});
</script>
<div class="container"><br/><br/>
	<h1>개인 정보 수정</h1><br/><br/>
	<form method="post" action="checkPasswordOk" id="checkPasswordForm">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${dto.userid}" style="height:40px;" readonly/>
			</li>
			<li>비밀번호</li>
			<li>
				<input type="password" name="userpwd" id="userpwd" placeholder="비밀번호 확인" minlength="8" maxlength="15" style="height:40px;"/>
			</li>
			<li>
				<input type="submit" value="비밀번호 확인" style="height:40px; margin-right:30px"/>
				<input type="button" value="뒤로가기" onClick="history.go(-1)" style="height:40px;"/>
			</li>
		</ul>
	</form>
</div>