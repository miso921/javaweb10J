<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>review.jsp</title>
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
			if(${pag} > ${totPage}) location.href="${ctp}/ReviewList.re?pag=${totPage}&pageSize=${pageSize}";
			
			function pageCheck() {
				let pageSize = document.getElementById("pageSize").value;
				location.href = "${ctp}/ReviewList.re?pag=${pag}&pageSize="+pageSize;
			}
			
			function delCheck(idx) {
				let ans = confirm("선택한 후기글을 삭제하시겠습니까?");
				if(!ans) return false;
				
				$.ajax({
					type : "post",
					url  : "${ctp}/ReviewDel.re",
					data : {idx:idx},
					success: function(res) {
						if(res == 1) {
							alert("삭제가 완료되었습니다!");
							location.reload();
						}
						else {
							alert("삭제 실패했습니다!");
							location.href="${ctp}/ReviewList.re";
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
<jsp:include page="/include/nav.jsp" />
<p><br /></p>
<div class="container">
  <h2 class="text-center">후 기</h2>
  <table class="table table-borderless mb-0 p-0">
    <tr>
      <c:if test="${sLevel <= 1}">
        <td style="text-align:right;">
          <a href="${ctp}/ReviewInput.re?pag=${pag}&pageSize=${pageSize}" class="btn btn-primary btn-sm">글쓰기</a>
        </td>
      </c:if>
    </tr>
  </table>
  <table class="table table-borderless mb-0 p-0">
    <tr>
      <td>
        <select name="pageSize" id="pageSize" onchange="pageCheck()">
          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
        </select> 건
      </td>
      <td class="text-right">
        <!-- 첫페이지 / 이전페이지 / (현재페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
        <c:if test="${pag > 1}">
          <a href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=1" title="첫페이지로">◁◁</a>
          <a href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${pag-1}" title="이전페이지로">◀</a>
        </c:if>
        ${pag}/${totPage}
        <c:if test="${pag < totPage}">
          <a href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${pag+1}" title="다음페이지로">▶</a>
          <a href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${totPage}" title="마지막페이지로">▷▷</a>
        </c:if>
      </td>
    </tr>
  </table>
  <c:forEach var="vo" items="${vos}" varStatus="st">
    <table class="table table-borderless mb-0 mt-0">
      <tr>
        <td>
          번호 : ${curScrStartNo}
          <c:if test="${sLevel == 0 || sMid == vo.mid}">
            <a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a>
          </c:if>
        </td>
        <td style="text-align:right;">방문IP : ${vo.hostIp}</td>
      </tr>
    </table>
    <table class="table table-bordered mt-0">
      <tr>
        <th class="text-center">제목</th>
        <td colspan="3" style="height:50px">${vo.title}</td>
      </tr>
      <tr>
        <th class="text-center" style="20%">아이디</th>
        <td style="30%">${vo.mid}</td>
        <th class="text-center" style="20%">작성일자</th>
        <td style="30%">${fn:substring(vo.wDate,0,10)}</td>
      </tr>
      <tr>
        <th class="text-center">이메일</th>
        <td colspan="3">
          <c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email,'@')==-1 || fn:indexOf(vo.email,'.')==-1}">- 없음 -</c:if>
          <c:if test="${!empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email,'@')!=-1 && fn:indexOf(vo.email,'.')!=-1}">${vo.email}</c:if>
        </td>
      </tr>
      <tr>
        <th class="text-center">내용</th>
        <td colspan="3" style="height:150px">${fn:replace(vo.content, newLine, '<br/>')}</td>
      </tr>
    </table>
    <br/>
    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
  </c:forEach>
  <br/>
  <!-- 4페이지(1블록)에서 0블록으로 가게되면 현재페이지는 1페이지가 블록의 시작페이지가 된다. -->
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
  <div class="text-center">
    <ul class="pagination justify-content-center">
      <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
      <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
      <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
        <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
        <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
      </c:forEach>
      <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
      <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReviewList.re?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
    </ul>
  </div>
</div>
<p><br /></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>