<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberEventList.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  body {font-family: 'GmarketSansMedium';}
	</style>
	<script>
		'use strict';
		
		if(${pag} > ${totPage}) location.href="${ctp}/MemberEventList.me?pag=${totPage}&pageSize=${pageSize}";
		
		function pageCheck() {
			let pageSize = document.getElementById("pageSize").value;
			location.href= "${ctp}/MemberEventList.me?pag=${pag}&pageSize="+pageSize;
		}
	</script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class='container'>
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
	    <div class="col border">번호</div>
	    <div class="col border">분류</div>
	    <div class="col border">행사명</div>
	    <div class="col border">시간</div>
	    <div class="col border">모집정원</div>
	    <div class="col border">예약인원</div>
	    <div class="col border">장소</div>
	    <div class="col border">참여대상</div>
	    <div class="col border">참가비</div>
	  </div>
	  <c:forEach var="vo" items="${vos}" varStatus="st">
	   <div class="row">
	     <div class="col border">${curScrStartNo}</div>
	     <div class="col border">${vo.part}</div>
	     <div class="col border"><a href="${ctp}/MemberEventContent.me?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.eventName}</a></div>
	     <div class="col border">${vo.eTime}</div>
	     <div class="col border">${vo.people}명</div>
	     <div class="col border">${peopleNum}명</div>
	     <div class="col border">${vo.place}</div>
	     <div class="col border">${vo.target}</div>
	     <div class="col border">${vo.money}</div>
	   </div>
	 	</c:forEach>  
	 	
	 	<!-- 블록 페이징 처리 -->
  	<div class="text-center m-4">
		  <ul class="pagination justify-content-center pagination-sm">
		    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberEventList.me?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
		    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberEventList.me?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
		    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/MemberEventList.me?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberEventList.me?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberEventList.me?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
		    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberEventList.me?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
		  </ul>
	  </div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>