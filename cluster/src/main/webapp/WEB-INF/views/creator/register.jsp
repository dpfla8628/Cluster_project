<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 추가 페이지</title>
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnRegister").on("click", function(){
			self.location = "/creator/registerForm"
		})
	});
	
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/creator/register?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
	<c:import url="/WEB-INF/views/creator/header.jsp"></c:import>
    <article>
		<h2># 신청 강의 검수 상황</h2>    		
    	
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
					<th align="center" width="80">번호</th>
					<th align="center" width="400">강의명</th>
					<th align="center" width="150">신청일</th>
					<th align="center" width="150">진행상황</th>
					<th align="center" width="300">상태</th>
				</tr>
			
					<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td align="center" colspan="5">
								검수 신청한 강의가 없습니다.
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
								<td align="center">${offclass.classRegdate}</td>
								<td align="center">${offclass.classCheck}</td>
								<td align="center">
									<a href="/creator/modify?classNo=${offclass.classNo}">등록 수정</a>
									<a href="/creator/remove?classNo=${offclass.classNo}">등록 취소</a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>			
    
		    <div class="right">
		    	<button type="button" id="btnRegister">신규강의 신청</button>
		    </div>
		    
		    <div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/creator/register?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/creator/register?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/creator/register?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
    	</div>
    			
    </article>
    <c:import url="/WEB-INF/views/creator/footer.jsp"></c:import>  
</body>
</html>