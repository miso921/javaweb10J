<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberUpdate.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js/woo.js"></script>
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
	    	
	  .container {
	  	width : 24%;
	  }  
	  
	  .form-group{
	  	text-align:left;
	  	font-size:1.1em;
	  }
	</style>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class="container" style="text-align:center;">
  <form name="myform" method="post" action="${ctp}/MemberUpdateOk.me">
  <h2 class="text-center mb-5"><b>회 원 정 보 수 정</b></h2>
    <div class="form-group">
    	아이디 : ${sMid}
    </div>	
    <div class="form-group">
      <label for="nick"><span style="color:red">*</span>닉네임&nbsp;<input type="button" value="닉네임중복확인" id="nickBtn" class="btn btn-info btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" name="nick" id="nick" value="${sNick}" placeholder="닉네임을 입력하세요" required />
    </div><br />
    <div class="form-group">
      <label for="birthday">생년월일</label>
      <input type="date" class="form-control" name="birthday" id="birthday"  value="${birthday}" />
    </div><br />
    <div class="form-group">
    		<label for="address">주소</label>
    		<div class="input-group mb-1">
      		<input type="text" name="postcode" id="sample6_postcode" value="${postcode}" placeholder="우편번호" class="form-control">
      		<div class="input-group-append">
        		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
      		</div>
    		</div>
    		<input type="text" name="roadAddress" id="sample6_address" value="${roadAddress}" size="50" placeholder="주소" class="form-control mb-1">
    		<div class="input-group mb-1">
       		<input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" placeholder="참고항목" class="form-control"> &nbsp;&nbsp;
      			<div class="input-group-append">
      				<input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" placeholder="상세주소" class="form-control">
      			</div>
    		</div>
  		</div><br />
  		<div class="form-group">
    		<div class="input-group mb-3">
      		<div class="input-group-prepend">
        		<span class="input-group-text mr-2"><span style="color:red">*</span>전화번호 :</span>
          		<select name="tel1" class="custom-select required mr-2">
            		<option value="010" selected>010</option>
              <option value="02">서울</option>
              <option value="031">경기</option>
              <option value="032">인천</option>
              <option value="041">충남</option>
              <option value="042">대전</option>
              <option value="043">충북</option>
              <option value="051">부산</option>
              <option value="052">울산</option>
              <option value="061">전북</option>
              <option value="062">광주</option>
          		</select>-
      		</div>
	        <input type="text" name="tel2" value="${tel2}" size=4 maxlength=4 class="form-control ml-2 mr-2"/>-
	        <input type="text" name="tel3" value="${tel3}" size=4 maxlength=4 class="form-control ml-2"/>
    		</div>
  		</div><br />
  		<div class="form-group">
    		<label for="email1">이메일</label>
      		<div class="input-group mb-3">
        		<input type="text" class="form-control" placeholder="이메일을 입력하세요" id="email1" name="email1" value="${email1}" required />&nbsp;
        		<div class="input-group-append">
          		<select name="email2" class="custom-select">
              <option value="naver.com"   <c:if test="${email2=='naver.com'}">selected</c:if>>naver.com</option>
              <option value="hanmail.net" <c:if test="${email2=='hanmail.net'}">selected</c:if>>hanmail.net</option>
              <option value="hotmail.com" <c:if test="${email2=='hotmail.com'}">selected</c:if>>hotmail.com</option>
              <option value="gmail.com"   <c:if test="${email2=='gmail.com'}">selected</c:if>>gmail.com</option>
              <option value="nate.com"    <c:if test="${email2=='nate.com'}">selected</c:if>>nate.com</option>
              <option value="yahoo.com"   <c:if test="${email2=='yahoo.com'}">selected</c:if>>yahoo.com</option>
          		</select>
        		</div>
      		</div>
  		</div><br />
  		<div class="form-group">
    		<div class="form-check-inline">
      		<span class="input-group-text">성별 :</span> &nbsp; &nbsp;
      			<label class="form-check-label">
        			<input type="radio" class="form-check-input" name="gender" value="미선택" <c:if test="${vo.gender=='미선택'}">checked</c:if>>미선택
      			</label>
    		</div>
    		<div class="form-check-inline">
    			<label class="form-check-label">
        		<input type="radio" class="form-check-input" name="gender" value="남자" <c:if test="${vo.gender=='남자'}">checked</c:if>>남자
      		</label>
    		</div>
    		<div class="form-check-inline">
    			<label class="form-check-label">
        		<input type="radio" class="form-check-input" name="gender" value="여자" <c:if test="${vo.gender=='여자'}">checked</c:if>>여자
      		</label>
    		</div>
  		</div><br />
    <div class="form-group text-center">
    	<button type="button" onclick="fCheck()" class="btn btn-primary mr-1">확인</button>
    	<button type="reset" class="btn btn-warning mr-1">다시입력</button>
    	<button type="button" onclick="location.href='${ctp}/';" class="btn btn-danger mr-1">돌아가기</button>
    </div>
    <input type="hidden" name="address"/>
    <input type="hidden" name="email"/>
    <input type="hidden" name="tel"/>
  </form>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
