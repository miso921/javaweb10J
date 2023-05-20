<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>eventVolun.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class='container'>
<span><font id="work1" size="5em">모집 중</font></span>
	<div class="card-columns">
    <div class="card" style="width: 300px; height: 350px;">
    	<img src="images/book.jpg" width="294px" height="220px" />
      <div class="card-body text-left">
        <span class="card-text">어린이와 어른을 위한'동화책'<br />만들기</span>
        <br /><font size="3em">2023.05.31</font>
      </div>
    </div>
    <div class="card" style="width: 300px; height: 350px;">
    	<img src="images/umb.png" width="296px" height="220px"/>
      <div class="card-body text-left">
        <span class="card-text">아이들을 위한 안전우산 만들기<br />봉사활동</span>
        <br /><font size="3em">2023.05.15 외 43회</font>
      </div>
    </div>
    <div class="card" style="width: 300px; height: 350px;">
    	<img src="images/pic.jpg" width="295px" height="220px"/>
      <div class="card-body text-left">
        <span class="card-text">세계피자월드컵 2위 레시피의<br />나폴리피자 클래스</span>
        <br /><font size="3em">2023.05.31</font>
      </div>
    </div>
    <div class="card" style="width: 300px; height: 350px;">
    	<img src="images/pizza.jpg" width="295px" height="220px"/>
      <div class="card-body text-left">
        <span class="card-text">세계피자월드컵 1위 레시피의<br />나폴리피자 클래스</span>
        <br /><font size="3em">2023.05.31</font>
      </div>
    </div>
    <div class="card" style="width: 300px; height: 350px;">
    	<img src="images/pizza.jpg" width="295px" height="220px"/>
      <div class="card-body text-left">
        <span class="card-text">세계피자월드컵 4위 레시피의<br />나폴리피자 클래스</span>
        <br /><font size="3em">2023.05.31</font>
      </div>
    </div>
    <div class="card" style="width: 300px; height: 350px;">
    	<img src="images/pizza.jpg" width="295px" height="220px"/>
      <div class="card-body text-left">
        <span class="card-text">세계피자월드컵 5위 레시피의<br />나폴리피자 클래스</span>
        <br /><font size="3em">2023.05.31</font>
      </div>
    </div>
  </div>	
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>