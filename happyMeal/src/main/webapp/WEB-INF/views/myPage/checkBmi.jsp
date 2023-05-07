<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
	.bmidiv{
		width:30%;
		margin: 50px auto 62px;
		
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
	
	.input-box > input:focus + label,.input-box > label{
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
        height: 300px;

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
        if(!$("input[name='exercise']:checked").val()) {
            alert('운동량을 선택해주세요.');
            return false;
        }
        
        
        var url = 'bmicheck';
        var height=$("#userheight").val();
        var weight=$("#userweight").val();
        var exercise = $('input[name="exercise"]:checked').val();

        
        
        $.ajax({
            url: url,
            data:{"height":height, "weight":weight, "exercise": exercise},
            type: 'POST',
            dataType: 'json',
            success: function(result){
                if(result.error){
                    alert("존재하지 않는 정보입니다.");
                    console.log(result.error);
                } else {
                    var data = result;
                    $("#bmi_value").html(data.username+"님의 BMI지수는 "+data.bmi+" 으로 <br>"+data.standardBmi+" 입니다.<br>하루 권장 섭취 칼로리는 "+data.kal+" 입니다.");
                    console.log("BMI: "+data.bmi);
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

	<h2 style= " display:flex; justify-content: center; margin-top: 100px;">BMI의 중요성</h2>
	<p>
	<br/>
	BMI는 비만도를 나타내는 지표로 비만도가 높을수록 당뇨, 고혈압, 심장병, 중풍 등 다양한 질병과 문제를 유발할 가능성이 높아지기 때문에 BMI를 체크하고 적절한 비만 관리와 생활습관 개선이 매우 중요합니다.

	<br/>또한 당뇨, 고혈압, 심장병, 중풍은 심장 질환, 뇌졸중, 신장 질환 등 매우 심각한 합병증을 유발할 수 있습니다.

	<br/>이처럼 BMI가 각종 질병과 건강에 끼치는 영향은 매우 크기 때문에, 건강을 유지하기 위해서는 적절한 체중 관리와 생활습관 개선이 필요합니다.
	</p>
	
	<div class="bmidiv">
	
		<form method="post" id="bmicheck">
			<div id="bmiHeader">
				<h2>BMI 계산기</h2>
			</div>
			
			<div class="input-box">
	        	<input type="text" name="userheight" id="userheight" placeholder="키"/>
	            <label id="userheightlabel"for="userheight">키</label>
	        </div>
		        
	        <div class="input-box">
	            <input type="text" name="userweight" id="userweight" placeholder="몸무게"/>
	            <label id="userweightlabel" for="userweight">몸무게</label>
	        </div>
	        
	        <div class="form-check form">
			  <input class="form-check-input" type="radio" name="exercise" id="exercise1" value=1.2>
			  <label class="form-check-label" for="exercise1">거의 운동하지 않음</label>
			</div>
			<div class="form-check form">
			  <input class="form-check-input" type="radio" name="exercise" id="exercise2" value=1.375>
			  <label class="form-check-label" for="exercise2">가벼운 운동(주 1~3일)</label>
			</div>
			<div class="form-check form">
			  <input class="form-check-input" type="radio" name="exercise" id="exercise3" value=1.55>
			  <label class="form-check-label" for="exercise3">보통(주 3~5일)</label>
			</div>	
			<div class="form-check form">
			  <input class="form-check-input" type="radio" name="exercise" id="exercise4" value=1.725>
			  <label class="form-check-label" for="exercise4">적극적으로 운동(주 6~7일)</label>
			</div>	
			<div class="form-check form">
			  <input class="form-check-input" type="radio" name="exercise" id="exercise5" value=1.9>
			  <label class="form-check-label" for="exercise5">매우 적극적으로 운동(매일)</label>
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
				        <button type="button" class="btn btn-primary" onclick="location.href='/happy/myPage'">확인</button>
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
