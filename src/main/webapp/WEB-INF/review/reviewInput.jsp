<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>reviewInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  body {font-family: 'GmarketSansMedium';}
  </style>
  <script>
  	'use strict';
  	
  	let cnt = 1;
 		// 동적폼(파일 업로드 박스 추가하기)
  	function fileBoxAppend() {
  		cnt++;
    	let fileBox = '';
    	fileBox += '<div id="fBox'+cnt+'" class="d-flex align-items-center justify-content-center font-weight-bold mb-2">'+cnt+'.';
    	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file-md border mb-2" style="float:left;" />';
    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger btn-sm ml-2 mb-2" style="width:10%;" />';
    	fileBox += '';
    	fileBox += '</div>';
    	$("#fileBoxAppend").append(fileBox);
    }	
 		
 		// 추가된 파일박스 삭제처리
    function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    	cnt--;
    }
  		
 		// 파일 확인
  	function fCheck() {
  		let fName1 = $("#fName1").val();
			let maxSize = 1024 * 1024 * 50 // 최대 50MByte 허용
		
			/* if(fName1.trim() == "") {
				alert("업로드할 파일명을 선택하세요!");
				return false;
			} */
			
		// 파일 사이즈 처리..
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
    		let imsiName = 'fName' + i;
    		if(isNaN(document.getElementById(imsiName))) {
    			let fName = document.getElementById(imsiName).value;
    			if(fName != "") {
    				fileSize += document.getElementById(imsiName).files[0].size;
    				let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();
    				if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "HWP" && ext != "PPT" && ext != "PPTX" && ext != "PDF" && ext != "JPEG") {
    					alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt' 파일입니다.");
    					return false;
    				}
    			}
    		}
    	} 
  		
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 50MByte입니다.");
    		return false;
    	}
    	else {
    		// alert("파일사이즈 : " + fileSize);
	    	myform.fileSize.value = fileSize;
	    	myform.submit();
    	}
		}
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
	  <h2 class="text-center">후 기 작 성</h2>
	  <form name="myform" method="post" action="${ctp}/ReviewInputOk.re" enctype="multipart/form-data">
	    <div class="form-group">
	      <label for="title">제목</label>
	      <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요" autofocus required />
	    </div>
	    <div class="form-group">
	      <label for="mid">아이디</label>
	      <input type="text" class="form-control" name="mid" id="mid" value="${sMid}" readonly required />
	    </div>
	    <div class="form-group">
	      <label for="email">이메일</label>
	      <input type="text" class="form-control" name="email" id="email" value="${vo.email}" placeholder="이메일을 입력하세요" />
	    </div>
	    <div class="form-group">
	      <label for="content">내용</label>
	      <textarea rows="3" name="content" id="content" required class="form-control"></textarea>
	    </div>
	    <div class="form-group">
	      <label for="photo">사진</label>
	      <input type="file" name="fName1" id="fName1" class="form-control-file-md border"/>
		    <input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2"/>
	    </div>
	    <div id="fileBoxAppend"></div>
	    <div class="form-group text-center">
	    	<button type="button" onclick="fCheck()" class="btn btn-primary mr-2">등록</button>
	    	<button type="reset" class="btn btn-warning mr-2">재입력</button>
	    	<button type="button" onclick="location.href='${ctp}/ReviewList.gu';" class="btn btn-danger">돌아가기</button>
	    </div>
	    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
	    <input type="hidden" name="fileSize" />
	  </form>
		</div>
	</div>		
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>