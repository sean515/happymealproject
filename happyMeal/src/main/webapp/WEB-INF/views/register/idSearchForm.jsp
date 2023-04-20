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

	.btn-open-popup{
		background-color: #8aa1a1;
		border:none;
		color:white;
		border-radius: 5px;
		width:100%;
		height:35px;
		font-size: 14pt;
		margin-top:80px;
	}
	.modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal.show {
        display: block;
    }

    .modal_body {
        position: absolute;
        top: 35%;
        left: 50%;

        width: 400px;
        height: 250px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
    }
	
	
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
			
			var url = 'idSearch';
			var params = $("#idSearch").serialize();
			
			$.ajax({
				url : url,
				data : params,
				type : 'POST',
				success:function(result){
					if(result=='N'){
						$('#id_value').text("존재하지 않는 정보입니다.");
						$('#username').val('');
						$('#email').val('');
					}else{
						$('#id_value').text(result);
						$('#username').val('');
						$('#email').val('');
					}
				},error:function(){
					alert("error!!!");
					console.log(e.responseText);	
				}
			});
		});
	});
	
</script>
<div class="container">
	
	<div class="idSearchdiv">
	
		<form method="post" id="idSearch">
			<div id="idSearchHeader">
				<h2>아이디 찾기</h2>
			</div>
			
			<div class="input-box">
	        	<input type="text" name="username" id="username" placeholder="이름"/>
	            <label for="username">이름</label>
	        </div>
		        
	        <div class="input-box">
	            <input type="text" name="email" id="email" placeholder="이메일"/>
	            <label for="email">이메일</label>
	        </div>

			<div class="modal">
		    	<div class="modal-content modal_body">
				    <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">아이디 찾기</h1>
				        <button type="button" class="btn-close closeModal" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
				    <div class="modal-body" id="id_value">
				    	
				    </div>
				    <div class="modal-footer">
				        <button type="button" class="btn btn-primary" onclick="location.href='loginForm'">로그인</button>
				    </div>
				</div>
		    </div>
			<button class="btn-open-popup">아이디찾기</button>
			        
		</form>
	</div>
</div>
<script>
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const closeModal = document.querySelector('.closeModal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
        
    	if($("#username").val()!="" && $("#email").val()!=""){
	    	modal.classList.toggle('show');
    	}

        if (modal.classList.contains('show')) {
    		body.style.overflow = 'hidden';
        }
    });

    modal.addEventListener('click', (event) => {
        if (event.target === modal) {
        	modal.classList.toggle('show');

        	if (!modal.classList.contains('show')) {
            	body.style.overflow = 'auto';
        	}
    	}
    });
    
    closeModal.addEventListener('click', (event) => {
        if (event.target === modal || event.target === closeModal) {
        	modal.classList.toggle('show');

        	if (!modal.classList.contains('show')) {
            	body.style.overflow = 'auto';
        	}
    	}
    });
    
</script>
