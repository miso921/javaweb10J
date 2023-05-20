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
	body{position:relative;color:#000;font-family:'Pretendard-Regular';}
	
	/* layout */
	#container{position:absolute;top:0px;bottom:0px;width:100%;}
	#aside{position:absolute;left:0;top:0;bottom:0;width:220px;padding:10px;overflow:auto;box-sizing:border-box;border-right:1px solid #ddd;background:#fff;}
	#content{position:absolute;top:0;bottom:0;left:220px;right:0;padding:10px;overflow:auto;}
	</style>
</head>
<body>
	<div id="container">
	<jsp:include page="/include/managerMainMenu.jsp" />
		<div id="content" class="">
			메인화면
		</div><!-- //#content -->
	</div><!-- //#container -->
</body>
</html>