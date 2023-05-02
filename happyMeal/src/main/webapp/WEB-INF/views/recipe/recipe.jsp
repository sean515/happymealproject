<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style>

</style>

<style>
.input-box{
  		position:relative;
  		margin:10px 0;
  		display: inline-block;
  		
	}
.input-box > input{
  		background:transparent;
  		border:none;
  		border-bottom: solid 1px #ccc;
  		padding:20px 0px 5px 0px;
  		font-size:14pt;
  		width:40%;
	}
 input::placeholder{
		color:transparent;
	}

/* input.test:placeholder-shown + label{
  		color:#aaa;
  		font-size:14pt;
  		top:15px;
	}

input.test:focus+ label{
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

input.test:focus, input:not(:placeholder-shown){
	  border-bottom: solid 1px #8aa1a1;
	  outline:none;
	} */
	
	input.test[type=submit]{
		background-color: #8aa1a1;
		border:none;
		color:white;
		border-radius: 5px;
		width:100%;
		height:35px;
		font-size: 14pt;
		margin-top:50px;
	}
	
	
		
.form_radio_btn {
			width: 47%;
			height : 45px;
    		border: 1px solid #EAE7E7;
    		border-radius: 10px;
		}
		.form_radio_btn input[type=radio] {
			display: none;
		}
		.form_radio_btn label {
			display: block;
    		border-radius: 10px;
   			margin: 0 auto;
    		text-align: center;
    		height: -webkit-fill-available;
    		line-height: 45px;
		}
		 
		/* Checked */
		.form_radio_btn input[type=radio]:checked + label {
			background: #184DA0;
			color: #fff;
		}
		 
		/* Hover */
		.form_radio_btn label:hover {
			color: #666;
		}
		 
		/* Disabled */
		.form_radio_btn input[type=radio] + label {
			background: #F9FAFC;
			color: #666;
		}
  .input-container {
    position: relative;
    display: inline-block;
    margin-right: 10px;
    margin-bottom: 10px;
    width:18%;
  }
  .input-field {
    padding-right: 32px;
  }

  .add-input-button {
    display: block;
    margin-top: 10px;
  }
  
  .del-container {
    position: relative;
    display: inline-block;
    margin-right: 10px;
    margin-bottom: 10px;
    width:18%;
  }
  .del-field {
    padding-right: 32px;
  }

  .add-del-button {
    display: block;
    margin-top: 10px;
  }

.accordion-button {
    font-size: 15px;
    }

.btn {
    border-radius: 0;
    }

.justify-content-center {
    justify-content: center!important;
}

.page-link {
  color: #8BC34A; 
  background-color: #000;
  border-color: #444;
}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: #8BC34A ;
  border-color: #8BC34A;
 
}

.page-link:focus, .page-link:hover {
  color: #ccc;
  background-color: #222; 
  border-color: #444;
  }
  
.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 7px 15px;
    text-decoration: none;
    color: #8BC34A;
    background-color: #fff;
    border: 0.5px solid #8BC34A;
    margin-left: -1px;
    font-size: 12px;
}

</style>
<script>
	
	
	
	/* 검색어 미입력 상태에서 검색을 진행할 때 발생하는 함수 */
	$(function(){
		$("#searchForm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색에를 입력하세요...");
				return false;
			}
			return true;
		});
	});
	
	$(document).ready(function(){
		  var currentInput = 0; // 현재까지 추가된 input 개수
		  
		  // Add Input 버튼 클릭 시
		  $("#addInputButton").click(function(e){
		    e.preventDefault();
		    currentInput++;
		    
		    // 추가된 input 개수에 따라 input 보이기/숨기기
		    $("#input"+currentInput+"Container").show();
		    
		    // input이 5개 모두 보일 경우 Add Input 버튼 숨기기
		    if (currentInput == 5) {
		      $("#addInputButton").hide();
		    }
		    
		    // input에 버튼 추가하기
		    var inputContainer = $("#input"+currentInput+"Container");
		    var input = inputContainer.find("input");
		    var button = $("<button type='button' class='removeInputButton' data-input='input"+currentInput+"' style='border: antiquewhite; background-color: white;'>x</button>");
		    inputContainer.append(button);
		    button.css({
		      "position": "absolute",
		      "right": "5px",
		      "top": "5px"
		    });
		    input.css("padding-right", "25px"); // input의 오른쪽 padding 값 조정
		  });
		  
		  // Remove Input 버튼 클릭 시
		  $(document).on("click", ".removeInputButton", function(){
		    var inputId = $(this).data("input");
		    $("#"+inputId).val(""); // 해당 input의 값을 지우기
		    $("#"+inputId+"Container").hide(); // 해당 input 숨기기
		    
		    currentInput--; // 현재까지 추가된 input 개수 감소
		    
		    // Add Input 버튼 보이기
		    $("#addInputButton").show();
		  });
		  
		  // input 1 숨기기
		  $("#input1Container").hide();
		});
	
	$(document).ready(function(){
		  var currentDel = 0; // 현재까지 추가된 input 개수
		  
		  // Add Input 버튼 클릭 시
		  $("#addDelButton").click(function(e){
		    e.preventDefault();
		    currentDel++;
		    
		    // 추가된 input 개수에 따라 input 보이기/숨기기
		    $("#del"+currentDel+"Container").show();
		    
		    // input이 5개 모두 보일 경우 Add Input 버튼 숨기기
		    if (currentDel == 5) {
		      $("#addDelButton").hide();
		    }
		    
		    // input에 버튼 추가하기
		    var delContainer = $("#del"+currentDel+"Container");
		    var del = delContainer.find("del");
		    var button = $("<button type='button' class='removeDelButton' data-del='del"+currentDel+"'style='border: antiquewhite; background-color: white;'>x</button>");
		    delContainer.append(button);
		    button.css({
		      "position": "absolute",
		      "right": "5px",
		      "top": "5px"
		    });
		    del.css("padding-right", "25px"); // input의 오른쪽 padding 값 조정
		  });
		  
		  // Remove Input 버튼 클릭 시
		  $(document).on("click", ".removeDelButton", function(){
		    var delId = $(this).data("del");
		    $("#"+delId).val(""); // 해당 input의 값을 지우기
		    $("#"+delId+"Container").hide(); // 해당 input 숨기기
		    
		    currentDel--; // 현재까지 추가된 input 개수 감소
		    
		    // Add Input 버튼 보이기
		    $("#addDelButton").show();
		  });
		  
		  // input 1 숨기기
		  $("#del1Container").hide();
		});
