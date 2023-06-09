<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberPwdUpdate.jsp</title>
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
    	let regPwd = /^(?=.*[0-9])(?=.*[a-zA-Z]).{8,20}$/;
    	
    	let oldPwd = document.getElementById("oldPwd").value;
    	let newPwd = document.getElementById("newPwd").value;
    	let rePwd  = $("#rePwd").val();
    	
    	if(oldPwd.trim() == "") {
    		alert("기존 비밀번호를 입력하세요!");
    		document.getElementById("oldPwd").focus();
    	}
    	else if(newPwd.trim() == "") {
    		alert("새 비밀번호를 입력하세요!");
    		document.getElementById("newPwd").focus();
    	}
    	else if(rePwd.trim() == "") {
    		alert("새 비밀번호를 한번더 입력하세요!");
    		document.getElementById("rePwd").focus();
    	}
    	else if(!regPwd.test(newPwd)) {
    		alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
    		document.getElementById("newPwd").focus();
    	}
    	else if(newPwd != rePwd) {
    		alert("새 비밀번호와 동일한 비밀번호를 입력해 주세요");
    		document.getElementById("rePwd").focus();
    	}
    	else if(newPwd == oldPwd) {
    		alert("기존비밀번호와 새 비밀번호가 동일합니다. 변경 후 진행하세요.");
    		document.getElementById("newPwd").focus();
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
  <form name="myform" method="post" action="${ctp}/MemberPwdUpdateOk.me" class="was-validated">
    <h2 class="text-center">비밀번호 변경</h2>
    <br/>
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <table class="table table-bordered">
          <tr>
            <th id="op">기존 비밀번호</th>
            <td>
              <input type="password" name="oldPwd" id="oldPwd" autofocus required class="form-control-md"/>
              <div class="invalid-feedback">기존 비밀번호를 입력하세요.</div>
            </td>
          </tr>
          <tr>
            <th id="np">새 비밀번호</th>
            <td>
              <input type="password" name="newPwd" id="newPwd" required class="form-control-md"/>
              <div class="invalid-feedback">새 비밀번호를 입력하세요.</div>
            </td>
          </tr>
          <tr>
            <th id="npo">비밀번호 확인</th>
            <td>
              <input type="password" name="rePwd" id="rePwd" required class="form-control-md"/>
              <div class="invalid-feedback">새 비밀번호를 한번 더 입력해 주세요.</div>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <input type="button" value="비밀번호 변경" onclick="fCheck()" class="btn btn-success mr-2"/>
              <input type="reset" value="다시 입력" class="btn btn-warning mr-2"/>
              <input type="button" value="돌아가기" onclick="location.href='${ctp}/MemberMain.mem';" class="btn btn-secondary"/>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>