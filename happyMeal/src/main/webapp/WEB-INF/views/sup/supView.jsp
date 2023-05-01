<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#view li{
		border-bottom:1px solid #ddd;
		padding:10px 0;
	}
	
</style>
<script>
	var supDelCheck = ()=>{
		if(confirm('삭제하시겠습니까?')){
			location.href = "/happy/sup/supDelete?sup_no=${dto.sup_no}";
		}
	}
</script>
 <!-- 배너 -->
<div class= "banner" style="overflow: hidden;">
	<img src="../img/bannerimg2.png" width="100%" height="300px;">
</div>
 <!-- 문의내역 페이지 -->
<div class="container" style="padding:30px">
	<h1>문의내역</h1>
	<hr style="border: solid 2px black;">
	 <!-- 목록으로가는 홈버튼 -->
  <button type="button" class="btn btn-outline-success" style="float:right" ><a href="supList">목록으로</a></button>
<br/>
	<br/>
	<!-- 내역목록 -->
	<ul id="view">
		<li>문의글번호 : ${dto.sup_no}</li>
		<li>작성자 : ${dto.userid}</li>
		<li>작성일 : ${dto.sup_date}</li>
		<li>조회수 : ${dto.sup_hit}</li>
		<li>제목 : <b>${dto.sup_title}</b></li>
		<li>내용 : ${dto.sup_text}</li>
	</ul>
	<br/>
	<p id="s">
		<!-- 로그인이 된경우 답변글쓰기 가능 -->
		<c:if test="${logStatus=='Y'}">
		<button type="button" class="btn btn-outline-info"><a href="supAnswer/${dto.sup_no}">답변작성</a></button>
		</c:if>
		<!-- 본인이 쓴 글일때 -->
		<c:if test="${dto.userid==logId}">
		<!-- 수정,삭제버튼 -->
			 <button type="button" class="btn btn-outline-warning"><a href="supEdit/${dto.sup_no}">수정</a></button>
			<button type="button" class="btn btn-outline-danger"><a href="javascript:supDelCheck()">삭제</a></button>
		</c:if>
	</p>
</div>