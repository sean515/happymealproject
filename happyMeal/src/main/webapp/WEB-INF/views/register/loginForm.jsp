<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.logindiv{
		width:40%;
		margin: 100px auto 62px;
		
	}
	#logHeader{
    	display:flex;
        justify-content: center;
    }
    form{
		padding:10px;
	}
	.input-box{
  		position:relative;
  		margin:10px 0;
	}
	.input-box > input{
  		background:transparent;
  		border:none;
  		border-bottom: solid 1px #ccc;
  		padding:20px 0px 5px 0px;
  		font-size:14pt;
  		width:100%;
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
		height:35px;
		font-size: 14pt;
		margin-top:100px;
	}
	#joinGo{
		text-align: center;
		font-size:12pt;
		color:rgb(164, 164, 164);
		margin:10px 0px;
		
	}
</style>
<div class="container">
	<div class="logindiv">
		<div id="logHeader">
			<h2>Login</h2>
		</div>
	
		<form method="post" action="loginOk" id="logFrm">
		
			<div class="input-box">
	            <input type="text" name="userid" id="userid" placeholder="아이디">
	            <label for="username">아이디</label>
	        </div>
	        
	        <div class="input-box">
	            <input type="password" name="userpwd" id="userpwd" placeholder="비밀번호">
	            <label for="password">비밀번호</label>
	        </div>
	        
			<div id="joinGo">
				<a href="join">회원가입</a>
				<a href="idSearchForm">아이디찾기</a>
				<a href="">비밀번호찾기</a>
			</div>
	        <input type="submit" value="LOGIN">
	        
		</form>
	</div>
</div>