<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerMainMenu.jsp</title>
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
		.container{position:absolute;top:0px;bottom:0px;width:100%;}
		.side{position:absolute;left:0;top:0px;bottom:0;width:200px;height:auto;padding:10px;overflow:auto;box-sizing:border-box;border-right:1px solid #ddd;background:#fff;}
		.btn{color:black;}
	</style>
</head>
<body>
<div class="container">
	<div class="side">
	  <div class="btn-group-vertical ml-5 mt-2">
	    <a href="${ctp}/"><font size="5px" color="black">홈</font></a>
	    <a href="${ctp}/ManagerMemberList.ma"><font size="5px" color="black">회원관리</font></a>
	    <div class="btn-group">
	      <div type="button" class="dropdown-toggle" data-toggle="dropdown"><font size="5px">
	        행사관리
	      </div></font>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="${ctp}/ManagerEventInput.ma">행사등록</a>
	        <a class="dropdown-item" href="${ctp}/ManagerEventList.ma">행사목록</a>
	      </div>
	    </div>
	  </div>
	</div>	  
</div>
</body>
</html>