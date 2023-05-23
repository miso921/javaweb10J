<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class='container'>
	<p><br /></p>
	<h2><b>행 사 정 보</b></h2><br />
	<div class="row border border-dark">
		<div class="col">${vo.photo[0]}</div>
	</div>
	<div class="row border border-dark">분류
		<div class="col">${vo.part}</div>
	</div>
	<div class="row border border-dark">행사명
		<div class="col">${vo.eventName}</div>
	</div>
	<div class="row border border-dark">시간
		<div class="col">${vo.eTime}</div>
	</div>
	<div class="row border border-dark">모집정원
		<div class="col">${vo.people}</div>
	</div>
	<div class="row border border-dark">참여인원
		<div class="col">${vo.peopleNum}</div>
	</div>
	<div class="row border border-dark">장소
		<div class="col">${vo.place}</div>
	</div>
	<div class="row border border-dark">참여대상
		<div class="col">${vo.target}</div>
	</div>
	<div class="row border border-dark">참가비
		<div class="col">${vo.money}</div>
	</div>
	<div class="row border border-dark">상세내용
		<div class="col">${vo.photo[1]}</div>
	</div>
	<div class="row border border-dark">오시는길
		<div class="col">${vo.photo[2]}</div>
	</div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>