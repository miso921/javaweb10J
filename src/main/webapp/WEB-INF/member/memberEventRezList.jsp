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
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  body {font-family: 'GmarketSansMedium';}
	</style>
	<script>
		'use strict';
			if(${pag} > ${totPage}) location.href="${ctp}/ManagerMemberList.ma?pag=${totPage}&pageSize=${pageSize}";
			
			function pageCheck() {
				let pageSize = document.getElementById("pageSize").value;
				/* location.href = "${ctp}/MemberEventRezList.me?pag=${pag}&pageSize="+pageSize; */
				location.href = "${ctp}/Hi.me?pag=${pag}&pageSize="+pageSize;
			}
			
			
			// 선택 행사 예약 취소
			function cancleCheck(idx) {
				let ans = confirm("선택한 행사를 삭제하시겠습니까?");
				if(!ans) return false;
				
				$.ajax({
					type  : "post",
					url   : "${ctp}/MemberEventRezCancle.me",
					data  : {idx : idx},
					success : function(res) {
						if(res==1) {
							alert("예약 취소가 완료되었습니다!");
							location.reload();
						}
						else {
							alert("예약 취소에 실패했습니다!");
						}
					},
					error : function() {
						alert("전송오류!");
					}
				});
			}
	</script>
</head>
<body>
<p><br /></p>
<div class="container">
	<form name="myform">
	    <br>
	    <h2 class="text-center"><b>예 약 목 록</b></h2>
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
	    <div class="table-responsive">
	      <table class="table table-bordered">
	        <thead>
	          <tr class="text-center">
	            <th>전체선택</th>
	            <th>번호</th>
	            <th>행사명</th>
	            <c:if test="${sLevel == 0}"><th>아이디</th></c:if>
	            <th>예약날짜</th>
	            <th>예약시간</th>
	            <th>예약인원</th>
	            <th>신청날짜</th>
	            <th>비고</th>
	          </tr>
	        </thead>
	        <tbody>
	          <c:forEach var="vo" items="${vos}" varStatus="st">
	            <tr class="text-center">
	              <td>
	              	<input type="checkbox" class="chk" name="chk" value="${vo.idx}" /> &nbsp;
	              </td>
	              <td>
	              	${curScrStartNo}
	              </td>
	              <td><a href="${ctp}/ManagerMemberContent.ma?idx=${vo.idx}&pag=${pag}$pageSize=${pageSize}" target="managerContent">${vo.eventName}</a></td>
	              <c:if test="${sLevel == 0}"><td>${vo.mid}</td></c:if>
	              <td>${fn:substring(vo.rDate,0,10)}</td>
	              <td>${fn:substring(vo.rTime,0,10)}</td>
	              <td>${vo.rPeopleNum}</td>
	              <td>${fn:substring(vo.aplDate,0,10)}</td>
                <td>
                  <input type="button" value="예약취소" onclick="cancleCheck(${vo.idx})" class="btn btn-danger">
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
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventRezList.mer?pageSize=${pageSize}&pag=1">첫페이지</a>
	          </li>
	        </c:if>
	        <c:if test="${curBlock > 0}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventRezList.mer?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a>
	          </li>
	        </c:if>
	        <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	          <c:if test="${i <= totPage && i == pag}">
	            <li class="page-item active">
	              <a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ManagerEventRezList.mer?pageSize=${pageSize}&pag=${i}">${i}</a>
	            </li>
	          </c:if>
	          <c:if test="${i <= totPage && i != pag}">
	            <li class="page-item">
	              <a class="page-link text-secondary" href="${ctp}/ManagerEventRezList.mer?pageSize=${pageSize}&pag=${i}">${i}</a>
	            </li>
	          </c:if>
	        </c:forEach>
	        <c:if test="${curBlock < lastBlock}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventRezList.mer?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a>
	          </li>
	        </c:if>
	        <c:if test="${pag < totPage}">
	          <li class="page-item">
	            <a class="page-link text-secondary" href="${ctp}/ManagerEventRezList.mer?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a>
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