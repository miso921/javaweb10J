<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MemberFindMidOk.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class='container'>
	<h2>아 이 디 찾 기 결 과</h2>
	<div class="row">
		성명
	</div>
	<div class="col">
		${name}
	</div>
	<div class="row">
		닉네임
	</div>
	<div class="col">
		${nick}
	</div>
	<div class="row">
		아이디
	</div>
	<div class="col">
		${mid}
	</div>
	<div>
		<input type="button" value="돌아가기" onclick="location.href='${ctp}/';" class="btn btn-warning" />
	</div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>