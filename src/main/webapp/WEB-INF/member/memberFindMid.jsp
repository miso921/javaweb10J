<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberFindMid.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script>
		'use strict';
		
		function memberFindMid(){
			let name = $("#name").val();
			let nick = $("#nick").val();
			
			if(name == ""){
				alert("성명을 입력하세요!");
				document.getElementById("name").focus();
			}
			if(nick == ""){
				alert("닉네임을 입력하세요!");
				document.getElementById("nick").focus();
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
	<h2 class="text-center">아 이 디 찾 기</h2>
	<form name="myform" method="post" action="${ctp}/MemberFindMidOk.me"> 
		<div class="text-left">
			이름
		</div>
		<div class="mb-2">
			<input type="text" name="name" id="name" autofocus required />
		</div>
		<div class="text-left">
			닉네임
		</div>
		<div class="mb-3">
			<input type="text" name="nick" id="nick" required />
		</div>
		<div>
			<input type="button" value="확인" onclick="memberFindMid()" class="btn btn-success mr-2" />
			<input type="reset" value="재입력" class="btn btn-primary mr-2" />
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/';" class="btn btn-secondary" />
		</div>
	</form>	
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>