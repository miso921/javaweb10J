<!-- nav.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
	@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
	}
	.box-wrap {
		display : flex;
		height : 100%;
		background-color : white;
		justify-content : center;
	} 
	.box {
		width : 100px;
		height : 100px;
		/* background : ivory;
		border : 1px solid #000; */
		margin : 5px;
		position : relative;
	}
	.box-obj, .box-sObj {
		position: relative; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%, -50%);
		text-align: center;
	}
	.box-obj a {font-family:'RIDIBatang';font-size:20px;color:black;}
	.box-sObj a {font-family:'SUITE-Regular';font-size:20px;color:black;}
	.box-obj a:hover, #modal:hover {cursor:pointer;text-decoration:none;color:#cca9dd;}
	.box-sObj a:hover {cursor:pointer;text-decoration:none;color:#80b463;}
	/* #obj1 {margin-right:400px;} */
	/*#obj2, #obj3, #obj4 {
		margin-left: auto;
		margin-right: auto;
 	}
	#obj5, #obj6 {} */
</style>
	<body>
		<div class="box-wrap sticky-top">
			<div class="box" id="obj1">
				<div class="box-obj"><a href="${ctp}/"><img src = "images/nav/프로젝트로고.png" width="70px" height="auto" /></a></div>
			</div>
			<div class="box" id="obj2">
				<div class="box-obj" id="obj2"><a href="${ctp}/MemberEventAll.me">활동</a></div>
			</div>
			<div class="box" id="obj3">
				<div class="box-obj" id="obj3"><a href="${ctp}/Review.re">후기</a></div>
			</div>
			<div class="box" id="obj4">
				<div class="box-obj" id="obj4"><a href="${ctp}/Query.qu">문의</a></div>
			</div>
			<c:if test="${sMid == null}">
				<div class="box" id="obj6">
					<div class="box-sObj"><a id="modal" data-toggle="modal" data-target="#myModal">로그인</a></div>
				</div>
			</c:if>	
			<c:if test="${sMid != null}">
				<div class="box" id="obj7">
					<div class="box-sObj"><a href="${ctp}/MemberLogout.me">로그아웃</a></div>
				</div>
				<div class="box" id="obj8">
					<div class="box-sObj"><a href="${ctp}/MemberMypageMain.me" id="sMid">${sMid}<br />${sNick}</a></div>
				</div>
			</c:if>	
			<c:if test="${sLevel == 0}">
				<div class="box" id="obj9">
					<div class="box-obj"><a href="${ctp}/ManagerMain.ma"><i class="fa-solid fa-user-gear fa-xl"></i></a></div>
				</div>
			</c:if>
			<div class="box" id="obj5">
				<div class="box-obj" id="obj5"><a href="#"><i class="fa fa-search"></i></a></div>
			</div>
		</div>
	</body>
