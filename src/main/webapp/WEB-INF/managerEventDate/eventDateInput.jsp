<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventDateInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  body {font-family: 'GmarketSansMedium';}
		#eTime {margin-left:-60px;}
	</style>
</head>
<body>
<p><br /></p>
<div class="container">
	<div id="content" class="text-center">
		<h2 class="text-center mb-5"><font size="15px;"><b>날 짜 등 록</b></font></h2>
		<form name="myform" method="post" action="${ctp}/EventDateInputOk.mae">
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span class="font-weight-bold mr-3">행사명</span>
				<input type="text" name="eventName" value="${eventName}" id="eventName" class="form-control-md mb-2" />
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span id="eTime" class="font-weight-bold mr-1">행사시간</span>
				<input type="date" name="eDate" id="eDate" autofocus required class="form-control-md" />
			</div>
			<div class="justify-content-center d-flex">
				<input type="submit" value="확인" class="btn btn-success mr-2" />
				<input type="reset" value="재입력" class="btn btn-warning mr-2" />
				<input type="button" value="돌아가기" onclick="location.href	='${ctp}/';" class="btn btn-danger" />
			</div>
		</form>	
	</div><!-- //#content -->
</div>		
<p><br /></p>
</body>
</html>