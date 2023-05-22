<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMypageInfo.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function fCheck() {
			let pwd = $("#pwd").val();
			
			if(pwd == "") {
				alert("비밀번호를 입력하세요!");
				document.getElementById("pwd").focus();
			}
			else {
				myform.submit();
			}
		}
	</script>
	<style>
		@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
		
		body {font-family: 'Pretendard-Regular';}
			
		.container {
			text-align: center;
		}	
		
	</style>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class='container'>
	<form name="myform" method="post" action="${ctp}/MemberMypageInfoOk.me">
		<h2>회 원 정 보 수 정</h2>
		<p>회원정보 수정을 위해 비밀번호를 입력하세요</p>
		<div>
			비밀번호
		</div>
		<div class="mb-2">
			<div><input type="password" name="pwd" id="pwd" autofocus required /></div>
		</div>
		<div>
			<input type="button" value="확인" onclick="fCheck()" class="btn btn-success mr-2" />
			<input type="reset" value="재입력" class="btn btn-warning mr-2" />
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/';" class="btn btn-danger" />
		</div>
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>