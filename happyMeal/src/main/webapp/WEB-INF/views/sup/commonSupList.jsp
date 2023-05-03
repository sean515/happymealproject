<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
	<!-- 배너 -->
	<div class= "banner" style="overflow: hidden;">
		<img src="../img/bannerimg2.png" width="100%" height="300px;">
	</div>
	<div class="container">
	<!-- 소재목 -->
	<div style="padding-top: 80px;">
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp자주하는 질문&nbsp&nbsp</h1>
	</div>
	<hr style="height: 1px; background: black"/>
	<div>
	<!-- 질문게시판 버튼 -->
	<div class="searchDiv" style="padding-top:20px; padding-bottom:20px; float: right;">	
			<button type="button" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: auto; height:30px; display: inline-block; background-color: #8BC34A; color: white; border: 0px;"><div class="board_header"><a  style="color:white;" href="supList">질문게시판</a></div></button>
	</div>
	</div>
  <!-- 질문리스트 -->
  
  <!-- 질문 1 -->
  <div style="padding:80px 0;"id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
         Q1. 선호 식단은 어디에 사용되나요?
        </a>
      </div>
      <div id="collapseOne" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
       A1. 회원 가입이나 개인정보 수정에서 선호 식단을 선택하시면 관련 식단을 추천해드리고 있습니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 2 -->
    <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
        Q2. 식당 추가는 어떻게 하나요?
      </a>
      </div>
      <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		A2. 추가하고 싶은 식당이 있으시면 식당 업데이트 폼을 작성하시면 됩니다. 관리자의 승인 후 업데이트 됩니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 3 -->
    <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseThree">
          Q3. BMI는 어떻게 활용되나요?
        </a>
      </div>
      <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		 A3. BMI를 기반으로 하루 권장 섭취 칼로리가 계산됩니다. 권장 칼로리는 레시피 -> 개인 맞춤 레시피 찾기에서 레시피 칼로리를 필터링할때 활용됩니다. 
        </div>
      </div>
    </div>
    
    <!-- 질문 4 -->
     <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseFour">
          Q4. 인기레시피는 어떤 기준으로 선정되나요?
        </a>
      </div>
      <div id="collapseFour" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		 A4. 인기레시피는 즐겨찾기, 조회수, 해시태그로 선정 됩니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 5 -->
     <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseFive">
          Q5. 신고 절차가 어떻게 되나요?
        </a>
      </div>
      <div id="collapseFive" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		 A5. 사용자 : 게시글 신고 클릭 -> 신고 요청 폼 작성 -> 신고 
      	관리자 : 신고요청 처리 (승인, 반려) -> 승인될 경우 원글 작성자에게 메일 발송<br/>
      	* 진행 상황은 마이페이지 -> 신고내역에서 확인하실 수 있습니다.
        </div>
      </div>
    </div>
    
  </div>
</div>
	
</div>