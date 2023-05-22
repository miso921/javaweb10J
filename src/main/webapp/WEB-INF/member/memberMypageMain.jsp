<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMypage.jsp</title>
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
	#content{position:absolute;top:120px;bottom:0;left:220px;right:0;padding:10px;overflow:auto;}
	</style>
</head>
<body>
	<div id="container">
	<jsp:include page="/include/nav.jsp" />
	<jsp:include page="/include/memberMypageMenu.jsp" />
		<div id="content"> <!-- style="text-align: center;" -->
			<div>
				계정 정보
			</div><hr /><br />
			<div>
				닉네임 | ${nick}
			</div><hr /><br />
			<div>
				이메일 | ${email}
			</div><hr />
			<div>
				전화번호 | ${tel}
			</div>
		</div><!-- //#content -->
	</div><!-- //#container -->
</body>
</html>