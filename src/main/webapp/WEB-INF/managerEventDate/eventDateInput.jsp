<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventDateInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br /></p>
<div class="container">
  <h2 class="text-center mb-4">프로그램 날짜 등록</h2>
  <form name="myform" method="post" action="${ctp}/EventDateInputOk.mae" class="was-validated">
    <table class="table table-bordered">
      <tr>
        <th style="width:25%">프로그램명</th>
        <td style="width:75%">
        	<input type="text" name="eventName" value="${eventName}" class="form-control" />	
       	</td>
      </tr>
      <tr>
        <th>행사날짜</th>
        <td><input type="date" name="eDate" id="eDate" class="form-control" autofocus required /></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="submit" value="등록하기" class="btn btn-success"/> &nbsp;
          <input type="reset" value="다시입력" class="btn btn-info"/> &nbsp;
          <input type="button" value="돌아가기" onclick="location.href='${ctp}/ManagerEventList.ma';" class="btn btn-warning" />
        </td>
      </tr>
    </table>
    <br/>
  </form>
</div>
<p><br /></p>
</body>
</html>