<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerLeft.jsp</title>
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
		#collapseOne {
			background-color:white;
		}
		a:hover {
			text-decoration: none;
		}
	</style>
</head>
<p><br /></p>
<body style="background-color:#ece6cc;">
<div class="text-center card-hover" id="accordion">
  <h2><a href="${ctp}/MemberMypageMain.me"><font color="black">나의페이지</font></a></h2>
  <hr/>
  <p><a href="${ctp}/" target="_top"><font size="4em;" color="black">홈</font></a></p>
  <hr/>
  <p><a href="${ctp}/MemberMypageRez.me" target="memberMypageContent"><font size="4em;" color="black">내예약확인</font></a></p>
  <hr/>
  <div class="card">
  	<div class="card-header m-0 p-2">
			<a class="card-link" data-toggle="collapse" href="#collapseOne">
				<font size="4em;" color="black">
					내정보관리
				</font>	
			</a>  	
  	</div>
  	<div id="collapseOne" class="collapse" data-parent="#accordion">
  		<div class="card-body m-2 p-1">
  			<a href="${ctp}/MemberPwdCheckForm.me" target="memberMypageContent"><font size="3em;" color="black">회원정보수정</font></a>
  		</div>
  		<div class="card-body m-2 p-1">
  			<a href="${ctp}/MemberPwdUpdate.me" target="memberMypageContent"><font size="3em" color="black">비밀번호수정</font></a>
	  		</div>
	  	</div>
	  </div>
</div>
</body>
<p><br /></p>
</html>