<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mangerEventContent.jsp</title>
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
<div class='container'>
<p><br /></p>
	<h2 class="text-center"><b>행 사 정 보</b></h2><br />
		<div class="row border" style="height:400px">
			<div class="col mt-5">
				<c:set var="photo" value="${fn:split(vo.photo,'/')}" />
		    <img src="${ctp}/images/event/${photo[2]}" width="400px;" style="margin-left:90px" />
		    <div class="text-center mt-2 ml-4"><font size="6px;" class="text-center">${vo.eventName}</font></div> <!-- 행사명 -->
	    </div>
			<div class="col text-center mt-5">
				<font size="4px;">
					<div><b>분류&nbsp;|</b>&nbsp;${vo.part}</div><br />
					<div><b>시간&nbsp;|</b>&nbsp;${vo.eTime}</div><br />
					<div><b>예약인원/모집인원&nbsp;|</b>&nbsp;${vo.peopleNum} / ${vo.people}</div><br />
					<div><b>장소&nbsp;|</b>&nbsp;${vo.place}</div><br />
					<div><b>참여대상&nbsp;|</b>&nbsp;${vo.target}</div><br />
					<div><b>참가비&nbsp;|</b>&nbsp;${vo.money}</div><br />
				</font>
	    </div>
		</div>
		<div class="row border">
			<div class="col mt-5" colspan="2">
				<!-- <div class="text-center"><font size="5px">상세정보</font></div> -->
				<div class="text-center"><img src="${ctp}/images/event/${photo[1]}" width="600px;" /></div>
				<div class="text-center"><img src="${ctp}/images/event/${photo[0]}" width="600px;" /></div>
			</div>
		</div>
</div>
<p><br /></p>
</body>
</html>