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
		line-height:40px;
	}
	#joinEditForm3 li{
		text-align:right;
	}
	#joinEditForm1 li{
		text-align:left;
		padding:0;
		line-height:30px;
	}
	
	#joinEditForm1 li img{
		margin-right:50px;
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
	
	.container2{
		padding: 50px 0;
    	border-bottom: solid 1px #80808080;
    	border-top: solid 1px #80808080;
	}
	
	.container3{
		padding: 25px 0;
	}
	
	#my_header{
		padding-bottom: 20px;
    	border-bottom: solid 1px #80808080;
	}
	
	#bottomline{
		border-bottom: solid 1px #80808080;
    	padding-bottom: 25px;
    	margin-right: 10px;
    	margin-left: 10px;
	}
	
</style>

<script>
	
</script>

<div class="container"><br/><br/>
	<h2>마이페이지</h2><br/><br/><br/>

	<h3>개인정보</h3>
<div class="container2">
  <div class="row">
    <div class="col">
		<form method="post" id="joinEditForm1">
			<ul>
			<li><img src="img/user_icon.png" width="200" height="200" align="left"/></li>
			<li>${dto.username}님</li>
			<li>닉네임: ${dto.nickname}</li>
			<li>성별: ${dto.gender}</li>
			<li>생년월일: ${dto.age}</li>
			<li>이메일: ${dto.email}</li>
			<li>질병: ${dto.disease}</li>
			<li><a href="/happy/myPage/checkPassword" >개인정보 수정</a></li>
			
			</ul>
		</form>
		</div>

    <div class="col">
			<ul style="line-height:30px;">
				<c:if test="${dto.bmi ne 0.0}">
					<li>BMI: ${dto.bmi}</li>
					<li>비만도: ${dto.standardBmi}</li>
					<li>하루 권장 섭취 칼로리: ${dto.kal} kcal</li>
				<c:if test="${dto.standardBmi eq '저체중'}">
					<li>
						식이요법: 칼로리 섭취량을 늘리는 것이 중요합니다. 하루 섭취 칼로리는 체질에 맞게 적정량을 늘려줘야 합니다.<br/>
						관리법: 규칙적인 식사와 수면을 유지하고, 근육운동을 통해 체중을 늘려주는 것이 좋습니다.
					</li>
				</c:if>
				<c:if test="${dto.standardBmi eq '정상체중'}">
					<li> 
					식이요법: 균형잡힌 식단을 유지하면서 적정한 칼로리를 섭취하는 것이 중요합니다.<br/>
					관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 특히 유산소 운동을 하여 건강한 체중을 유지하는 것이 좋습니다.
					</li>
				</c:if>
				<c:if test="${dto.standardBmi eq '과체중'}">
					<li> 
						식이요법: 하루 권장 칼로리를 지키면서 식사량을 조절하는 것이 중요합니다. 단, 갑작스런 급감식은 건강에 해로울 수 있으므로 천천히 조절해야 합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 유산소 운동을 더 많이 하여 체중을 조절하는 것이 좋습니다.
					</li>
				</c:if>
				<c:if test="${dto.standardBmi eq '경도비만'}">
					<li>
						식이요법: 하루 권장 칼로리보다 적게 섭취하고, 탄수화물과 지방 섭취량을 줄이는 것이 중요합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다.
					</li>
				</c:if>
				
				<c:if test="${dto.standardBmi eq '중등도비만'}">
					<li>
						식이요법: 하루 권장 칼로리보다 적게 섭취하고, 탄수화물과 지방 섭취량을 더욱 줄이는 것이 중요합니다. 단, 단백질 섭취는 충분히 해야합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다. 건강한 체중 감량을 위해 전문의의 도움도 받을 수 있습니다.
					</li>
				</c:if>
				
				<c:if test="${dto.standardBmi eq '고도비만'}">
					<li>
						식이요법: 하루 권장 칼로리보다 적게 섭취하고, 건강한 식습관으로 바꾸는 것이 중요합니다. 단, 영양소 섭취에 유의해야 합니다.<br/>
						관리법: 규칙적인 식습관과 운동 습관을 유지하면서, 근력운동과 유산소 운동을 조합하여 체중감량을 유도하는 것이 좋습니다. 전문의의 도움을 받아 건강한 체중 감량을 위해 진행해야 합니다.
					</li>
				</c:if>
					<li><a href="/happy/myPage/checkBmi">BMI 수정하기</a></li>
				</c:if>
				<c:if test="${dto.bmi eq 0.0}">
					<li><a href="/happy/myPage/checkBmi">BMI 계산하러 가기</a></li>
				</c:if>
			</ul>
	</div>
	</div>
    </div>

	
	

	<br/><br/><h3>즐겨찾기</h3>
	<div class="container2">
	<form method="post" id="joinEditForm">
		<ul>
			<li>
				<a href="/happy/resView?res_no=${rs_dto.res_no}"><img src="${rs_dto.res_image}" width="200" height="170" align="left"/></a>
				
				<div class="fr hbox">
					<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="40" height="40" align="right"></button><br/>
				</div>
				
				&emsp;&emsp;&emsp;
				식당 이름 : ${rs_dto.res_name}<br/>&emsp;&emsp;&emsp;
				주소 : ${rs_dto.res_addr}<br/>&emsp;&emsp;&emsp;
				전화 번호 : ${rs_dto.res_tel}<br/>&emsp;&emsp;&emsp;
				음식 타입 : ${rs_dto.res_type}
				<div style="text-align:right"><a href="/happy/myPage/userLikeRes">식당 즐겨찾기 더보기</a><hr class="hr2"/></div>
				
				<div style="">
				<a href="/happy/menuView_user?menu_no=${m_ldto.menu_no}"><img src="/happy/uploadfile/${m_ldto.menu_thumbnail}" width="200" height="170" align="left"/></a>
				
				<div class="fr hbox">
					<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="40" height="40" align="right"></button><br/>
				</div>
				
				&emsp;&emsp;&emsp;
				식단명 : ${m_ldto.menu_title}<br/>&emsp;&emsp;&emsp;
				작성일 :${m_ldto.menu_date}<br/>&emsp;&emsp;&emsp;
				작성자 : ${m_ldto.userid}&emsp;&emsp;&emsp;
				<div style="text-align:right"><a href="/happy/myPage/userLikeMenu">식단 즐겨찾기 더보기</a><hr class="hr2"/></div>
				</div>
				
				<a href="/happy/recipeView?recipe_no=${r_ldto.recipe_no}""><img src="${r_ldto.recipe_thumbnail}" width="200" height="170" align="left"/></a>
				
				<div class="fr hbox">
					<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="40" height="40" align="right"></button><br/>
				</div>
				
				&emsp;&emsp;&emsp;
				레시피 : ${r_ldto.recipe_name}<br/>&emsp;&emsp;&emsp;
				작성일 : ${r_ldto.recipe_date}<br/>&emsp;&emsp;&emsp;
				작성자 : ${r_ldto.userid}
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