</script>

<!-- 배너 -->
<div class= "banner" style="overflow: hidden;">
	<img src="img/bannerimg2.png" width="100%" height="300px;">
</div>
<div class="container">
	<div style="padding-top: 80px;">
	<!-- 검색 -->
	<div class="searchDiv" style="padding-top:20px; float: right;">
		<form method="get" id="searchForm" action="recipe">
			<input type="text" name="searchWord" id="searchWord" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 200px; height:24.5px; display: inline;"/>
			<input type="submit" value="검색" class="btn-cta" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 70px; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;" />
		</form>
	</div>

	<!-- 소재목 -->
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp레시피&nbsp&nbsp</h1>
	</div>
	<hr style="height: 1px; background: black"/>
	</div>
	<div>
	<!-- userrecipe 버튼 -->
	<div class="searchDiv" style="padding-top:20px; padding-bottom:20px; float: right;">	
			<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a  style="color:white;"href="recipe_user">사용자 레시피</a></div></button>
	</div>
	<!-- 아코디언 추가 -->
			
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			 	개인 맞춤 레시피 찾기
				</button>
				
			
				
			</h2>

			<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
			<form style="padding-bottom: 20px;" method="get" id="partsForm" action="recipe">
			<br/>
			<c:if test="${dto.kal != null and dto.kal !=0.0}">
			<h3>하루 권장 섭취 칼로리: ${dto.kal}</h3>
				
			<div class="mb-3">
				<label for="userSex" class="form-label">식사 시간</label>
				<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
					<div class="form_radio_btn radio_male">
						<input id="radio-1" type="radio" name="time" value=" ${dto.kal * 0.4}">
						<label for="radio-1"> 아침 : ${dto.kal * 0.4} 칼로리 </label>
					</div>
												 
					<div class="form_radio_btn">
						<input id="radio-2" type="radio" name="time" value=" ${dto.kal * 0.3}">
						<label for="radio-2">점심 : ${dto.kal * 0.3} 칼로리</label>
					</div>
					<div class="form_radio_btn">
						<input id="radio-3" type="radio" name="time" value=" ${dto.kal * 0.2}">
						<label for="radio-3">저녁 : ${dto.kal * 0.2} 칼로리</label>
					</div>
					<div class="form_radio_btn">
						<input id="radio-4" type="radio" name="time" value=" ${dto.kal * 0.1}">
						<label for="radio-4">간식 : ${dto.kal * 0.1} 칼로리</label>
					</div>
				</div>
			</div>
			
			</c:if>
			<c:if test="${dto.kal == null or dto.kal == 0.0}">
				bmi를 체크하고 맞춤형 칼로리 정보를 확인해보세요!<br/>
				<a href="/happy/myPage/checkBmi">BMI 계산하러 가기</a><br/> <br/>
				<hr/>
			</c:if>
			<label for="userSex" class="form-label">직접 입력하기</label>
			<br/>
			
			<div class="input-box">
			<input class="test" type="text" id="min_cal" name="min_cal">
				<label for="min_cal">최소 칼로리</label>

			</div>
			<div class="input-box">
			<input type="text" max_cal" name="max_cal" >
				<label for="max_cal">최대 칼로리</label>
			</div>
			<br/>
			<label for="userSex" class="form-label">레시피 재료 추가</label>	
			<br/>
			 <div id="input1Container" class="input-container" style="display:none;">
    			<input type="text" class="form-control input-field" id="input1" name="parts1">
			  </div>
			  <div id="input2Container" class="input-container" style="display:none;">
			    <input type="text" class="form-control input-field" id="input2" name="parts2">
			  </div>
			  <div id="input3Container" class="input-container" style="display:none;">
			    <input type="text" class="form-control input-field" id="input3" name="parts3">
			  </div>
			  <div id="input4Container" class="input-container" style="display:none;">
			    <input type="text" class="form-control input-field" id="input4" name="parts4">
			   </div>
			  <div id="input5Container" class="input-container" style="display:none;">
			    <input type="text" class="form-control input-field" id="input5" name="parts5">
			  </div>
			  <button id="addInputButton" class="add-input-button" style="background-color: #8BC34A; color: white; border: navajowhite;">재료 선택 추가</button>
			  
			  <br/>
		  <label for="userSex" class="form-label">레시피 재료 제외</label>
		  <br/>	
			  <div id="del1Container" class="del-container" style="display:none;">
    			<input type="text" class="form-control del-field" id="del1" name="delparts1">
			  </div>
			  <div id="del2Container" class="del-container" style="display:none;">
			    <input type="text" class="form-control del-field" id="del2" name="delparts2">
			  </div>
			  <div id="del3Container" class="del-container" style="display:none;">
			    <input type="text" class="form-control del-field" id="del3" name="delparts3">
			  </div>
			  <div id="del4Container" class="del-container" style="display:none;">
			    <input type="text" class="form-control del-field" id="del4" name="delparts4">
			   </div>
			  <div id="del5Container" class="del-container" style="display:none;">
			    <input type="text" class="form-control del-field" id="del5" name="delparts5">
			  </div>
			  <button id="addDelButton" class="add-del-button" style="background-color: #8BC34A; color: white; border: navajowhite;">재료 선택 추가</button>
			  <br/>
			  <input type="submit" value="검색" class="btn-cta" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="background-color: #8BC34A; color: white; border: navajowhite;"/>
			</form>

			 </div>
		</div>
	<!-- 게시글 row 상단 -->
	<ul class="recipe" style="overflow: hidden; padding-left: 0;">
		<div id="fh5co-staff">
		<div class="container">
		<div class="row">
		<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
		<c:forEach var="bDTO" items="${list}">	
			<div class="col-md-3 animate-box text-center">
				<div class="staff">
					<div class="staff-img" style="background-image: url('${bDTO.recipe_thumbnail }');">
					</div>
					<h3><a href="recipeView?recipe_no=${bDTO.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.recipe_name }</a></h3>
					<p style="margin-bottom:10px;">${bDTO.recipe_cal } kal </p>	
					<p style="margin-bottom:0px;">탄수화물 ${bDTO.recipe_car }  단백질 ${bDTO.recipe_pro }</p>
					<p style="margin-bottom:0px;">지방 ${bDTO.recipe_fat }  나트륨 ${bDTO.recipe_na }</p>
				</div>
			</div>
		<c:set var="recordNum" value="${recordNum-1 }"></c:set>	
		</c:forEach>
		</div>
		</div>
		</div>
		</ul>
	</div>	
	
	
	<div class="recipeHeader" style="float: right; margin-top: -50px; " >
	<!-- <a href="recipeWrite">글쓰기</a> -->
	<!-- <button type="button" class="btn btn-outline-dark" onclick="location.href='recipeWrite'"
	style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button> -->
	</div>
	</div>
	
	<!-- 페이지네이션 부트스트랩 -->
	<div>
	<center>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  <!-- 이전페이지       : nowPage를 기준으로 -->	
		<c:if test="${vo.nowPage==1}"> <!-- 현재페이지가 첫번쨰 페이지일때 -->
			<li></li>
		</c:if>
		<c:if test="${vo.nowPage>1}"> <!-- 현재페이지가 첫번째 페이지가 아닐때 -->
		    <li class="page-item">
		      <a class="page-link" href="recipe?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
	    </c:if>
	   <!-- 이전페이지 끝 -->
	   <!-- 페이지 번호 -->
	   <c:forEach var="p" begin="${vo.startPageNum}" end="${vo.startPageNum+vo.onePageNumCount-1}">
				<c:if test="${p<=vo.totalPage}"> <!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
				<!-- 현재페이지 표시하기 -->
				<c:if test="${p==vo.nowPage}">
				<li class="page-item active" style="background-color: #8BC34A;">
				</c:if>
				<c:if test="${p!=vo.nowPage}">
				<li class="page-item">
				</c:if>
				<a class="page-link" href="recipe?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
	   
	   	<!-- 다음페이지 -->
	   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
	    <li class="page-item">
	      <a class="page-link" href="recipe?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	    </c:if>
	    <c:if test="${vo.nowPage==vo.totalPage}"><!-- 현재페이지가 마지막일때 -->
			<li></li>
		</c:if>
	  </ul>
	</nav>
	</center>
	</div>
	
  <br>
  </div>