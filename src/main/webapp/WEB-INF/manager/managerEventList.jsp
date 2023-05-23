<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
		/* reset */
		html,body{width:100%;height:100%;}
		body{position:relative;color:#000;font-family:'Pretendard-Regular';}
		
		/* layout */
		#container{position:absolute;top:0px;bottom:0px;width:100%;}
		#content{position:absolute;top:0;bottom:0;left:440px;right:0;padding:10px;overflow:auto;width:100%;}
	</style>
	<script>
		'use strict';
		
		// 행사 삭제
		function deleteCheck(idx) {
			let ans = confirm("선택한 행사를 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/ManagerEventDelete.ma?idx="+idx+"&pag=${pag}&pageSize=${pageSize}"
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/managerMainMenu.jsp" />
<div class="container">
	<div id="content">
			<h2 class="text-center">행 사 목 록</h2>
	<!-- 한페이지 분량처리 -->
	  <select name="pageSize" id="pageSize" onchange="pageCheck()" class="mb-2">
	    <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
	    <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
	    <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
	    <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
	    <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
	  </select> 건	
	  <div class="row">
	    <div class="col-1 border font-weight-bold text-center">번호</div>
	    <div class="col-1 border font-weight-bold text-center">분류</div>
	    <div class="col-3 border font-weight-bold text-center">행사명</div>
	    <div class="col-1 border font-weight-bold text-center">시간</div>
	    <div class="col-1 border font-weight-bold text-center">모집정원</div>
	    <div class="col-1 border font-weight-bold text-center">예약인원</div>
	    <div class="col-1 border font-weight-bold text-center">장소</div>
	    <div class="col-1 border font-weight-bold text-center">참여대상</div>
	    <div class="col-1 border font-weight-bold text-center">참가비</div>
	    <div class="col-1 border font-weight-bold text-center">비고</div>
	  </div>
	  <c:forEach var="vo" items="${vos}" varStatus="st">
	   <div class="row">
	     <div class="col-1 border text-center">${curScrStartNo}</div>
	     <div class="col-1 border text-center">${vo.part}</div>
	     <div class="col-3 border"><a href="${ctp}/ManagerEventContent.ma?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.eventName}</a></div>
	     <div class="col-1 border text-center">${vo.eTime}</div>
	     <div class="col-1 border text-center">${vo.people}명</div>
	     <div class="col-1 border text-center">${peopleNum}명</div>
	     <div class="col-1 border text-center">${vo.place}</div>
	     <div class="col-1 border text-center">${vo.target}</div>
	     <div class="col-1 border text-center">${vo.money}</div>
	     <div class="col-1 border text-center">
	     	<input type="button" value="삭제" onclick="deleteCheck(${vo.idx})" class="btn btn-danger btn-sm" />
	     </div>
	   </div>
	 	</c:forEach>  
	 	
	 	<!-- 블록 페이징 처리 -->
  	<div class="text-center m-4">
		  <ul class="pagination justify-content-center pagination-sm">
		    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
		    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
		    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
		    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerEventList.ma?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
		  </ul>
	  </div>
	</div>
</div><!-- //#content -->
</body>
</html>