<script>
    'use strict';
    // 아이디와 닉네임 중복버튼을 클릭했는지의 여부를 확인하기위한 변수(버튼 클릭후에는 내용 수정처리 못하도록 처리)
    let idCheckSw = 0;
    let nickCheckSw = 0;
   	let submitFlag = 0;		// 모든 체크가 정상으로 종료되게되면 submitFlag는 1로 변경처리될수 있게 한다.
    
    function fCheck() {
    	// 유효성 검사.....
    	// 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
    	
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;
    	let regPwd = /^(?=.*[0-9])(?=.*[a-zA-Z]).{8,20}$/;
      let regNick = /^[가-힣]+$/;
      
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
    	
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value;
    	let nick = myform.nick.value;
    	
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	
    	// 앞의 정규식으로 정의된 부분에 대한 유효성체크
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 밑줄(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	//else if(!regPwd.test(pwd)) {
      //  alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
      //  myform.pwd.focus();
      //  return false;
      //}
      else if(!regNick.test(nick)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myform.email1.focus();
        return false;
      }
      else {
    	  submitFlag = 1;
      }
   	
    	if(tel2 != "" && tel3 != "") {
    	  if(!regTel.test(tel)) {
	    		alert("전화번호형식을 확인하세요.(000-0000-0000)");
	    		myform.tel2.focus();
	    		return false;
    	  }
    	  else {
    		  submitFlag = 1;
    	  }
    	}
    	else {		// 전화번호를 입력하지 않을시 DB에는 '010- - '의 형태로 저장하고자 한다.
    		tel2 = " ";
    		tel3 = " ";
    		tel = tel1 + "-" + tel2 + "-" + tel3;
    		submitFlag = 1;
    	}
    	
    	// 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
    	let postcode = myform.postcode.value + " ";
    	let roadAddress = myform.roadAddress.value + " ";
    	let detailAddress = myform.detailAddress.value + " ";
    	let extraAddress = myform.extraAddress.value + " ";
  		myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
    	
    	// 전송전에 모든 체크가 끝나면 submitFlag가 1로 되게된다. 이때 값들을 서버로 전송처리한다.
    	if(submitFlag == 1) {
    		if(idCheckSw == 0) {
    			alert("아이디 중복체크버튼을 눌러주세요!");
    			document.getElementById("midBtn").focus();
    		}
    		else if(nickCheckSw == 0) {
    			alert("닉네임 중복체크버튼을 눌러주세요!");
    			document.getElementById("nickBtn").focus();
    		}
    		else {
	    		myform.email.value = email;
	    		myform.tel.value = tel;
	    		
		    	myform.submit();
    		}
    	}
    	else {
    		alert("회원가입 실패! 내용을 확인하세요.");
    	}
    }	
    
/* ========================================================= */   	
   	
    // 이름 valid 체크
    function vNameCheck() {
    let regName = /^[가-힣a-zA-Z]{1,10}$/;
    let name = myform.name.value;
    let nameInput = document.getElementById("name");
    
    	if(!regName.test(name)) {
      	$("#nameOk").hide();
      	$("#nameError").show();
   		  submitFlag = 1;
      }
    	else {
      	$("#nameOk").show();
      	$("#nameError").hide();
    	}
    }
    
    
    // 비밀번호 valid 체크
    function vPwdCheck() {
	    let regPwd = /^(?=.*[0-9])(?=.*[a-zA-Z]).{8,20}$/;
	    let pwd = myform.pwd.value;
	    let pwdInput = document.getElementById("pwd");
	    
    	if(regPwd.test(pwd)) {
    		$("#pwdOk").show();
    		$("#pwdError").hide();
      }
    	else {
    		$("#pwdOk").hide();
    		$("#pwdError").show();
    		submitFlag = 1;
    	}
    }

    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	let url = "${ctp}/MemberIdCheck.me?mid="+mid;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else {
    		idCheckSw = 1;
    		myform.mid.readOnly = true;
    		window.open(url,"nWin","width=580px,height=250px");
    	}
    }
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nick = myform.nick.value;
    	let url = "${ctp}/MemberNickCheck.me?nick="+nick;
    	
    	if(nick.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		myform.nick.focus();
    	}
    	else {
    		nickCheckSw = 1;
    		myform.nick.readOnly = true;
    		window.open(url,"nWin","width=580px,height=250px");
    	}
    }
</script>
</body>
</html>