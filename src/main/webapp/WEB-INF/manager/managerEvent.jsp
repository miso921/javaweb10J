<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEvent.jsp</title>
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
		body{position:relative;color:#000;font-family:'Pretendard-Regular';}
		
		/* layout */
		#container{position:absolute;top:0px;bottom:0px;width:100%;}
		#content{position:absolute;top:0;bottom:0;left:440px;right:0;padding:10px;overflow:auto;}
	</style>
</head>
<body>
<!-- <div class="container"> -->
	<div>
		<jsp:include page="/include/managerMainMenu.jsp" />
	</div>	
	<div id="content" class="form-control borderless">
		<form name="eventForm" method="post" action="">
			<div>
				행사명<br />
				<input type="text" name="eName" id="eName" autofocus required class="form-control borderless" />
			</div>
			<div>
				행사시간<br />
				<input type="time" name="eTime" id="eTime" required class="form-control" />
			</div>
			<div>
				표 개수<br />
				<input type="text" name="ticketNum" id="ticketNum" required class="form-control" />
			</div>
			<div>
				장소<br />
				<input type="text" name="place" id="place" required class="form-control" />
			</div>
			<div>
				참여 대상<br />
				<input type="text" name="target" id="target" class="form-control" />
			</div>
			<div>
				참여가능 인원<br />
				<input type="text" name="people" id="people" class="form-control" />
			</div>
			<div>
				참가비<br />
				<input type="text" name="money" id="money" class="form-control" />
			</div>
			<div>
				분류<br />
				<input type="text" name="part" id="part" required class="form-control" />
			</div>
			<div>
				행사 사진<br />
				<input type="text" name="photo" id="photo" required class="form-control" />
			</div>
			<div>
				상세내용<br />
				<input type="text" name="detail" id="detail" class="form-control" />
			</div>
			<div>
				오시는 길<br />
				<input type="text" name="road" id="road" class="form-control" />
			</div>
			<div>
				<input type="submit" value="확인" class="btn btn-success" />
				<input type="reset" value="재입력" class="btn btn-danger" />
			</div>
		</form>	
	</div><!-- //#content -->
<!-- </div> -->		
</body>
</html>