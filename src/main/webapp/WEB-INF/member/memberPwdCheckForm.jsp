<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberPwdCheckForm.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  @font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
		}
	  body {
    font-family: 'GmarketSansMedium';
    width: 100%;
	  }  
  </style>
  <script>
    'use strict';
    
    function fCheck() {
    	let pwd  = document.getElementById("pwd").value;
    	
    	if(pwd.trim() == "") {
    		alert("비밀번호를 입력하세요!");
    		document.getElementById("pwd").focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
  <p><br/></p>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <form name="myform" method="post" action="${ctp}/MemberPwdCheckOk.me" class="was-validated">
          <h2 class="text-center">비밀번호확인</h2>
          <br/>
          <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" name="pwd" id="pwd" autofocus required class="form-control"/>
            <div class="invalid-feedback">비밀번호를 입력하세요.</div>
          </div>
          <div class="text-center">
            <input type="button" value="비밀번호확인" onclick="fCheck()" class="btn btn-success mr-2"/>
            <input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
            <input type="button" value="돌아가기" onclick="location.href='${ctp}/MemberMypageMain.me';" class="btn btn-secondary"/>
          </div>
        </form>
      </div>
    </div>
  </div>
  <p><br/></p>
</body>
</html>