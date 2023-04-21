<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#joinEditForm ul{
		overflow:auto;
	}
	#joinEditForm1 ul{
		overflow:auto;
	}
	#joinEditForm li{
		text-align:left;
		float:left;
		width:20%;
		padding:10px 0;
		display:block;
		border-bottom:2px solid #ddd;
		line-height:40px;
	}
	#joinEditForm3 li{
		text-align:right;
	}
	#joinEditForm1 li{
		text-align:left;
		display:flex;
		padding:0;
		line-height:30px;
	}
	#joinEditForm2 li{
		text-align:right;
		border-bottom:2px solid #ddd;
	}
	#joinEditForm li:nth-child(2n){
		width:80%;
	}
	#joinEditForm li:last-child{
		width:100%;
	}
	#addr{width:80%;}
	.container{
	}
	.hr1{
		border:0;
		height:2px;
		background:black;
		width:100%;
	}
	.hr2{
		width:100%;
		border:0;
		height:2px;
		background:#ddd;
	}
	.hr3{
		border:0;
		height:1.2px;
		background:#ddd;
	}
	.hr4{
		border:0;
		height:1.6px;
		background:black;
	}
	.hr5{
		border:0;
		margin:0;
		height:2px;
		background:black;
		width:100%;
	}
	h1 { font-size:20px; float:center; margin:0 auto; }
	.clear:after {content:""; display:block; clear:both; margin:100px 100px 0px 0px;}
	.fr { float:right; }
	.fl { float:left; }
	.ft { float:right;}
	.box { padding:10px; width:1000px; margin:0 auto; }
	.fbox{ width:440px; height:300px; border:1px solid white; margin:0 0;}
	.hbox{ width:50px; height:50px; border:1px solid white; margin:0 auto;}
	.tbox{ width:100px; height:30px; border:1px solid white; margin:185px 0 0 380px; }
	
	.il_box { padding:20px; font-size:1; }
	.il_box > div { display:inline-block; width:33.333%; margin:0 auto; }
	.il_box > div > p { height:200px; border:1px solid #bbb; margin:0 auto; }
	
</style>

<script>
	
</script>

<div class="container"><br/><br/>
	<h2>마이페이지</h2><br/><br/><br/>

	<h3>개인정보</h3><hr class="hr1"/>
	<form method="post" id="joinEditForm1">
		<ul>
			<li>
				<img src="img/user_icon.png" width="200" height="200" align="left"/>&emsp;&emsp;&emsp;
				${dto.username}님<br/><br/>&emsp;&emsp;&emsp;
				닉네임: ${dto.nickname}<br/>&emsp;&emsp;&emsp;
				성별: ${dto.gender}<br/>&emsp;&emsp;&emsp;
				생년월일: ${dto.age}<br/>&emsp;&emsp;&emsp;
				이메일: ${dto.email}<br/>&emsp;&emsp;&emsp;
				질병: ${dto.disease}<br/><br/>&emsp;&emsp;&emsp;
				<div class="ft tbox">
					<a href="/happy/myPage/checkBmi">BMI 계산하러 가기</a>
					<a href="/happy/myPage/checkPassword" >개인정보 수정</a><br/><br/>
				</div>
			</li>
			<li><hr class="hr5"/></li>
		</ul>
	</form>
</div>

<div class="container">
	<br/><br/><h3>즐겨찾기</h3><hr class="hr1">
	<form method="post" id="joinEditForm">
		<ul>
			<li>
				<img src="img/restaurant_sample.jpg" width="200" height="200" align="left"/>
				
				<div class="fr hbox">
					<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="40" height="40" align="right"></button><br/>
				</div>
				
				&emsp;&emsp;&emsp;
				식당 이름 : 행복 샐러드<br/>&emsp;&emsp;&emsp;
				식당 위치 : 서울특별시 강남구 OO로<br/>&emsp;&emsp;&emsp;
				대표 메뉴 : 단호박 샐러드<br/>&emsp;&emsp;&emsp;
				운영 시간 : 11:00~21:00<br/>
				<div style="text-align:right"><a href="/happy/myPage/userLikeRes">식당 즐겨찾기 더보기</a><hr class="hr2"/></div>
				
				
				<img src="img/menu_sample.jpg" width="200" height="200" align="left"/>
				
				<div class="fr hbox">
					<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="40" height="40" align="right"></button><br/>
				</div>
				
				&emsp;&emsp;&emsp;
				식단 이름 : 겨울 당뇨 식단<br/>&emsp;&emsp;&emsp;
				아침 식단 : 흑미밥, 채접 맑은국, 꽈리고추찜 등<br/>&emsp;&emsp;&emsp;
				점심 식단 : 현미밥, 소고기 샤브샤브, 박고지 묵은 김치 만두 등<br/>&emsp;&emsp;&emsp;
				저녁 식단 : 수수밥, 비지찌개, 갈치구이 등<br/>
				<div style="text-align:right"><a href="/happy/myPage/userLikeMenu">식단 즐겨찾기 더보기</a><hr class="hr2"/></div>
				
				
				<img src="img/recipe_sample.jpg" width="200" height="200" align="left"/>
				
				<div class="fr hbox">
					<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="40" height="40" align="right"></button><br/>
				</div>
				
				&emsp;&emsp;&emsp;
				레시피 이름 : 칼륨 듬뿍 고구마죽<br/>&emsp;&emsp;&emsp;
				조리방법 : 끓이기<br/>&emsp;&emsp;&emsp;
				요리 종류 : 후식<br/>&emsp;&emsp;&emsp;
				열량 : 205cal<br/>
				<div style="text-align:right"><a href="/happy/myPage/userLikeRecipe">레시피 즐겨찾기 더보기</a></div>
			</li>
		</ul>
	</form>
</div>

<!-- 
<div class="container">
	<h3>모아보기</h3><hr class="hr1"> 
</div>
-->

<div class="clear box">
	<br/><br/>
	<div class="fl fbox" >
		<p>내가 작성한 글<hr class="hr1"/><br/>
		   커뮤니티 | &nbsp;<a href="commView?comm_no=${cdto.comm_no }">${cdto.comm_title }</a></li>
		   <hr class="hr3"/>
		   식단&emsp;&ensp;&nbsp; | &nbsp;봄 당뇨 식단
		   <hr class="hr3"/>
		   레시피&ensp;&nbsp; | &nbsp;<a href="recipeView?recipe_no=${rdto.recipe_no }">${rdto.recipe_name }</a>
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userWrite">내가 작성한 글 더보기</a><hr class="hr4"/></div>
			</li>
		</ul>
	</div>
	<div class="fr fbox">
		<p>내가 작성한 댓글<hr class="hr1"/><br/>
		   커뮤니티 | &nbsp;<a href="commView?comm_no=${co_codto.comm_no }">${co_codto.comm_title }</a>
		   &emsp;&emsp;&ensp;&nbsp; | &nbsp;${co_codto.comm_comment_text }
		   <hr class="hr3"/>
		   식단&emsp;&ensp;&nbsp; | &nbsp;고혈압 환자도 먹어도 되나요?<hr class="hr3"/>
		   레시피&emsp; | &nbsp;오늘은 이거 먹어야겠어요.
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userWriteReply">내가 작성한 댓글 더보기</a><hr class="hr4"/></div>
			</li>
		</ul>
	</div>
</div>
<!-- --------------------------------------------------------------------------------------- -->
<div class="clear box">
	<div class="fl fbox" >
		<p>식당 업데이트 요청<hr class="hr1"/><br/>
		   추가 | &nbsp;서울 관악구 | &nbsp;할랄푸드 전문점<hr class="hr3"/>
		   수정 | &nbsp;서울 강남구 | &nbsp;샐러드 전문점
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userResUpdate">내가 요청한 식당 더보기</a><hr class="hr4"/></div>
			</li>
		</ul>
	</div>
	<div class="fr fbox">
		<p>문의사항<hr class="hr1"/><br/>
		   커뮤니티 | &nbsp;<a href="sup/supView?sup_no=${sdto.sup_no}">${sdto.sup_title}</a>
		   <hr class="hr3"/>
		   레시피&emsp; | &nbsp;이 정보 확실한가요?
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userSupView">내가 문의한 내용 더보기</a><hr class="hr4"/></div>
			</li>
		</ul>
	</div>
</div>