<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  body {font-family: 'GmarketSansMedium';}
		#selectDel {margin-left:500px;}
	</style>
	<script>
		'use strict';
		
		function pageCheck() {
			if (${pag} > ${totPage}) location.href="${ctp}/ManagerEventList.ma?pag=${totPage}&pageSize=${pageSize}";
			let pageSize = $("#pageSize").val();
			location.href = "${ctp}/ManagerEventList.ma?pag=${Pag}&pageSize="+pageSize;
		}
		
		// 개별 행사 삭제
		function deleteCheck(idx) {
			let ans = confirm("선택한 행사를 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type : "post",
				url  : "${ctp}/ManagerEventDelete.ma",
				data : {idx : idx},
				success : function() {
					alert("선택한 행사가 삭제되었습니다!");
					location.reload();
				},
				error : function() {
					alert("전송오류!");
				}
			});
		}
		
		// 전체 선택
		$(function() {
			$("#checkAll").click(function() {
				if($("#checkAll").prop("checked")) {
					$(".chk").prop("checked",true);
				}
				else {
					$(".chk").prop("checked",false);
				}
			});
		});
		
		// 체크박스 삭제
		function eventDelete(idx) {
			let ans = confirm("선택한 항목을 모두 삭제하시겠습니까?");
    	if(!ans) return false;
    	
  		let changeItems = "";
  		for(var i=0; i<myform.chk.length; i++) {
  			if(myform.chk[i].checked==true) changeItems += myform.chk[i].value + "/";
  		}
  		changeItems = changeItems.substring(0,changeItems.length-1);
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/ManagerEventDelete.ma",
    		data   : {changeItems : changeItems, sw : 1},
    		success:function() {
  				alert("선택한 행사가 모두 삭제되었습니다!");
  				location.reload();
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
		
		/* // 모달로 데이터 보내기(날짜등록)
		$(document).on("click", "#eventInput", function() {
		  let eventName = $("#eventInput").data('eventName');
		  console.log("eventName: " + eventName);
		  $("#eventName").val(eventName);
		}); */
	</script>
</head>
<body>
<p><br /></p>
<div class="container">
	<form name="myform">
	  <div id="content">
	    <br>
	    <h2 class="text-center"><b>행 사 목 록</b></h2>
	    <br>
	    <div class="row borderless m-0 p-0">
	      <div class="col mb-2">
	        <!-- 한페이지 분량처리 -->
	        <select name="pageSize" id="pageSize" onchange="pageCheck()" class="form-control-sm">
	          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
	          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
	          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
	          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
	          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
	        </select>
	      </div>
	      <!-- <div class="col">
	        <div class="form-check">
	          <input type="checkbox" id="checkAll" class="form-check-input">
	          <label class="form-check-label" for="checkAll">전체선택/해제</label>
	        </div>
	      </div> -->
	      <!-- <div class="col">
	        <div class="form-check">
	          <input type="checkbox" id="reverseAll" class="form-check-input">
	          <label class="form-check-label" for="reverseAll">전체반전</label>
	        </div>
	      </div> -->
	      <div class="col">
	        <input type="button" value="선택삭제" id="selectDel" onclick="eventDelete(${vo.idx})" class="btn btn-outline-warning btn-sm mb-2">
	      </div>
	    </div>
	    <div class="table-responsive">
	      <table class="table table-bordered text-center table-responsive">
	        <thead>
	          <tr>
	            <th>
	            	<div class="form-check">
	          			<input type="checkbox" id="checkAll" class="form-check-input">
	          			<label class="form-check-label" for="checkAll">전체</label>
	        			</div>
	            </th>
	            <th>번호</th>
	            <th>분류</th>
	            <th>행사명</th>
	            <th>시간</th>
	            <th>모집정원</th>
	            <th>장소</th>
	            <th>참여대상</th>
	            <th>참가비</th>
	            <th>비고</th>
	          </tr>
	        </thead>
	        <tbody>
	          <c:forEach var="vo" items="${vos}" varStatus="st">
	            <tr>
	              <td class="text-center">
	              	<input type="checkbox" class="chk" name="chk" value="${vo.idx}" />
	              </td>
	              <td class="text-center">
	              	${curScrStartNo}
	              </td>
	              <td>${vo.part}</td>
	              <td><a href="${ctp}/ManagerEventContent.ma?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" target="managerContent">${vo.eventName}</a></td>
	              <td>${vo.eTime}</td>
	              <td>${vo.people}</td>
	              <td>${vo.place}</td>
	              <td>${vo.target}</td>
	              <td>${vo.money}</td>
	              <td>
	              	<input type="button" value="삭제" onclick="deleteCheck(${vo.idx})" class="btn btn-danger btn-sm mb-2">
	              	<input type="button" value="날짜등록" onclick="location.href='${ctp}/EventDateInput.mae?idx=${vo.idx}';" class="btn btn-secondary btn-sm">
	              	<!-- Button to Open the Modal -->
	              	<%-- <button type="button" id="eventInput" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#myModal" data-eventName="${vo.eventName}">날짜등록</button> --%>
	              </td>
	            </tr>
	            <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	          </c:forEach>	
	        </tbody>
	      </table>
	    </div>
	    <!-- 블록 페이징 처리 -->
	    <div class="text-center m-4">
	      <ul class="pagination justify-content-center pagination-sm">
	        <c:if test="${pag > 1}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=1">첫페이지</a>
	          </li>
	        </c:if>
	        <c:if test="${curBlock > 0}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a>
	          </li>
	        </c:if>
	        <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	          <c:if test="${i <= totPage && i == pag}">
	            <li class="page-item active">
	              <a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${i}">${i}</a>
	            </li>
	          </c:if>
	          <c:if test="${i <= totPage && i != pag}">
	            <li class="page-item">
	              <a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${i}">${i}</a>
	            </li>
	          </c:if>
	        </c:forEach>
	        <c:if test="${curBlock < lastBlock}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a>
	          </li>
	        </c:if>
	        <c:if test="${pag < totPage}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a>
	          </li>
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</form>	 
</div>
<!-- <!-- The Modal
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      Modal Header
      <div class="modal-header text-center">
        <h4 class="modal-title">날 짜 등 록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      Modal body
      <div class="modal-body">
      	<div class="d-flex align-items-center justify-content-center mb-4">
					<span class="font-weight-bold mr-3" >행사명</span>
					<input type="text" name="eventName" id="eventName" readonly class="form-control-md" />
				</div>
      	<div class="d-flex align-items-center justify-content-center mb-4">
					<span id="eTime" class="font-weight-bold mr-1">행사시간</span>
					<input type="date" name="eTime" id="eTimeBox" autofocus required class="form-control-md" />
				</div>
				Modal footer
        <div class="modal-footer">
        	<input type="submit" value="확인" class="btn btn-success mr-2" />
        	<input type="reset" value="재입력" class="btn btn-warning mr-2" />
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div> -->
<p><br /></p>
</body>
</html>