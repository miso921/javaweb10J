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
		ul {list-style:none}
		a:hover {
			text-decoration:none;
			cursor : pointer;
		}
		
		/* layout */
		#container{position:absolute;top:0px;bottom:0px;width:100%;}
		#aside{position:absolute;left:0;top:0px;bottom:0;width:200px;padding:10px;overflow:auto;box-sizing:border-box;border-right:1px solid #ddd;background:#fff;padding-top:100px;}
	</style>
</head>
<body>
	<div id="container">
		<div id="aside">
			<div class="aside-menu">
				<ul class="mt-5 ml-4">
				<li id="home"><a href="${ctp}/">홈</a></li>
				<li class="mn"><a href="#">회원관리</a></li>
					<div class="dropdown">
							<div class="dropdown-menu">
				        <a class="dropdown-item" href="${ctp}/ManagerEventInput.ma">행사등록</a>
				        <a class="dropdown-item" href="${ctp}/managerEventList.ma">행사목록</a>
			      	</div>
					</div>
				<li class="mn"><a href="#">예약관리</a></li>
				</ul>
			</div>
		</div><!-- //#aside -->
	</div><!-- //#con -->
</body>
</html>