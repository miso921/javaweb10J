<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		#c {
			background-size: cover;
		}
	</style>
</head>
<body>
<p><br /></p>
<div class='container'>
	<img src id="c" />
</div>
<p><br /></p>
</body>
</html>