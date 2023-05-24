<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>managerMemberList.ma</title>
	<jsp:include page="/include/bs4.jsp" />
	<style>
		@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
		body{font-family:'Pretendard-Regular';}
	</style>
	<script>
		'use strict';
			if(${pag} > ${totPage}) location.href="${ctp}/ManagerMemberList.ma?pag=${totPage}&pageSize=${pageSize}";
			
			function pageCheck() {
				let pageSize = document.getElementById("pageSize").value;
				location.href = "${ctp}/ManagerMemberList.ma?pag=${pag}&pageSize="+pageSize;
			}
			
			// 개별 선택항목 처리
			function levelChange(e) {
				let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
				if(!ans) {
					location.reload();
					return false;
				}
				
				let items = e.value.split("/");
				let query = {
						level : items[0],
						idx : items[1],
				}
				$.ajax({
					type  : "post",
					url   : "${ctp}/ManagerMemeberLevelChange.ma",
					data  : query,
					success : function() {
						if(res == 1) {
							alert("등급 수정이 완료되었습니다!");
							location.reload();
						}
						else {
							alert("등급 수정에 실패했습니다.");
						}
					},
					error : function() {
						alert("전송오류!");
					}
				});
			}
			
			// 선택항목 전체 변경 처리
			function mLevelCheck() {
				let ans = confirm("선택한 항목을 모두 변경하시겠습니까?");
		    	if(!ans) return false;
		    	
		  		let totalLevel = document.getElementById("totalLevel").value;
		  		let changeItems = "";
		  		for(var i=0; i<myform.chk.length; i++) {
		  			if(myform.chk[i].checked==true) changeItems += myform.chk[i].value + "/";
		  		}
		  		changeItems = changeItems.substring(0,changeItems.length-1);
		  		//alert("선택된 항목의 목록값? " + changeItems + " , 선택등급:" + totalLevel);
		    	
		  		let query = {
		  				changeItems   : changeItems,
		    			level : totalLevel
		    	}
		    	
		    	$.ajax({
		    		type   : "post",
		    		url    : "${ctp}/AdminMemberLevelTotalChange.ad",
		    		data   : query,
		    		success:function() {
		  				alert("등급 수정 완료!");
		  				location.reload();
		    		},
		    		error : function() {
		    			alert("전송 오류~~");
		    		}
		    	});
		    }
			
			// 전체 선택
			$(function() {
				$("#checkAll").click(function() {
					if($("#checkAll").prop("checked")) {
						$(".chk").prop("checked",true);
					}
					else {
						$(".chk").prop("checked",false);
					}
				});
			});
			
			// 선택항목 반전
			$(function() {
				$("#reverseAll").click(function() {
					$(".chk").prop("checked", function() {
						return !$(this).prop("checked");
					});
				});		
			});
			
			// 선택 회원 삭제
			function memberDelete(idx) {
				let ans = confirm("선택한 회원을 삭제하시겠습니까?");
				if(!ans) return false;
				
				$.ajax({
					type  : "post",
					url   : "${ctp}/ManagerMemberDelete.ma",
					data  : {idx : idx},
					success : function() {
						alert("선택한 회원 삭제가 완료되었습니다!");
						location.reload();
					},
					error : function() {
						alert("전송오류!");
					}
				});
			}
	</script>
