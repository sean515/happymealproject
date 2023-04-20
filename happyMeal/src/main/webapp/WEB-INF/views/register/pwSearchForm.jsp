<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.pwSearchdiv{
		width:30%;
		margin: 100px auto 62px;
		
	}
	#pwSearchHeader{
    	display:flex;
        justify-content: center;
    }
    form{
		padding:10px;
		min-width:330px
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
	
</style>
<script>
	$(function(){
		$("#pwSearch").submit(function(){
			event.preventDefault();
			
			if($("#userid").val()==""){
				alert("이름을 입력하세요...");
				return false;
			}
			if($("#email").val()==""){
				alert("이메일을 입력하세요..");
				return false;
			}
			
			var url = 'pwSearchEmailSend';
			var params = $("#pwSearch").serialize();
			
			$.ajax({
				url : url,
				data : params,
				type : 'POST',
				success:function(result){
					if(result=='Y'){
						alert("이메일로 임시비밀번호를 전송하였습니다.");
						location.href="/happy/loginForm";
					}else{
						alert("존재하지 않는 정보입니다.");
					}
				},error:function(){
					console.log(e.responseText);	
				}
			});
		});
	});
	
</script>
<div class="container">
	
	<div class="pwSearchdiv">
	
		<form method="post" id="pwSearch">
			<div id="pwSearchHeader">
				<h2>비밀번호 찾기</h2>
			</div>
			
			<div class="input-box">
	        	<input type="text" name="userid" id="userid" placeholder="아이디"/>
	            <label for="username">아이디</label>
	        </div>
		        
	        <div class="input-box">
	            <input type="text" name="email" id="email" placeholder="이메일"/>
	            <label for="email">이메일</label>
	        </div>

			<input type="submit" value="비밀번호찾기"/>
			        
		</form>
	</div>
</div>
