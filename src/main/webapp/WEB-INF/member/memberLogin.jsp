<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<jsp:include page="/include/bs4.jsp" />
<style>
	@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	#myModal {
  	font-family: 'RIDIBatang';
  }
	
	#f1, #f2 {
		float: left;
		margin-right: 20px;
	}
	
	#f1 a:hover, #f2 a:hover {
		text-decoration: none;
		color: #cfdd8e;	
	}
	
</style>

<script>
	'use strict';
	
	function loginCheck() {
		let mid = $("#mid").val();
		let pwd = $("#pwd").val();
		let idSave = $("#idSave").val();
		
		if(mid.trim()=="" || pwd.trim()=="") {
			alert("아이디 혹은 비밀번호를 입력해주세요!");
			return false;
		}
		$.ajax({
			type : "post",
			url  : "${ctp}/MemberLoginOk.me",
			data : {mid:mid, pwd:pwd, idSave:idSave},
			success : function(res) {
			/* let jMid = data.jMid; */
			/* 
			let mid2 = vo.mid;
				if(mid == vo.mid) {
					alert("로그인에 성공했습니다!");
				}
				else {
					alert(res);
				}
			},
			 */
			  if(res == "1") {
				  alert("로그인 되었습니다.");
				  location.href = "${ctp}/";
			  }
			  else {
				  alert("로그인 실패~~");
			  }
		  },
			error: function() {
				alert("전송오류..");				
			}
		});
	}
</script>
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-4">
      <!-- Modal Header -->
      <div class="modal-header">
        <h2 class="modal-title text-center">로 그 인</h2>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
      	<div class="form-group">
      		<form name="myform" method="post">
    				<div class="form-group">
	      			<label for="mid">아이디</label>
	      				<span id=idSave><input type="checkbox" name="idSave" class="ml-4">&nbsp;아이디저장</span>
      						<input type="text" class="form-control borederless" name="mid" id="mid" value="${cMid}" placeholder="아이디를 입력하세요." required autofocus />
      			</div>
    				<div class="form-group">
	      			<label for="pwd">비밀번호</label>
	      				<input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." required />
	      		</div>
	        	<div id="f1" class="text-left"><a href="${ctp}/" style="color: black; font-size: 1em; text-align:left">아이디찾기</a></div><br />
	        	<div id="f2" class="text-left"><a href="${ctp}/" style="color: black; font-size: 1em;">비밀번호찾기</a></div>
	          <button type="button" onclick="loginCheck()" class="btn btn-outline-success mr-1">로그인</button>
	          <button type="button" class="btn btn-outline-primary" onclick="location.href='${ctp}/MemberJoin.me';">회원가입</button>
	      	</form>	
	      </div>
	    </div>		
	  </div>
	</div>
</div>