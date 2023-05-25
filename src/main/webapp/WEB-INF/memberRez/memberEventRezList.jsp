<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberEventRezList.jsp</title>
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
				location.href = "${ctp}/MemberEventRezList.mer?pag=${pag}&pageSize="+pageSize;
			}
			
			
			// 선택 행사 예약 취소
			function cancleCheck(idx) {
				let ans = confirm("선택한 행사를 삭제하시겠습니까?");
				if(!ans) return false;
				
				$.ajax({
					type  : "post",
					url   : "${ctp}/MemberEventRezCancle.mer",
					data  : {idx : idx},
					success : function() {
						alert("예약 취소가 완료되었습니다!");
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
	    <br>
	    <h2 class="text-center"><b>나 의 예 약 목 록</b></h2>
	    <br>
	    <div class="row borderless m-0 p-0">
	      <div class="col mb-2">
	        <!-- 한페이지 분량처리 -->
	        <select name="pageSize" id="pageSize" onchange="pageCheck()">
	          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
	          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
	          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
	          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
	          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
	        </select>
	      </div>
	     <!--  <div class="col">
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
	      </div> -->
	     <!--  <div class="col">
	        <input type="button" value="등급변경" id="levelChange" onclick="mLevelCheck()" class="btn btn-outline-warning btn-sm mb-2">
	      </div>
	    </div> -->
	    <div class="table-responsive">
	      <table class="table table-bordered">
	        <thead>
	          <tr>
	            <th>번호</th>
	            <th>행사명</th>
	            <c:if test="${sLevel == 0}"><th>아이디</th></c:if>
	            <th>예약날짜</th>
	            <th>예약시간</th>
	            <th>예약인원</th>
	            <th>신청날짜</th>
	          </tr>
	        </thead>
	        <tbody>
	          <c:forEach var="vo" items="${vos}" varStatus="st">
	            <tr>
	              <td>
	              	<input type="checkbox" class="chk" name="chk" value="${vo.idx}" /> &nbsp;
	              	${curScrStartNo}
	              </td>
	              <td><a href="${ctp}/ManagerMemberContent.ma?idx=${vo.idx}&pag=${pag}$pageSize=${pageSize}" target="managerContent">${vo.eventName}</a></td>
	              <c:if test="${sLevel == 0}"><td>${vo.mid}</td></c:if>
	              <td>${vo.rDate}</td>
	              <td>${fn:substring(vo.rTime,0,10)}</td>
	              <td>${vo.rPeopleNum}</td>
	              <td>${vo.aplDate}</td>
	              <td>
	              </td>
	                <td>
	                  <input type="button" value="예약취소" onclick="cancleCheck(idx)" class="btn btn-danger">
	                </td>
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