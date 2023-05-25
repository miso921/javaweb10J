<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
		body{font-family:'Pretendard-Regular';}
	</style>
</head>
<body>
<div class='container'>
<p><br /></p>
	<h2 class="text-center"><b>행 사 정 보</b></h2><br />
		<div class="table-responsive">
	  <table class="table table-bordered">
      <tr>
        <th>사진</th>
        <c:set var="photo" value="${fn:split(vo.photo,'/')}" />
	      <td><img src="${ctp}/images/event/${photo[2]}" width="150px;" /></td>
	    </tr>
	    <tr>
        <th>분류</th>
        <td>${vo.part}</td>
	    </tr>
	    <tr>
        <th>행사명</th>
        <td>${vo.eventName}</td>
	    </tr>
	    <tr>
        <th>시간</th>
        <td>${vo.eTime}</td>
	    </tr>
	    <tr>
        <th>모집인원</th>
        <td>${vo.people}</td>
	    </tr>
	    <tr>
        <th>예약인원</th>
        <td>${peopleNum}</td>
	    </tr>
	    <tr>
        <th>장소</th>
        <td>${vo.place}</td>
	    </tr>
	    <tr>
        <th>참여대상</th>
        <td>${vo.target}</td>
	    </tr>
	    <tr>
        <th>참가비</th>
        <td>${vo.money}</td>
	    </tr>
	    <tr>
        <th>상세정보</th>
        <td><img src="${ctp}/images/event/${photo[1]}" width="150px;" /></td>
	    </tr>
	    <tr>
        <th>오시는길</th>
        <td><img src="${ctp}/images/event/${photo[0]}" width="150px;" /></td>
      </tr>
	  </table>
	</div>
</div>
<p><br /></p>
</body>
</html>