<div class="container3">

  <div class="row">
  
    <div class="col" id="bottomline" style="width: 45% display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">
    	<p id="my_header">내가 작성한 글<br/></p>
    	
    	<div style="display: inline-block; overflow:hidden; white-space:nowrap;text-overflow:ellipsis;">
		<div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:70px;" >
			<h5>커뮤니티</h5> 
		</div>
		<div  style="display: inline-block; text-align: center;">
			<a style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis; width:90%;" href="commView?comm_no=${cdto.comm_no }">${cdto.comm_title }</a>
		</div>
		</div>
		 
		   <hr class="hr3"/>
		<div style="display: inline-block; overflow:hidden; white-space:nowrap;text-overflow:ellipsis;">
		<div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:70px;" >
			<h5>식단</h5> 
		</div>
		<div  style="display: inline-block; text-align: center;">
		   <a style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;" href="menuView_user?menu_no=${mdto.menu_no }">${mdto.menu_title }</a>
		</div>
		</div>   
		   <hr class="hr3"/>
		<div style="display: inline-block; overflow:hidden; white-space:nowrap;text-overflow:ellipsis;">
		<div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:70px;" >
			<h5>레시피</h5> 
		</div>
		<div  style="display: inline-block; text-align: center;">
		   <a style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;" href="recipeView_user?recipe_no=${rdto.recipe_no }">${rdto.recipe_name }</a>
		</div>
		</div>   
		   <hr class="hr3"/>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userWrite">내가 작성한 글 더보기</a></div>
			</li>
		</ul>
	</div>
	
	<div class="col" id="bottomline" style="width: 45% display: block; white-space:nowrap; overflow: hidden;" >
	
		<p id="my_header">내가 작성한 댓글<br/></p>
		
