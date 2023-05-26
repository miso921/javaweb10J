<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberEventAll.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'SUITE-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
	    font-weight: 400;
	    font-style: normal;
		}
		.container {
			font-family: 'SUITE-Regular';
		}
		.card-text {
			font-family: 'SUITE-Regular';		
			font-size: 20px;
		}
		#work2 {
			float: right;	
			margin-right: 50px;		
			margin-top: 5px;		
		}
		#work2 a:hover {
			text-decoration: none;
			color: #cfdd8e;
		}
		#en a:hover, #ed a:hover {text-decoration:none;}
	</style>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<jsp:include page="/WEB-INF/member/memberLogin.jsp" />
<p><br /></p>
<div class='container'>
<span><font size="5em">모집중<font color="red">${totRecCnt}</font>개</font></span>	
  <c:set var="cnt" value="0"/>
  <c:forEach var="i"  begin="1" end="5">
	  <div class="row">
	    <c:forEach begin="1" end="3">
	      <div class="col mt-3 mb-5">
			    <a href="${ctp}/MemberEventContent.me?idx=${vos[cnt].idx}">
				    <div class="border" style="width:300px; height: 350px;">
				      <c:set var="photo" value="${fn:split(vos[cnt].photo,'/')}"/>
				      <c:if test="${empty photo[2]}"><img src ="${ctp}/images/event/${photo[1]}" width="298px" height="220px"></c:if>
				      <c:if test="${!empty photo[2]}"><img src ="${ctp}/images/event/${photo[2]}" width="298px" height="220px"></c:if>
				     	<div class="card-body text-left">
				        <span id="en" class="card-text"><font color="black">${vos[cnt].eventName}</font></span>
				        <br /><font size="3em" color="black" id="ed">${fn:substring(vos[cnt].eDate,0,10)}</font>
				      </div>
				    </div>
			    </a>
				</div>
				<c:set var="cnt" value="${cnt + 1}"/>
		  </c:forEach>
	  </div>
  </c:forEach>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>