<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

</style>
<div class="container"><br/><br/>
	<h1>즐겨찾기한 식당 리스트</h1>
	
		<ul>
			<li>
			<c:set var="recordNum"
				value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"></c:set>

				<c:forEach var="ResDTO" items="${list}">
				<a href="/happy/resView?res_no=${ResDTO.res_no}"><img src="${ResDTO.res_image}" width="100" height="100" align="left"/>&emsp;&emsp;&emsp;</a>
				식당 이름 : ${ResDTO.res_name}<br/>&emsp;&emsp;&emsp;
				주소 : ${ResDTO.res_addr}<br/>&emsp;&emsp;&emsp;
				전화 번호 : ${ResDTO.res_tel}<br/>&emsp;&emsp;&emsp;
				음식 타입 : ${ResDTO.res_type}<br/><br/><hr class="hr3"/>
				
			</c:forEach>
			
				
			</li>
		</ul>
</div>