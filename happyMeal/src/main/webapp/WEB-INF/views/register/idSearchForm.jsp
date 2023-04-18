<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.idSearchdiv{
		width:30%;
		margin: 100px auto 62px;
		
	}
	#idSearchHeader{
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

	/* #searchGo{
		text-align: center;
		font-size:12pt;
		color:rgb(164, 164, 164);
		margin:10px 0px;
		
	} */
</style>
<script>
	$(function(){
		$("#idSearch").submit(function(){
			event.preventDefault();
			
			if($("#username").val()==""){
				alert("이름을 입력하세요...");
				return false;
			}
			if($("#email").val()==""){
				alert("이메일을 입력하세요..");
				return false;
			}
			
			/* var username = $("#username").val();
			var email = $("#email").val();
			
			$.ajax({
				url : "./idSearch",
				type : 'POST',
				data : {"username":username, "email":email},
				success:function(data){
					if(data==null){
						$('#id_value').text("존재하지 않는 정보입니다.");
						$('#username').val('');
						$('#email').val('');
					}else{
						$('#id_value').text(data);
						$('#username').val('');
						$('#email').val('');
					}
				},error:function(){
					alert("error!!!");
					console.log(e.responseText);	
				}
			}); */
		});
	});
	
	const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})
</script>
<div class="container">
	
	<div class="idSearchdiv">
		<div id="idSearchHeader">
			<h2>아이디 찾기</h2>
		</div>
	
		<form method="post" id="idsearch">
			
			<div class="input-box">
	        	<input type="text" name="username" id="username" placeholder="아이디"/>
	            <label for="username">이름</label>
	        </div>
		        
	        <div class="input-box">
	            <input type="text" name="email" id="email" placeholder="이메일"/>
	            <label for="email">이메일</label>
	        </div>
		        
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  아이디 찾기
			</button>
		        
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">아이디 조회 결과</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="content" id="id_value"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="location.href='loginForm'">로그인</button>
      </div>
    </div>
  </div>
</div>
