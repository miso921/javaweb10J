<!-- nav.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
	@font-face {
		font-family: 'RIDIBatang';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	nav.navbar {
		font-family: 'RIDIBatang';
		font-size: 1.5em;
	}
	a:hover {
		text-decoration: none;
		color: #96648f;
		cursor: pointer;
	}
	.navbar {
		background-color: white;
	}
	#sMid:hover {
		text-decoration: none;
		color: red;
	}
/* 	#navbar-brand {
		justify-content: flex-start;
	}
	#n2 {
		justify-content: flex-end;
	} */
	#n1, #n2, #n3 {
		justify-content: center;
	}
</style>
<nav class="navbar navbar-expand-sm navbar-light sticky-top">
<!-- Brand -->
<a class="navbar-brand" href="${ctp}/"><img src = "images/nav/프로젝트로고.png" width="70px" height="auto" class="logo"/></a>
<!-- Links -->
<div id="nb1">
<ul class="navbar-nav">
<!-- Dropdown -->
<li class="nav-item dropdown">
<li class="nav-item justify-content-center">
<a class="nav-link" id="n1" href="${ctp}/MemberEventList.me" id="nb1">활동</a>
</li>
<li class="nav-item">
<a class="nav-link" id="n2" href="${ctp}/Review.re" id="nb1">후기</a>
</li>
<li class="nav-item">
<a class="nav-link" id="n3" href="${ctp}/Query.qu" id="nb2">문의</a>
</li>
</ul>
</div>
<div>
<ul class="navbar-nav">
<li class="nav-item">
<a class="nav-link" id="n4" href="#"><i class="fa fa-search"></i></a>
</li>
<c:if test="${sMid == null}">
<li class="nav-item">
<a class="nav-link" data-toggle="modal" data-target="#myModal" id="n5">로그인</a>
</li>
</c:if>
<c:if test="${sMid != null}">
<li class="nav-item">
<a class="nav-link" href="${ctp}/MemberLogout.me">로그아웃</a>
</li>
<div>
<a href="MemberMypageMain.me" id="sMid"><font color="white;">${sMid}(${sNick})</font></a>님, 로그인 중
</div>
</c:if>
<c:if test="${sLevel == 0}">
<li class="nav-item">
<a class="nav-link" href="${ctp}/ManagerMain.ma">관리자메뉴</a>
</li>
</c:if>
</ul>
</div>
</nav>