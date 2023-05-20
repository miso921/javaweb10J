<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberNickCheck.jsp</title>
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
		
		// 닉네임 중복 검사
		function nickCheck() {
			let nick = childForm.nick.value;
			
			if(nick == "") {
				alert("닉네임을 입력하세요!");
				childForm.nick.focus();
			}
			else {
				childForm.submit();
			}
		}
		
		// 중복 검사 창닫기
		function sendCheck() {
			opener.window.document.myform.nick.value = '${nick}';
			opener.window.document.myform.pwd.focus();
			window.close();
		}
	</script>
</head>
<body>
<p><br /></p>
<div class='container'>
	<h2>닉네임 중복 검사</h2>
	<hr /><br />
	<c:if test="${res == 1}">
		<span class="fon"><font color="#38913C"><b>${nick} 는(은) 사용가능한 닉네임입니다.</b></font></span>
		<p><input type="button" value="닫기" onclick="sendCheck()" id="closeBtn" class="btn btn-dark mt-2" /></p>
	</c:if>
	<c:if test="${res != 1}">
		<span class="fon"><font color="#38913C"><b>${nick}</b></font>는(은) 이미 사용중인 닉네임입니다.</span>
			<form name="childForm" method="post" action="${ctp}/MemberNickCheck.me">
			<p>
				<input type="text" name="nick" />
				<input type="button" value="닉네임 재검색" onclick="nickCheck()" class="btn btn-danger mt-2" />
			</p>
		</form>
	</c:if>
</div>
</body>
</html>