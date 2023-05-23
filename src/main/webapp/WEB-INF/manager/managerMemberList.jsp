<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerMemberList.ma</title>
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
			if(${pag} > ${totPage}) location.href="${ctp}/ManagerMemberList.ma?pag=${totPage}&pageSize=${pageSize}";
			
			function pageCheck() {
				let pageSize = document.getElementById("pageSize").value;
				location.href = "${ctp}/ManagerMemberList.ma?pag=${pag}&pageSize="+pageSize;
			}
	</script>
</head>
<body>
<jsp:include page="/include/managerMainMenu.jsp" />
<div class="container">
	<div id="content">
	<p><br /></p>
	<h2 class="text-center"><font size="15px;"><b>회 원 목 록</b></font></h2>
	<br/>
	<div class="row borderless m-0 p-0">
		<div class="col mb-2">
		<!-- 한페이지 분량처리 -->
			<select name="pageSize" id="pageSize" onchange="pageCheck()">
				<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
				<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
				<option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
				<option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
				<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
			</select> 건
		</div>
	</div>
	<div class="row text-center">
		<div class="col-1 border font-weight-bold">번호</div>
		<div class="col-1 border font-weight-bold">성명</div>
		<div class="col-2 border font-weight-bold">아이디</div>
		<div class="col-1 border font-weight-bold">별명</div>
		<div class="col-1 border font-weight-bold">생년월일</div>
		<div class="col-1 border font-weight-bold">전화번호</div>
		<div class="col-1 border font-weight-bold">이메일</div>
		<div class="col-1 border font-weight-bold">성별</div>
		<div class="col-1 border font-weight-bold">탈퇴신청</div>
		<div class="col-1 border font-weight-bold">등급</div>
		<div class="col-1 border font-weight-bold">비고</div>
	</div>
	</div>	
	<c:forEach var="vo" items="${vos}" varStatus="st">
	<div class="row hover text-center">
		<div class="col-1 border">${curScrStartNo}</div>
		<div class="col-1 border">${vo.name}</div>
		<div class="col-2 border">${vo.mid}</div>
		<div class="col-1 border">${vo.nick}</div>
		<div class="col-1 border">${vo.birthday}</div>
		<div class="col-1 border">${vo.tel}</div>
		<div class="col-1 border">${vo.email}</div>
		<div class="col-1 border">${vo.gender}</div>
		<div class="col-1 border">${vo.userDel}</div>
		<div class="col-1 border">${vo.level}</div>
		<div class="col-1 border"><input type="button" value="탈퇴" class="btn btn-danger" /></div>
	</div>
	<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	</c:forEach>
	<!-- 블록 페이징 처리 -->
	<div class="text-center m-4">
		<ul class="pagination justify-content-center pagination-sm">
			<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
			<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
			<c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
			<c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
			<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
			</c:forEach>
			<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
			<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
		</ul>
	</div>
</div>
<p><br/></p>
</body>
</html>