<!-- nav.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		font-size: 1.3em;
  }
  
	.navbardrop:hover, .dropdown-item:hover, .nav-link:hover  {
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

/* 	#n1 {
		justify-content: flex-start;
	}
	
	#n2 {
		justify-content: flex-end;
	} */

</style>

<nav class="navbar navbar-expand-sm navbar-light sticky-top">
  <!-- Brand -->
  <a class="navbar-brand" href="${ctp}/"><img src = "images/nav/프로젝트로고.png" width="70px" height="auto" class="logo"/></a>
  <!-- Links -->
  <div id="nb1">
	  <ul class="navbar-nav">
	    <!-- Dropdown -->
	    <li class="nav-item dropdown">
	      <a class="nav-link" id="navbardrop" data-toggle="dropdown">
	        활동
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="${ctp}/WorkVolun.wo">봉사활동</a>
	        <a class="dropdown-item" href="${ctp}/WorkActive.wo">체험활동</a>
	      </div>
	    </li>
	    <li class="nav-item justify-content-center">
	      <a class="nav-link" href="${ctp}/WorkVolun.wo" id="nb1">후기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#" id="nb2">문의</a>
	    </li>
	  </ul>  
    </div>
    <div>
	  <ul class="navbar-nav" id="n2">
	    <li class="nav-item">
	      <a class="nav-link" href="#"><i class="fa fa-search"></i>검색</a>
	    </li>
	  	<c:if test="${sMid == null}">	
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="modal" data-target="#myModal">로그인</a>
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

