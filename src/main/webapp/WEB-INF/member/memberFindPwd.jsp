<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberFindPwd.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function memberFindPwd(){
			let pwd = $("#pwd").val();
			
			if(pwd.trim() == ""){
				alert("비밀번호를 입력하세요!");
				document.getElementById("pwd").focus();
			}
			else {
				myform.submit();
			}
		}	
	</script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class='container'>
	<h2 class="text-center">비 밀 번 호 찾 기</h2>
	<form name="myform" method="post" action="${ctp}/MemberFindPwdOk.me"> 
		<div class="text-left">
			비밀번호
		</div>
		<div class="mb-2">
			<input type="password" name="pwd" id="pwd" autofocus required />
		</div>
		<div class="text-center">
			<input type="button" value="확인" onclick="memberFindPwd()" class="btn btn-success mr-2" />
			<input type="reset" value="재입력" class="btn btn-primary mr-2" />
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/';" class="btn btn-secondary" />
		</div>
	</form>	
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>