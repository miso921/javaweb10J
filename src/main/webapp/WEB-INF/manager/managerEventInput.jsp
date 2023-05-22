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
	<jsp:include page="/include/managerMainMenu.jsp" />
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
	<script>
		'use strict';

		let cnt =1;
		
		function fCheck() {
			let thumbnail = $("#thumbnail").val();
			let detail = $("#detail").val();
			let road = $("#road").val();
			let maxSize = 1024 * 1024 * 30 // 최대 30MByte 허용
			
			if(thumbnail.trim() == "") {
				alert("업로드할 파일명을 선택하세요!");
				return false;
			}
			else if(detail.trim() == "") {
				alert("업로드할 파일명을 선택하세요!");
				return false;
			}
			else if(road.trim() == "") {
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
				alert("업로드할 파일의 최대용량은 30MByte입니다.");
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
<div class="container">
	<div id="content">
		<p><br /></p>
		<h2 class="text-center"><font size="15px;"><b>행 사 등 록</b></font></h2>
		<form name="myform" method="post" action="${ctp}/ManagerEventInputOk.ma" enctype="multipart/form-data">
			<div>
				행사명<br />
				<input type="text" name="eventName" id="eventName" autofocus required class="form-control mb-2" />
			</div>
			<div>
				행사시간<br />
				<!-- <input type="time" name="eTime" id="eTime" required class="form-control mb-2" /> -->
				<input type="text" name="eTime" id="eTime"/>
			</div>
			<div>
				표 개수&nbsp;<font color="red">(숫자만 입력)</font><br />
				<input type="number" name="ticketNum" id="ticketNum" required class="form-control mb-2" />
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
				참여가능 인원&nbsp;<font color="red">(숫자만 입력)</font><br />
				<input type="number" name="people" id="people" class="form-control mb-2" />
			</div>
			<div>
				참가비&nbsp;<font color="red">(숫자만 입력)</font><br />
				<input type="number" name="money" id="money" class="form-control mb-2" />
			</div>
			<div>
				분류<br />
				<select name="part" class="form-control mb-2" required>
					<option disabled selected>선택하세요</option>
					<option>봉사활동</option>
					<option>체험활동</option>
				</select>
			</div>
			<div>
				행사 사진<br />
				<input type="file" name="thumbnail" id="thumbnail" required class="form-control-file mb-2" />
			</div>
			<div>
				상세내용<br />
				<input type="file" name="detail" id="detail" class="form-control-file mb-2" />
			</div>
			<div>
				오시는 길<br />
				<input type="file" name="road" id="road" class="form-control-file mb-2" />
			</div>
			<div>
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