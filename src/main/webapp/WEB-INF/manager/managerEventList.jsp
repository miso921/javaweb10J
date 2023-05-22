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
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br /></p>
<div class='container'>
	<div class="row border border-dark">
		번호
	</div>
	<div class="row border border-dark">
		분류
	</div>
	<div class="row border border-dark">
		행사명
	</div>
	<div class="row border border-dark">
		시간
	</div>
	<div class="row border border-dark">
		참가권
	</div>
	<div class="row border border-dark">
		장소
	</div>
	<div class="row border border-dark">
		참여대상
	</div>
	<div class="row border border-dark">
		참여인원
	</div>
	<div class="row border border-dark">
		참가비
	</div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>