<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	
	<style>
	#fh5co-hero .flexslider .slider-text > .slider-text-inner h5 a {
	    font-size: 20px;
	    color: #8BC34A;
	    font-weight: 600;
	    padding: 10px;
	    border: 3px solid #8BC34A;
	    border-radius: 50px;
    }
	</style>
	
	<aside id="fh5co-hero">
		<div class="flexslider">
			<ul class="slides">
		   	<li style="background-image: url(${pageContext.request.contextPath}/resources/images/mainimg.PNG);">
		   		<div class="overlay-gradient"></div>
		   		<div class="container">
		   			<div class="row">
			   			<div class="col-md-8 col-md-offset-2 text-center slider-text">
			   				<div class="slider-text-inner">
			   					<h1>행복한끼</h1>
									<h5 style="padding-bottom: 20px; color:white; line-height:30px; font-size: 14px;">행복한끼는 질병정보와 BMI를 기반으로 맞춤 칼로리를 계산해 건강한 식습관 유지를 위한 정보를 제공합니다.<br/>
									 사용자들은 건강한 식습관을 유지하면서도 맛있는 음식을 즐길 수 있습니다.<br/> 또한, 다양한 레시피를 제공하여 사용자들이 새로운 요리를 시도할 수 있도록 도와줍니다.
									</h5>
									<h5><a href="myPage/checkBmi" target="_blank">BMI 계산하러 가기</a></h5>
			   				</div>
			   			</div>
			   		</div>
		   		</div>
		   	</li>
		   	<li style="background-image: url(${pageContext.request.contextPath}/resources/images/mainimg2.PNG);">
		   		<div class="overlay-gradient"></div>
		   		<div class="container">
		   			<div class="row">
			   			<div class="col-md-8 col-md-offset-2 text-center slider-text">
			   				<div class="slider-text-inner">
			   					<h1>행복한끼</h1>
									<h2>맞춤 건강식 식당 정보 제공 </h2>
									<h5><a href="myPage/checkBmi" target="_blank">BMI 계산하러 가기</a></h5>
			   				</div>
			   			</div>
			   		</div>
		   		</div>
		   	</li>
		   	<li style="background-image: url(${pageContext.request.contextPath}/resources/images/mainimg.PNG);">
		   		<div class="overlay-gradient"></div>
		   		<div class="container">
		   			<div class="row">
			   			<div class="col-md-8 col-md-offset-2 text-center slider-text">
			   				<div class="slider-text-inner">
			   					<h1>행복한끼</h1>
									<h2>맞춤 건강식 식당 정보 제공 </h2>
									<h5><a href="myPage/checkBmi" target="_blank">BMI 계산하러 가기</a></h5>
			   				</div>
			   			</div>
			   		</div>
		   		</div>
		   	</li>		   	
		  	</ul>
	  	</div>
	</aside>
	
	
	<!-- 인기식당 레시피 -->
	<div id="fh5co-course">
		<div class="container">
				<div class="col-md-6 animate-box">
					<div class="course">
						<a href="#" class="course-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/mainimg.PNG);">
						</a>
						<div class="desc">
							<h3><a href="/happy/recipe">인기 레시피</a></h3>
							<p>제철음식 부터 건강에 좋은 음식을 레시피를 보고 직접 만들어보세요!</p>
							<span><a href="/happy/recipe" class="btn btn-primary btn-sm btn-course">보러가기</a></span>
						</div>
					</div>
				</div>
				<div class="col-md-6 animate-box">
					<div class="course">
						<a href="#" class="course-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/mainimg2.PNG);">
						</a>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=3">인기 식단</a></h3>
							<p>건강 식단을 추천 받고 몸에 좋은 식단을 계획해 보세요!</p>
							<span><a href="/happy/menu?amenu_type_no=3" class="btn btn-primary btn-sm btn-course">보러가기</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 환자 정보 -->
	<div id="fh5co-counter" class="fh5co-counters" style="background-image: url(${pageContext.request.contextPath}/resources/images/green.PNG);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="row">
						<div class="col-md-3 col-sm-6 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0" data-to="3297" data-speed="5000" data-refresh-interval="50"></span>
							<span class="fh5co-counter-label">당뇨</span>
						</div>
						<div class="col-md-3 col-sm-6 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0" data-to="3700" data-speed="5000" data-refresh-interval="50"></span>
							<span class="fh5co-counter-label">고혈압</span>
						</div>
						<div class="col-md-3 col-sm-6 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0" data-to="5034" data-speed="5000" data-refresh-interval="50"></span>
							<span class="fh5co-counter-label">비만</span>
						</div>
						<div class="col-md-3 col-sm-6 text-center animate-box">
							<span class="fh5co-counter js-counter" data-from="0" data-to="1080" data-speed="5000" data-refresh-interval="50"></span>
							<span class="fh5co-counter-label">골다골증</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 맞춤 식단 -->
	<div id="fh5co-course-categories">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>개인 맞춤 건강 식단</h2>
					<p>질병 정보에 맞춰 개인에게 맞는 건강 식단을 추천 받아보세요</p>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img style="border-radius:30px; width:200px; height:200px; position: center;" src="${pageContext.request.contextPath}/img/menu1.jpg">
						</span>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=1">당뇨 식단</a></h3>
							<p>당 섭취를 줄이는 식사 습관</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img style="border-radius:30px; width:200px; height:200px; position: center;" src="${pageContext.request.contextPath}/img/menu2.jpg">
						</span>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=4">저염 식단</a></h3>
							<p>나트륨 섭취를 줄이는 저염 식사 습관</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img style="border-radius:30px; width:200px; height:200px; position: center;" src="${pageContext.request.contextPath}/img/menu3.jpg">
						</span>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=6">항암 식단</a></h3>
							<p>항암 식사 습관</p>
						</div>
					</div>
				</div>
						
			</div>
			<div class="row justify-content-center">
			
			<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img style="border-radius:30px; width:200px; height:200px; position: center;" src="${pageContext.request.contextPath}/img/menu4.jpg">
						</span>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=5">저요오드식</a></h3>
							<p>방사성 요오드를 통한 치료의 효과를 극대화 시키기 위한 식단</p>
						</div>
					</div>
				</div>		
			
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img style="border-radius:30px; width:200px; height:200px; position: center;" src="${pageContext.request.contextPath}/img/menu5.jpg">
						</span>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=2">연식</a></h3>
							<p>부드럽게 소화를 도와주는 연식</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img style="border-radius:30px; width:200px; height:200px; position: center;" src="${pageContext.request.contextPath}/img/menu7.jpg">
						</span>
						<div class="desc">
							<h3><a href="/happy/menu?amenu_type_no=4">일반식</a></h3>
							<p>건강하고 맛있는 식단</p>
						</div>
					</div>
				</div>
			
								
			</div>
		</div>
	</div>
	
	<!-- 인기레시피 -->
	
	<div id="fh5co-blog">
	<div class="container">	
	<div class="row">
				<div class="row animate-box">
					<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
						<h2>인기 레시피</h2>
						<p>지금 가장 인기 있는 레시피를 만나보세요.</p>
					</div>
				</div>
				<c:forEach var="rdto" items="${list}">
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="/happy/recipeView?recipe_no=${rdto.recipe_no}" class="blog-img-holder" style="background-size: cover; background-position: center; background-image: url('${rdto.recipe_thumbnail }')"></a>
						<div class="blog-text">
							<h3><a href="/happy/recipeView?recipe_no=${rdto.recipe_no}">${rdto.recipe_name }</a></h3>
							<span class="posted_on">${rdto.recipe_date }</span>
							<span class="comment"><a href="/happy/recipeView?recipe_no=${rdto.recipe_no}">조회수 ${rdto.recipe_hit }</i></a></span>
							<p># ${rdto.recipe_hashtag }</p>
						</div> 
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 인기식당 -->
	<div id="fh5co-blog">
	<div class="container">	
	<div class="row">
				<div class="row animate-box">
					<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
						<h2>인기 식당</h2>
						<p>지금 가장 인기 있는 식당을 만나보세요.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="resBestTop?res_type=채식음식점" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/img/vegan.jpg);"></a>
						<div style="background: 0;"class="blog-text text-center">
							<h3><a href="resBestTop?res_type=채식음식점"><span style="font-weight: 500; font-size: 20px;">채식 맛집 TOP10</span></a></h3>
						</div> 
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="resBestTop?res_type=채식가능음식점" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/img/vegeAvail.jpg);"></a>
						<div style="background: 0;" class="blog-text text-center">
							<h3><a href="resBestTop?res_type=채식가능음식점"><span style="font-weight: 500; font-size: 20px;">채식 가능 맛집 TOP10</span></a></h3>
						</div> 
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="resBestTop?res_type=저염실천음식점" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/img/lowNa.png);"></a>
						<div style="background: 0;" class="blog-text text-center">
							<h3><a href="resBestTop?res_type=저염실천음식점"><span style="font-weight: 500;font-size: 20px;">저염실천 맛집 TOP10</span></a></h3>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
	

