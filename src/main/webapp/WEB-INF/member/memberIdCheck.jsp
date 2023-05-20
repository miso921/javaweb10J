<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberIdCheck.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
			font-family: 'GmarketSansMedium';
		  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		  font-weight: normal;
		  font-style: normal;
			}
			
	  body {
	    font-family: 'GmarketSansMedium';
	    width: 100%;
	  }  
	  
	  #closeBtn {
	    margin: 0 auto;
	    display:block;
	  }
	  
	  .fon {
	  	font-size: 25px;
			text-align: center;
	  }
	</style>
	<script>
		'use strict';
		
		// 아이디 중복검사
		function midCheck() {
			let mid = childForm.mid.value;
			
			if(mid.trim()=="") {
				alert("아이디를 입력하세요!");
				childForm.mid.focus();
			}
			else {
				childForm.submit();
			}
		}
		
		// 중복검사 창닫기
		function sendCheck() {
			opener.window.document.myform.mid.value = '${mid}';
			opener.window.document.myform.nick.focus();
			window.close();
		}
	</script>
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2 class="text-center">아이디 중복 검사</h2>
	<hr /><br />
	<c:if test="${res == 1}">
		<span class="fon"><font color="#38913C"><b>${mid}</b></font>는(은) 사용가능한 아이디입니다.</span>
		<p><input type="button" value="닫기" onclick="sendCheck()" id="closeBtn" class="btn btn-dark mt-2" /></p>
	</c:if>
	<c:if test="${res != 1}">
		<span class="fon"><font color="#38913C"><b>${mid}</b></font>는(은) 이미 사용중인 아이디입니다.</span>
			<form name="childForm" method="post" action="${ctp}/MemberIdCheck.me">
			<p>
				<input type="text" name="mid" />
				<input type="button" value="아이디 재검색" onclick="midCheck()" class="btn btn-danger mt-2" />
			</p>
		</form>
	</c:if>
</div>
</body>
</html>