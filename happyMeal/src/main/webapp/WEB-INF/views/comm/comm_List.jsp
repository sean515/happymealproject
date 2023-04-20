<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
	
	.commHeader{
	text-align:right;
	}
	
	.comm_List li{
		float:left;
		width:10%;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
	}
	
	.comm_List li:nth-child(6n+3){
		width:50%;
		/* 밑줄임표시하기 */
		white-space:nowrap;/* 줄바꾸지 않는다. */
		overflow:hidden;/* 넘치는 문자 숨기기 */
		text-overflow:ellipsis;/* 데이터가 넘친 경우 말줄임 표시 */
	}

	.pagingDiv ul{
		overflow: hidden;
		text-align:center
	}
	.pagingDiv li{
		display:inline-block;
		
		padding:10px 20px;
	}

	.pagingDiv a:link, .pagingDiv a:hover, .pagingDiv a:visited,
	.board_list a:link,.board_list a:hover,.board_list a:visited{
	color:#000;
	}
	
    .col-sm-4 {
    position: relative;
    }
    .main_image_text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: white;
    }
    
   

</style>
<script>
	/* 검색어 미입력 상태에서 검색을 진행할 때 발생하는 함수 */
	$(function(){
		$("#searchForm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력하세요...");
				return false;
			}
			return true;
		});
	});
</script>
<!-- 배너 이미지 -->


<div class= "banner">
	<img src="img/banner.png" width="100%" height="300px"/>
</div>

<div class="container">
	<div style="padding-top: 80px;">
	<!-- 검색 -->
	<div class="searchDiv" style="padding-top:20px; float: right;">	
		<form method="get" id="searchForm" action="recipe">
		<!-- 좋아요 기반 출력, 글 번호 기반 출력 -->
			<select name="filter"class="form-select" aria-label="Default select example" style="width: auto; display: inline; white-space:nowrap;">
				<option value="popularity">인기순</option>
				<option value="recent" ">최신순 </option>
			</select>
		<!-- 기간 select -->
			<select name="searchDate" class="form-select" aria-label="Default select example" style="width: auto; display: inline; white-space:nowrap;">
				<option value="">전체기간 </option>
				<option value="">오늘 </option>
				<option value="">이번주 </option>
			</select>
		<!-- 검색 시 제목 작성자 글내용 선택 -->
				
				<select name="searchKey"class="form-select" aria-label="Default select example" style=" display: inline; width: auto">
				<option value="subject">제목 </option>
				<option value="username">작성자 </option>
				<option value="content">글내용 </option>
			</select>
			<input type="text" name="searchWord" id="searchWord" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 200px; height:24.5px; display: inline;"/>
			<input type="submit" value="검색" class="btn-cta" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="width: 70px; height:30px; display: inline; background-color: #8BC34A; color: white; border: 0px;" />
		</form>
	</div>

	<!-- 소재목 -->
	<div class="pFilter">
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp커뮤니티&nbsp&nbsp</h1>
	</div>
	
	<!-- 한번에 보여지는 페이지 개수 선택 -->
	<select name="conuntNo" class="form-select" aria-label="Default select example" style="float:right; width: 120px; position: relative; top: 12px">
				<option value="10">10개씩</option>
				<option value="15">15개씩 </option>
				<option value="20">20개씩 </option>
			</select>
	</div>
	<br/>
	<hr style="height: 1px; background: black"/>
	</div>
	
	<div>
	<!-- 게시글 row 상단 -->
	<ul class="comm_List" style="overflow: hidden; padding-left: 0;">
		<li>번호</li>
		<li>글머리</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>등록일</li>
		<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>
		
		<c:forEach var="bDTO" items="${list}">
		
		<li>${recordNum }</li><!-- bDTO.no  --> 
		<li>${bDTO.comm_bullet_point }</li><!-- bDTO.no  --> 
		<!-- 글 내용 보기 레코드 번호, 현재 페이지, 검색어가 있으면 검색키, 검색어를 가져가야 함. -->
		<li style="color: black;"><a href="commView?comm_no=${bDTO.comm_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.comm_title }</a></li>
		<li>${bDTO.username }</li>
		<li>${bDTO.comm_hit }</li>
		<li>${bDTO.comm_date }</li>
		<c:set var="recordNum" value="${recordNum-1 }"></c:set>
		</c:forEach>
	</ul>
	</div>
	
	
	<div class="commHeader" style="margin-bottom: 20px; margin-top: 10px">
	<!-- <a href="commWrite">글쓰기</a> -->
	<button type="button" class="btn btn-outline-dark" onclick="location.href='commWrite'"
	style="margin-top: 10px"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 글쓰기</button></div>
	
	
		<!-- 페이징 -->
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
              <a class="page-link" href="comm_List?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
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
                <a class="page-link" href="comm_List?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
                </c:if>
            </c:forEach>

            <!-- 다음페이지 -->
           <c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
        <li class="page-item">
          <a class="page-link" href="comm_List?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
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