<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	header,footer{
		display:none;
	}
	.top-menu{
		display:none;	
	}
	.js-fh5co-nav-toggle{
		display:none;
	}
	.gototop{
		display:none;
	}
	.reportWrite{
		width:400px;
		height:500px;
	}
	.writeInner{
		width:100%;
		height:100%;
		padding:20px;
	}
	.popHeader{
		text-align:center;
		border-bottom: 1px solid #ddd;
	}
</style>
<script>
	$(function(){
		// url에서 쿼리 문자열 가져옴
		const queryString = window.location.search;
		// 쿼리 문자열에서 ? 문자를 제거후 & 문자를 기준으로 분할하여 배열에 담음
		const params = queryString.substr(1).split("&");
		//값을 담을 변수 선언
		let board_type, board_no;
		//분할된 배열의 각 요소를 돌면서 값이 있는지 확인
		for(let i=0; i<params.length; i++){
			const keyValue = params[i].split("="); // = 를 기준으로 키와 값으로 분리
			const key = keyValue[0];
			const value = keyValue[1];
			
			if (key === "menu_no") {
			    // board_type 변수에 값을 할당함
			    board_type = 1;
			    
			    // board_no 변수에 값을 할당함
			    board_no = parseInt(value);
			    
			    break; // 값을 찾으면 반복문을 중지함
			    
			} else if (key === "recipe_no") {
			    board_type = 2;
			    board_no = parseInt(value);
			    break;
			} else if (key === "comm_no") {
			    board_type = 3;
			    board_no = parseInt(value);
			    break;
			}
		}
		const boardNoInput = document.querySelector("#board_type");
		boardNoInput.value = board_type;
		
		const reportPostNoInput = document.querySelector("#report_post_no");
		reportPostNoInput.value = board_no;
		
		$("#reportWriteForm").submit(function(){
			if($("#report_text").val()==""){
				alert("신고 내용을 입력해주세요");
				return false;
			}
			
			$("#reportWriteForm").attr("action", "reportSend");
		});
	});
	
</script>

<div class="reportWrite">
	<div class="writeInner">
		<div class="popHeader">
			<h3>신고하기</h3>
		</div>
		<div class="popBody">
			<form method="post" id="reportWriteForm">
				<input type="text" name="userid" value="${logId }"/>
				<input type="text" name="board_type" id="board_type" value=""/>
				<input type="text" name="report_post_no" id="report_post_no" value=""/>
				<div class="reportReasonSelect">
					<div>신고유형</div>
					광고<input type="radio" name="report_reason" value="1" checked/>
					비방<input type="radio" name="report_reason" value="2"/>
					허위정보<input type="radio" name="report_reason" value="3"/>
					기타<input type="radio" name="report_reason" value="4"/>
				</div>
				<div class="reportText">
					<div>신고내용</div>
					<textarea name="report_text" value="" placeholder="신고내용을 상세히 기재해주세요"></textarea>
				</div>
				
				<input type="submit" value="신고"/>
			</form>
		</div>
	</div>
</div>