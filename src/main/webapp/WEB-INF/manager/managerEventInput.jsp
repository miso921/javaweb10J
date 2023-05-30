<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerEventInput.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		body{font-family:'GmarketSansMedium';}
		#p {margin-left:3px;margin-right:30px;}
		#pa {margin-bottom:25px;margin-right:30px;margin-left:-85px;}
		#photo {margin-left:-40px;}
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
			
			if(fName1.trim() == "") {
				alert("업로드할 파일명을 선택하세요!");
				return false;
			}
			
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
    		alert("업로드할 파일의 최대용량은 30MByte입니다.");
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
<p><br /></p>
<div class="container">
	<div id="content" class="text-center">
		<h2 class="text-center mb-5"><font size="15px;"><b>행 사 등 록</b></font></h2>
		<form name="myform" method="post" action="${ctp}/ManagerEventInputOk.ma" enctype="multipart/form-data">
			<div class="d-flex align-items-center justify-content-center">
				<label id="pa" for="part" class="font-weight-bold">분류</label>
				<select name="part" class="form-control-md mb-4" style="margin-right:10px;" required>
					<option disabled selected>선택하세요</option>
					<option>봉사</option>
					<option>체험</option>
				</select>
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span class="font-weight-bold mr-3">행사명</span>
				<input type="text" name="eventName" id="eventName" autofocus required class="form-control-md mb-2" />
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span class="font-weight-bold mr-1">행사시간</span>
				<input type="text" name="eTime" id="eTime" required class="form-control-md" />
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span class="font-weight-bold mr-1">모집정원</span>
				<input type="text" name="people" id="people" required class="form-control-md" />
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span id="p" class="font-weight-bold">장소</span>
				<input type="text" name="place" id="place" class="form-control-md" />
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span class="font-weight-bold mr-1">참여 대상</span>
				<input type="text" name="target" id="target" class="form-control-md" />
			</div>
			<div class="d-flex align-items-center justify-content-center mb-4">
				<span class="font-weight-bold mr-4">참가비</span>
				<input type="text" name="money" id="money" class="form-control-md" />
			</div>
<!-- 			<div>
				행사사진 / 상세내용 / 오시는길 사진&nbsp;<font color="red">(사진 3장을 선택하세요!)</font><br />
				<input type="file" name="photo" id="photo" multiple required class="form-control-file mb-2" />
			</div> -->
	    <div class="align-items-center justify-content-center mb-4">
				<span id="photo" class="font-weight-bold">행사사진 / 상세내용 / 오시는길 사진</span><br />
	      <input type="file" name="fName1" id="fName1" class="form-control-file-md border"/>
	      <input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2"/>
	    </div>
	    <div id="fileBoxAppend"></div>
			<div class="justify-content-center d-flex">
				<input type="button" value="확인" onclick="fCheck()" class="btn btn-success mr-2" />
				<input type="reset" value="재입력" class="btn btn-warning mr-2" />
				<input type="button" value="돌아가기" onclick="location.href	='${ctp}/';" class="btn btn-danger" />
			</div>
			<input type="hidden" name="fileSize" />
		</form>	
	</div><!-- //#content -->
</div>		
<p><br /></p>
</body>
</html>