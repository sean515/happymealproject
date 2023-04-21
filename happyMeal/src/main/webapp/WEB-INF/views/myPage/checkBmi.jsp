<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
	.bmidiv{
		width:30%;
		margin: 100px auto 62px;
		
	}
	#bmiHeader{
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
    $("#bmicheck").submit(function(){
        event.preventDefault();
        
        if($("#userheight").val()==""){
            alert("키를 입력하세요...");
            return false;
        }
        if($("#userweight").val()==""){
            alert("몸무게를 입력하세요..");
            return false;
        }
        
        
        var url = 'bmicheck';
        var height=$("#userheight").val()
        var weight=$("#userweight").val()

        
        
        $.ajax({
            url: url,
            data:{"height":height, "weight":weight},
            type: 'POST',
            success: function(result){
                if(result=='N'){
                    alert("존재하지 않는 정보입니다.");
                }else{
                    alert("계산된 BMI 값: " + result);
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert("Error: " + errorThrown);
            }
        });
    });
});
	
</script>
<div class="container">
	
	<div class="bmidiv">
	
		<form method="post" id="bmicheck">
			<div id="bmiHeader">
				<h2>BMI 계산기</h2>
			</div>
			
			<div class="input-box">
	        	<input type="text" name="userheight" id="userheight" placeholder="키"/>
	            <label for="userheight">키</label>
	        </div>
		        
	        <div class="input-box">
	            <input type="text" name="userweight" id="userweight" placeholder="몸무게"/>
	            <label for="userweight">몸무게</label>
	        </div>

			<div class="modal">
		    	<div class="modal-content modal_body">
				    <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">BMI 계산하기</h1>
				        <button type="button" class="btn-close closeModal" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
				    <div class="modal-body" id="bmi_value">
				    	
				    </div>
				    <div class="modal-footer">
				        <button type="button" class="btn btn-primary" onclick="location.href=''">BMI 계산하기</button>
				    </div>
				</div>
		    </div>
			<button class="btn-open-popup">BMI 계산하기</button>
			        
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
