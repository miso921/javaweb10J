<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberEventRez.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  body {font-family: 'GmarketSansMedium';}
	</style>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class='container'>
	<h2 class="text-center">행 사 예 약</h2>
	<form name="myform" method="post" action="${ctp}/MemberEventRezOk.me?idx=${vos[0].idx}">
		<div class="form-control text-center">
			행사명 : ${vos[0].eventName}
		</div>
		<input type="hidden" name="eventName" id="eventName" value="${vos[0].eventName}" />
		<div class="form-control text-center">
			행사날짜
			<select name="rDate" id="rDate">
				<option value="" disabled selected>원하는 날짜를 선택하세요</option>
				<c:forEach var="vo" items="${vos}">
					<option>${fn:substring(vo.eDate,0,10)}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-control text-center">
			행사시간 : ${vos[0].eTime}
		</div>
		<input type="hidden" name="eTime" id="eTime" value="${vos[0].eTime}" />
		<div class="form-control text-center">
			예약인원
			<input type="number" name="rPeopleNum" id="rPeopleNum" />
		</div>
		<div class="text-center mt-5">
			<input type="submit" value="확인" class="btn btn-success btn-sm" />
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/MemberEventContent.me?idx=${vo.idx}';" class="btn btn-warning btn-sm" />
		</div>
	</form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>