<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerMain.jsp</title>
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
	body{font-family:'Pretendard-Regular';}
	</style>
	<frameset cols="200px,*">
		<frame src="${ctp}/ManagerLeft.ma" name="managerLeft" frameborder="0" />
		<frame src="${ctp}/ManagerContent.ma" name="managerContent" frameborder="0" />
	</frameset>
</head>
</html>	