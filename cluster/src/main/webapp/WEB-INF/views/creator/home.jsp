<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리 페이지</title>
    <link type="text/css" rel="stylesheet" href='<c:url value="/css/creatorstyle.css"/>'>
</head>
<style>
	h2 {
		text-align: left;
		margin-left: 10%;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 90%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/creator/home?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
	<c:import url="/WEB-INF/views/creator/header.jsp"></c:import>
    <article>
		<h2># 진행 중 강의</h2>    		
    	
    	<div id="outter">
			<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="5"
						<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20"
						<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
			</div> <!-- 옵션선택 끝 -->

	    	<table border="1">
				<tr>
					<th align="center" width="6%">번호</th>
					<th align="center" width="56%">강의명</th>
					<th align="center" width="10%">시작일</th>
					<th align="center" width="10%">종료일</th>
					<th align="center" width="6%">리뷰</th>
					<th align="center" width="6%">신청인원</th>
					<th align="center" width="6%">찜수</th>
				</tr>
		
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td align="center" colspan="7">
								진행중인 강의가 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="offclass">
							<tr>
								<td align="center">${offclass.classNo}</td>
								<td align="left">
									<a href="/creator/read?classNo=${offclass.classNo}">
										${offclass.className}
									</a>
								</td>
								<td align="center">${offclass.classStart}</td>
								<td align="center">${offclass.classEnd}</td>
								<td align="center">리뷰링크</td>
								<td align="center">결재완료링크</td>
								<td align="center">찜링크</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>			
    
    		<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/home?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/home?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/home?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
    	</div>
    </article>
    <c:import url="/WEB-INF/views/creator/footer.jsp"></c:import>  
</body>
</html>