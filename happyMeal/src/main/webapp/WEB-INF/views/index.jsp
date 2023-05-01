<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
									<h2>맞춤 건강식 식당 정보 제공 </h2>
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
			   					<h1>The Great Aim of Education is not Knowledge, But Action</h1>
									<h2>Brought to you by <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></h2>
									<p><a class="btn btn-primary btn-lg btn-learn" href="#">Start Learning Now!</a></p>
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
			   					<h1>We Help You to Learn New Things</h1>
									<h2>Brought to you by <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></h2>
									<p><a class="btn btn-primary btn-lg btn-learn" href="#">Start Learning Now!</a></p>
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
							<h3><a href="/happy/menu">인기 식단</a></h3>
							<p>건강 식단을 추천 받고 몸에 좋은 식단을 계획해 보세요!</p>
							<span><a href="/happy/menu" class="btn btn-primary btn-sm btn-course">보러가기</a></span>
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
			<div class="row">
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img src="${pageContext.request.contextPath}/resources/images/menuimg1.PNG">
						</span>
						<div class="desc">
							<h3><a href="#">저당 식단</a></h3>
							<p>당 섭취를 줄이는 식사 습관</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img src="${pageContext.request.contextPath}/resources/images/menuimg1.PNG">
						</span>
						<div class="desc">
							<h3><a href="#">저염 식단</a></h3>
							<p>나트륨 섭취를 줄이는 저염 식사 습관</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img src="${pageContext.request.contextPath}/resources/images/menuimg1.PNG">
						</span>
						<div class="desc">
							<h3><a href="#">고단백 식단</a></h3>
							<p>맛있는 단백질 보충을 위한 식사 습관</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 text-center animate-box">
					<div class="services">
						<span class="icon">
							<img src="${pageContext.request.contextPath}/resources/images/menuimg1.PNG">
						</span>
						<div class="desc">
							<h3><a href="#">칼슘 식단</a></h3>
							<p>골다골증에 좋은 칼슘식단</p>
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
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/resources/images/recipe1.PNG);"></a>
						<div class="blog-text">
							<h3><a href="#">식물성 미트볼 그라탕</a></h3>
							<span class="posted_on">2022.06.20</span>
							<span class="comment"><a href="">21<i class="icon-heart4"></i></a></span>
							<p>#채식 #식물성 #스파게티소스 #지구식단</p>
						</div> 
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/resources/images/recipe1.PNG);"></a>
						<div class="blog-text">
							<h3><a href="#">식물성 미트볼 그라탕</a></h3>
							<span class="posted_on">2022.06.20</span>
							<span class="comment"><a href="">21<i class="icon-heart4"></i></a></span>
							<p>#채식 #식물성 #스파게티소스 #지구식단</p>
						</div> 
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/resources/images/recipe1.PNG);"></a>
						<div class="blog-text">
							<h3><a href="#">식물성 미트볼 그라탕</a></h3>
							<span class="posted_on">2022.06.20</span>
							<span class="comment"><a href="">21<i class="icon-heart4"></i></a></span>
							<p>#채식 #식물성 #스파게티소스 #지구식단</p>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 인기식당 -->
	<div id="fh5co-blog">
	<div class="container">	
	<div class="row">
				<div class="row animate-box">
					<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
						<h2>인기 레시피</h2>
						<p>지금 가장 인기 있는 레시피를 만나보세요.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/resources/images/recipe1.PNG);"></a>
						<div class="blog-text">
							<h3><a href="#">식물성 미트볼 그라탕</a></h3>
							<span class="posted_on">2022.06.20</span>
							<span class="comment"><a href="">21<i class="icon-heart4"></i></a></span>
							<p>#채식 #식물성 #스파게티소스 #지구식단</p>
						</div> 
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/resources/images/recipe1.PNG);"></a>
						<div class="blog-text">
							<h3><a href="#">식물성 미트볼 그라탕</a></h3>
							<span class="posted_on">2022.06.20</span>
							<span class="comment"><a href="">21<i class="icon-heart4"></i></a></span>
							<p>#채식 #식물성 #스파게티소스 #지구식단</p>
						</div> 
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-img-holder" style="background-image: url(${pageContext.request.contextPath}/resources/images/recipe1.PNG);"></a>
						<div class="blog-text">
							<h3><a href="#">식물성 미트볼 그라탕</a></h3>
							<span class="posted_on">2022.06.20</span>
							<span class="comment"><a href="">21<i class="icon-heart4"></i></a></span>
							<p>#채식 #식물성 #스파게티소스 #지구식단</p>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
	
	


