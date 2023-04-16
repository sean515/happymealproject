<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.container{
	padding:30px;
	overflow:auto;
	
	}
	.board_header{
		clear:both;
				
	}
	
	.pHeader>div{
		background:#FCF9F9;
		color:black;
	}
	.pHeader>div:last-child{
		text-align:right;
	}
	.board_list{
		clear:both;
		overflow:auto;
		
	}
	
	.board_list li{
		float:left;
		width:10%;
		height:50px;
		line-height:50px;
		border-bottom:1px solid #ddd;
		
	}
	.board_list li:nth-child(5n+2){
		width:55%;
		/*밑줄임표시하기*/
		white-space:nowrap;/*줄바꾸지 않는다.*/
		overflow:hidden;/*넘치는 문자 숨기기*/
		text-overflow:ellipsis;/*넘친데이터가 있을때 말줄임 표시*/
	}
	.board_list li:nth-child(5n){
		width:15%;
	}
	
	.suppagingDiv li{
		padding:10px 20px;
	}
	.suppagingDiv a:link, .suppagingDiv a:hover, .suppagingDiv a:visited,
	 .board_list a:link,.board_list a:hover,.board_list a:visited{
		color:#000;
	}
</style>
<script>
	$(function(){
	
	});
</script>
 <!-- banner -->
 <div class="banner">
 	<img src="../img/banner.png" width="100%" height="150px"/>
 </div>
 <!-- 고객센터 1:1 문의 페이지 -->
<div class="container">
	<h1>고객센터</h1>
	<hr style="border: solid 2px black;">
	<h4>&nbsp;&nbsp;&nbsp;1:1 문의 </h4>

	<!-- 자주하는질문이동, 글작성 버튼 -->
	<button type="button" class="btn btn-outline-success" style="float:right"><div class="board_header"><a href="supWrite">문의하기</a></div></button>
	<button type="button" class="btn btn-outline-success" style="float:right"><div class="board_header"><a href="commonSupList">자주하는질문</a></div></button>
	<div class="pHeader">
	</div>
	<br/>
	<br/>
	<div style="float:left">${svo.supNowPage} / ${svo.supTotalPage}</div>
	
		
	
	<!-- 게시판리스트목록 -->
	<ul class="board_list">
		
		<li>글번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>작성일</li>
		
		<!-- 페이징 -->
		<!-- 시작번호 설정                    총레코드수          현재페이지      한페이지에 표시할 레코드수 -->
			<c:set var="supNum" value="${svo.supTotalRecord - ((svo.supNowPage-1)*svo.supOnePageRecord)}"/>
		<!-- jstl로 변수를 만들어 총레코드수를 보관 -->
		<!--
		<c:set var="noNum" value="${totalRecord}"/>
		-->
		<c:forEach var="supDTO" items="${list}">
	
			<li>${supNum}</li>
			
			<li>
				<!-- 공백이 있을때 lvl : 0, 1, 2.... -->
			<c:if test="${supDTO.sup_lvl>0}">
				<!-- 공백처리 -->
				<c:forEach var="i" begin="${1}" end="${supDTO.sup_lvl}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<!-- ↳ 표시 -->
				↳RE: 
			</c:if>
			<a href="supView?sup_no=${supDTO.sup_no}">${supDTO.sup_title}</a>
			</li>
			
			<li>${supDTO.userid}</li>
			<li>${supDTO.sup_hit}</li>
			<li>${supDTO.sup_date}</li>
			
			<c:set var="supNum" value="${supNum-1}"/>
		</c:forEach>
	</ul>
<!-- 페이징 -->
<br/>
<div class="text-center">
	<div class="supPagingDiv" style="margin-bottom: 50px">
		<ul>
		<!-- 이전페이지       : nowPage를 기준으로 -->
			<c:if test="${svo.supNowPage==1}"> <!-- 현재페이지가 첫번쨰 페이지일때 -->
				<li style="display:inline">prev</li>
			</c:if>
			<c:if test="${svo.supNowPage>1}"> <!-- 현재페이지가 첫번째 페이지가 아닐때 -->
				<li style="display:inline"><a href="supList?supNowPage=${svo.supNowPage-1}">prev</a></li>
			</c:if>
			<!-- 페이지 번호 -->
			
			<c:forEach var="sp" begin="${svo.supStartPageNum}" end="${svo.supStartPageNum+svo.supOnePageNumCount-1}">
				<c:if test="${sp<=svo.supTotalPage}"> <!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->
				<!-- 현재페이지 표시하기 -->
				<c:if test="${sp==svo.supNowPage}">
				<li style="text-decoration:underline; display:inline;">
				</c:if>
				<c:if test="${sp!=svo.supNowPage}">
				<li style="display:inline">
				</c:if>
				<a href="supList?supNowPage=${sp}">${sp}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음페이지 -->
			<c:if test="${svo.supNowPage<svo.supTotalPage}"> <!-- 다음페이지가 있다 -->
				<li style="display:inline"><a href="supList?supNowPage=${svo.supNowPage+1}">next</a></li>
			</c:if>
			<c:if test="${svo.supNowPage==svo.supTotalPage}"><!-- 현재페이지가 마지막일때 -->
				<li style="display:inline">next</li>
			</c:if>
		</ul>
	</div>
</div>
	
	<!-- 페이징 디자인 
<div class="container mt-3" style="margin:0; padding:0;">
  <ul class="pagination" style="margin:0; padding:0; clear:both; float:right;">
    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
  </div>
-->
</div>