</head>
<body>
<div class="container">
	<form name="myform">
	  <div id="content">
	    <br>
	    <h2 class="text-center"><b>회 원 목 록</b></h2>
	    <br>
	    <div class="row borderless m-0 p-0">
	      <div class="col mb-2">
	        <!-- 한페이지 분량처리 -->
	        <select name="pageSize" id="pageSize" onchange="pageCheck()" class="form-control">
	          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
	          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
	          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
	          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
	          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
	        </select>
	      </div>
	      <div class="col">
	        <div class="form-check">
	          <input type="checkbox" id="checkAll" class="form-check-input">
	          <label class="form-check-label" for="checkAll">전체선택/해제</label>
	        </div>
	      </div>
	      <div class="col">
	        <div class="form-check">
	          <input type="checkbox" id="reverseAll" class="form-check-input">
	          <label class="form-check-label" for="reverseAll">전체반전</label>
	        </div>
	      </div>
	      <div class="col">
	        <select name="totalLevel" id="totalLevel" class="form-control">
	          <option value="0">관리자</option>
	          <option value="1" selected>회원</option>
	        </select>
	      </div>
	      <div class="col">
	        <input type="button" value="등급변경" id="levelChange" onclick="mLevelCheck()" class="btn btn-outline-warning btn-sm mb-2">
	      </div>
	    </div>
	    <div class="table-responsive">
	      <table class="table table-bordered">
	        <thead>
	          <tr>
	            <th>번호</th>
	            <th>성명</th>
	            <th>아이디</th>
	            <th>별명</th>
	            <th>생년월일</th>
	            <th>전화번호</th>
	            <th>이메일</th>
	            <th>성별</th>
	            <th>탈퇴신청</th>
	            <th>등급</th>
	            <th>비고</th>
	          </tr>
	        </thead>
	        <tbody>
	          <c:forEach var="vo" items="${vos}" varStatus="st">
	            <tr>
	              <td>
	              	<input type="checkbox" class="chk" name="chk" value="${vo.idx}" /> &nbsp;
	              	${curScrStartNo}
	              </td>
	              <td>${vo.name}</td>
	              <td><a href="${ctp}/ManagerMemberContent.ma?mid=${vo.mid}&pag=${pag}$pageSize=${pageSize}" target="managerContent">${vo.mid}</a></td>
	              <td>${vo.nick}</td>
	              <td>${fn:replace(fn:substring(vo.birthday,0,10),'-','')}</td>
	              <td>${vo.tel}</td>
	              <td>${vo.email}</td>
	              <td>${vo.gender}</td>
	              <td>${vo.userDel}</td>
	              <td>
	                <form name="levelForm">
	                  <select name="level" onchange="levelChange(this)" class="form-control">
	                    <option value="0/${vo.idx}" ${vo.level==0 ? "selected" : ""}>관리자</option>
	                    <option value="1/${vo.idx}" ${vo.level==1 ? "selected" : ""}>회원</option>
	                  </select>
	                </form>
	              </td>
	              <c:if test="${vo.userDel == 'OK'}">
	                <td>
	                  <input type="button" value="탈퇴" onclick="memberDelete(${vo.idx})" class="btn btn-danger btn-sm">
	                </td>
	              </c:if> 
	              <c:if test="${vo.userDel != 'OK'}">
	                <td>
	                  <input type="button" value="탈퇴" class="btn btn-danger" disabled="disabled">
	                </td>
	              </c:if>
	            </tr>
	            <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	          </c:forEach>	
	        </tbody>
	      </table>
	    </div>
	    <!-- 블록 페이징 처리 -->
	    <div class="text-center m-4">
	      <ul class="pagination justify-content-center pagination-sm">
	        <c:if test="${pag > 1}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=1">첫페이지</a>
	          </li>
	        </c:if>
	        <c:if test="${curBlock > 0}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a>
	          </li>
	        </c:if>
	        <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	          <c:if test="${i <= totPage && i == pag}">
	            <li class="page-item active">
	              <a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${i}">${i}</a>
	            </li>
	          </c:if>
	          <c:if test="${i <= totPage && i != pag}">
	            <li class="page-item">
	              <a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${i}">${i}</a>
	            </li>
	          </c:if>
	        </c:forEach>
	        <c:if test="${curBlock < lastBlock}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a>
	          </li>
	        </c:if>
	        <c:if test="${pag < totPage}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerMemberList.ma?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a>
	          </li>
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</form>	  
</div>
<p><br/></p>
</body>
</html>