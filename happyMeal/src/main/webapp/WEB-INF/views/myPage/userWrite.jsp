<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*"%>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">	

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

<style >


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
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
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
</script>
<div class="container"><br/><br/>
	<h1>내가 작성한 글 리스트</h1>
		<form action="/happy/myPage/userWrite" method="get">
			<div id="btn-group">
				<input type="hidden" name="amenu_type_no" value="${vo.amenu_type_no}">
				<button type="submit" id="btn1" class="btn" name="cate"
					value="1">레시피</button>
				<button type="submit" id="btn2" class="btn" name="cate"
					value="2">식단</button>
				<button type="submit" id="btn3" class="btn" name="cate" 
					value="3">커뮤니티</button>
			</div>
		</form>
<div class="container">
	<div style="padding-top: 80px;">
	<c:if test="${param.cate == '3'}">
		<!-- 소재목 -->
	<div class="pFilter">
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp커뮤니티&nbsp&nbsp</h1>
	</div>
	
	</div>
	<br/>
	<hr style="height: 1px; background: black; margin-bottom:0;"/>
	</div>
	
	<div>
	<!-- 게시글 row 상단 -->
	<ul class="comm_List" style="overflow: hidden; padding-left: 0;">
		<li style="background-color: #dddddd45;">번호</li>
		<li style="background-color: #dddddd45;">글머리</li>
		<li style="background-color: #dddddd45;">제목</li>
		<li style="background-color: #dddddd45;">작성자</li>
		<li style="background-color: #dddddd45;">조회수</li>
		<li style="background-color: #dddddd45;">등록일</li>
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
	</c:if>
	
	
	<c:if test="${param.cate == '2'}">
	<div class="row animate-box">
			<h1 class="title" style="display: inline; font-size: 40px">&nbsp식단&nbsp&nbsp</h1>
		</div>
		<hr style="height: 1px; background: black" />
	</div>
	<div>

		<!-- 아코디언 추가 -->

		<div class="accordion accordion-flush" id="accordionFlushExample">
			<form action="/happy/menu" method="get">

			</form>

			<!-- 게시글 row 상단 -->
			<ul class="recipe" style="overflow: hidden; padding-left: 0;">
				<!-- 시작번호 설정 			   총레코드 수 		  현재 페이지	한페이지에 표시할 레코드 수-->
				<c:set var="recordNum"
					value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>

				<div id="fh5co-blog">
					<div class="container">

						<div class="row">
							<c:forEach var="MenuUserDTO" items="${list}">

								<div class="col-lg-4 col-md-4">
									<div class="fh5co-blog animate-box">
										<a href="menuView_user?menu_no=${MenuUserDTO.menu_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" class="blog-img-holder"
											style="background-image: url('/happy/uploadfile/${fileDto.filename }${MenuUserDTO.menu_thumbnail }');"></a>
					

										<div class="blog-text" style="padding:20px 15px;">
											<h5>${MenuUserDTO.menu_title}</h5>
											<p style="margin-bottom: 5px; display: inline-block;">${MenuUserDTO.nickname}</p>
											<p style="margin-bottom: 5px; display: inline-block; float: right;"> 조회수 : ${MenuUserDTO.menu_hit} </p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</ul>
		</div>


		<div class="recipeHeader" style="float: center; margin-top: -50px;">
			<!-- <a href="recipeWrite">글쓰기</a> -->


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
		      <a class="page-link" href="menu_user?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
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
				<a class="page-link" href="menu_user?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
	   
	   	<!-- 다음페이지 -->
	   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
	    <li class="page-item">
	      <a class="page-link" href="menu_user?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
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
		
	</c:if>
	
	
	<c:if test="${param.cate == '1' or param.cate==null}">
	<!-- 소재목 -->
	<div class="row animate-box">
	<h1 class="title" style="display: inline; font-size: 40px">&nbsp레시피&nbsp&nbsp</h1>
	</div>
	<hr style="height: 1px; background: black"/>
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
					<div class="staff-img" style="background-image: url('/happy/uploadfile/${fileDto.filename }${bDTO.recipe_thumbnail }');">
					</div>
					<h3><a href="/happy/recipeView_user?recipe_no=${bDTO.recipe_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.recipe_name }</a></h3>
					<p> </p>
					<p>${bDTO.recipe_date }</p>
					<p>${bDTO.username }</p>		
				</div>
			</div>
		<c:set var="recordNum" value="${recordNum-1 }"></c:set>	
		</c:forEach>
		</div>
		</div>
		</div>
		</ul>	
	
	
	<div class="recipeHeader" style="float: center; margin-top: -50px; " >

	
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
		      <a class="page-link" href="recipe_user?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Previous">
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
				<a class="page-link" href="recipe_user?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
	   
	   	<!-- 다음페이지 -->
	   	<c:if test="${vo.nowPage<vo.totalPage}"> <!-- 다음페이지가 있다 -->
	    <li class="page-item">
	      <a class="page-link" href="recipe_user?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>" aria-label="Next">
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
	</c:if>
</div>
  <br>
  </div>
  </div>
  </div>