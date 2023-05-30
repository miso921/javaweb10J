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
	/* reset */
	html,body{width:100%;height:100%;}
	</style>
	<frameset cols="200px,*">
		<frame src="${ctp}/MemberMypageLeft.me" name="memberMypageLeft" frameborder="0" />
		<frame src="${ctp}/MemberMypageContent.me" name="memberMypageContent" frameborder="0" />
	</frameset>
</head>
</html>	