<div style="display: inline-block; overflow:hidden; white-space:nowrap; vertical-align: top; width:90%;">
  <div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:70px;">
    <h5>커뮤니티</h5> 
  </div>
  <div style="display: inline-block; vertical-align: top;">
    <a style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;" href="commView?comm_no=${co_codto.comm_no }">${co_codto.comm_title }</a>
    <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">${co_codto.comm_comment_text }</span>
  </div>
</div>
 <hr class="hr3"/>
<div style="display: inline-block; overflow:hidden; white-space:nowrap;text-overflow:ellipsis; vertical-align: top;">
  <div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:70px;">
    <h5>식단</h5> 
  </div>
  <div style="display: inline-block; vertical-align: top;">
    <a style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;" href="menuView_user?menu_no=${me_medto.menu_no }">${me_medto.menu_title }</a>
    <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">${me_medto.menu_comment_text }</span>
  </div>
</div>	
 <hr class="hr3"/>
<div style="display: inline-block; overflow:hidden; white-space:nowrap;text-overflow:ellipsis; vertical-align: top;">
  <div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:70px;">
    <h5>레시피</h5> 
  </div>
  <div style="display: inline-block; vertical-align: top;">
    <a style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;" href="recipeView_user?recipe_no=${re_redto.recipe_no }">${re_redto.recipe_name }</a>
    <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">${re_redto.recipe_comment_text }</span>
  </div>
</div>	
 <hr class="hr3"/>

		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userWriteReply">내가 작성한 댓글 더보기</a></div>
			</li>
		</ul>
	</div>
</div>
</div>
<!-- --------------------------------------------------------------------------------------- -->
<div class="container3" style="padding-top:0px;">
  <div class="row">
    <div class="col" id="bottomline">
		<p id="my_header">식당 업데이트 요청<br/></p>
		<div style="display: inline-block; overflow:hidden; white-space:nowrap; vertical-align: top; width:90%;">
		  <div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:35px; height: 70px;">
		    <h5>추가</h5> 
		  </div>
		  <div style="display: inline-block; vertical-align: top;">
		   <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;"> ${add_dto.res_addr }</span>
		   <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">${add_dto.res_name }</span>
		   <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">
		    <c:if test="${add_dto.res_status==4}">
		       심사중
		    </c:if>
			<c:if test="${add_dto.res_status==2}">
			   승인
			</c:if>
			<c:if test="${add_dto.res_status==3}">
			   반려
			</c:if>
		   </span>
		  </div>
		</div>
 <hr class="hr3"/>
 		<div style="display: inline-block; overflow:hidden; white-space:nowrap; vertical-align: top; width:90%;">
		  <div style="display: inline-block; margin-right: 5px; border-right: 2px solid black; width:35px; height: 70px;">
		    <h5>수정</h5> 
		  </div>
		  <div style="display: inline-block; vertical-align: top;">
		   <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;"> ${ed_dto.res_addr }</span>
		   <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">${ed_dto.res_name }</span>
		   <span style="display: block; white-space:nowrap; overflow: hidden; text-overflow: ellipsis;">
		    <c:if test="${add_dto.res_status==4}">
		       심사중
		    </c:if>
			<c:if test="${add_dto.res_status==2}">
			   승인
			</c:if>
			<c:if test="${add_dto.res_status==3}">
			   반려
			</c:if>
		   </span>
		  </div>
		</div>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userResUpdate">내가 요청한 식당 더보기</a></div>
			</li>
		</ul>
	</div>
	<div class="col" id="bottomline">
		<p id="my_header">문의사항<br/></p>
		<p>
		   커뮤니티 | &nbsp;<a href="sup/supView?sup_no=${sdto.sup_no}">${sdto.sup_title}</a>
		   <hr class="hr3"/>
		   레시피&emsp; | &nbsp;이 정보 확실한가요?
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:0 auto; margin-right: 0.1em;"><a href="/happy/myPage/userSupView">내가 문의한 내용 더보기</a></div>
			</li>
		</ul>
	</div>
</div>
</div>
</div>
