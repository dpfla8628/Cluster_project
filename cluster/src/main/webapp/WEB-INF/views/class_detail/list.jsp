<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
			 
			$('#logInBtn').click(function(){
				$(location).attr('href', '../login/')
			})
	})
</script>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
</head>
<body>
	<h2>게시판 리스트</h2>
	<h5>아이디 : ${id}</h5>
	<h5>닉네임 : ${nick}</h5>
	<h5>권한 : ${auth}</h5>
	<a href="/mypage/index">마이페이지</a>
	<button id="logInBtn">로그인</button>
 	
	
 	<table border="1">
		<tr>
			<th align = "center" width="80">번호</th>
			<th align = "center" width="320">제목</th>
 			<th align = "center" width="100">크리에이터이름</th>
			<th align = "center" width="160">가격</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">
						게시물이 없습니다
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list">
					<tr>
						<td align="center">
							${list.classNo}
						</td>
						<td align="center">
						<a href="<c:url value="/class_detail/detail/${list.classNo}"/>">
								${list.className}
							</a>
						</td> 
						<td align="center">
							${list.authMember.memberNick}
						</td>
						<td align="center">
							${list.classPrice}원
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
 <div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</body>
</html>