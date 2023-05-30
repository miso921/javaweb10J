<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMypageContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
		   font-family: 'GmarketSansMedium';
		   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		   font-weight: normal;
		   font-style: normal;
		}
		body {font-family: 'GmarketSansMedium';}
		#content {text-align:left;margin-left:50px;}
		hr {
		  width : 30%;
		 	margin-left: 0;
		}
	</style>
</head>
<body>
<p><br /></p>
	<div id="container">
		<div id="content">
			<div>
				<font size="10px;">계정 정보</font>
			</div><hr /><br />
			<div>
				<b><font size="5px;">성명(별명) |</font></b> <font size="6px;" color="#964b00" class="ml-3">${vo.name}&nbsp;(${vo.nick})</font>
			</div><hr /><br />
			<div>
				<b><font size="5px;">이메일 |</font></b> <font size="6px;" color="#964b00" class="ml-3">${vo.email}</font>
			</div><hr />
			<div>
				<b><font size="5px;">전화번호 |</font></b> <font size="6px;" color="#964b00" class="ml-3">${vo.tel}</font>
			</div>
		</div><!-- //#content -->	
	</div><!-- //#container -->
</body>
</html>