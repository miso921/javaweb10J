<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerMainLeft.jsp</title>
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
		body{position:relative;color:#000;font-family:'Pretendard-Regular';font-weight:bolder;}
		ul li a {
			color:black;
			font-size: 25px;
		}
		ul,ol{list-style:none}
		a:hover{text-decoration:none;}
		
		/* layout */
		#con{position:absolute;top:0px;bottom:0px;width:100%;}
		#aside{position:absolute;left:0;top:0;bottom:0;width:200px;padding:10px;overflow:auto;box-sizing:border-box;border-right:1px solid #ddd;background:#fff;}
	</style>
</head>
<body>
	<div id="con">
		<div id="aside">
			<div class="aside-menu">
				<ul class="mt-5 ml-4">
				<li id="home"><a href="http://192.168.50.90:9090/javaweb10J/">홈</a></li>
				<li class="mn"><a href="#">회원관리</a></li>
				<li class="mn"><a href="${ctp}/ManagerEvent.ma">행사관리</a></li>
				<li class="mn"><a href="#">예약관리</a></li>
				</ul>
			</div>
		</div><!-- //#aside -->
	</div><!-- //#con -->
</body>
</html>