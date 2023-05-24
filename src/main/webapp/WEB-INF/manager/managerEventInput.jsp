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
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
		/* reset */
		body{font-family:'Pretendard-Regular';}
	</style>
	<script>
		'use strict';

		let cnt =1;
		
		function fCheck() {
			let photo = $("#photo").val();
			let maxSize = 1024 * 1024 * 50 // 최대 50MByte 허용
			
			if(photo.trim() == "") {
				alert("업로드할 파일명을 선택하세요!");
				return false;
			}
			
			// 파일 사이즈 처리
			let fileSize = 0;
			for(let i=1; i<cnt; i++) {
				let imsiName = 'fName' + i;
				if(isNaN(document.getElementById(imsiName))) {
					let fName = document.getElementById(imsiName).value;
					if(fName != "") {
						fileSize += document.getElementById(imsiName).files[0].size;
						let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();
						if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "HWP" && ext != "PPT" && ext != "PPTX" && ext != "PDF") {
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
				myform.fileSize.value = fileSize;
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br /></p>
<div class="container">
	<div id="content">
		<h2 class="text-center"><font size="15px;"><b>행 사 등 록</b></font></h2>
		<form name="myform" method="post" action="${ctp}/ManagerEventInputOk.ma" enctype="multipart/form-data">
			<div>
				분류<br />
				<select name="part" class="form-control mb-2" required>
					<option disabled selected>선택하세요</option>
					<option>봉사</option>
					<option>체험</option>
				</select>
			</div>
			<div>
				행사명<br />
				<input type="text" name="eventName" id="eventName" autofocus required class="form-control mb-2" />
			</div>
			<div>
				행사시간<br />
				<input type="text" name="eTime" id="eTime" required class="form-control mb-2" />
			</div>
			<div>
				모집정원&nbsp;<font color="red">(숫자만 입력)</font><br />
				<input type="number" name="people" id="people" required class="form-control mb-2" />
			</div>
			<div>
				장소<br />
				<input type="text" name="place" id="place" required class="form-control mb-2" />
			</div>
			<div>
				참여 대상<br />
				<input type="text" name="target" id="target" class="form-control mb-2" />
			</div>
			<div>
				참가비&nbsp;<font color="red">(숫자만 입력)</font><br />
				<input type="number" name="money" id="money" class="form-control mb-2" />
			</div>
			<div>
				행사사진 / 상세내용 / 오시는길 사진&nbsp;<font color="red">(사진 3장을 선택하세요!)</font><br />
				<input type="file" name="photo" id="photo" multiple required class="form-control-file mb-2" />
			</div>
			<div class="justify-content-center d-flex">
				<input type="button" value="확인" onclick="fCheck()" class="btn btn-success" />
				<input type="reset" value="재입력" class="btn btn-warning" />
				<input type="button" value="돌아가기" onclick="location.href	='${ctp}/';" class="btn btn-danger" />
			</div>
			<input type="hidden" name="fileSize" />
		</form>	
	</div><!-- //#content -->
</div>		
</body>
</html>