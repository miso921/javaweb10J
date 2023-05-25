<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberEventContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
		body{font-family:'Pretendard-Regular';}
		#photo {margin-top:70px;}
		#eName {margin-top:20px;margin-left:50px;}
		#eInfo {margin-top:100px;}
	</style>
</head>
<body>
<div class='container'>
<p><br /></p>
	<h2 class="text-center"><b>행 사 정 보</b></h2><br />
		<input type="button" value="예약" onclick="location.href='${ctp}/MemberEventRez.mer?idx=${vo.idx}';" class="btn btn-success mb-2" />
		<div class="row border" style="height:550px">
			<div id="photo" class="col">
				<c:set var="photo" value="${fn:split(vo.photo,'/')}" />
				<c:if test="${empty photo[2]}"><img src="${ctp}/images/event/${photo[1]}" width="400px;" style="margin-left:90px" /></c:if>
				<c:if test="${!empty photo[2]}"><img src="${ctp}/images/event/${photo[2]}" width="400px;" style="margin-left:90px" /></c:if>
		    <div id="eName" class="text-center"><font size="6px;" class="text-center"><${vo.eventName}></font></div> <!-- 행사명 -->
	    </div>
			<div id="eInfo" class="col text-center">
				<font size="4px;">
					<div><b>분류&nbsp;|</b>&nbsp;${vo.part}</div><br />
					<div><b>시간&nbsp;|</b>&nbsp;${vo.eTime}</div><br />
					<div><b>예약인원/모집인원&nbsp;|</b>&nbsp;<font color="red">${vo.peopleNum}</font> / ${vo.people}</div><br />
					<div><b>장소&nbsp;|</b>&nbsp;${vo.place}</div><br />
					<div><b>참여대상&nbsp;|</b>&nbsp;${vo.target}</div><br />
					<div><b>참가비&nbsp;|</b>&nbsp;${vo.money}</div><br />
				</font>
	    </div>
		</div>
		<div class="row border">
			<div class="col mt-3" colspan="2">
				<div class="text-center"><font size="5px"><b>상세정보</b></font></div><hr />
				<div class="text-center"><img src="${ctp}/images/event/${photo[1]}" width="1000px;" /></div><hr />
				<div class="text-center"><font size="5px"><b>오시는길</b></font></div><hr />
				<div class="text-center"><img src="${ctp}/images/event/${photo[0]}" width="1000px;" /></div>
			</div>
		</div>
</div>
<p><br /></p>
</body>
</html>