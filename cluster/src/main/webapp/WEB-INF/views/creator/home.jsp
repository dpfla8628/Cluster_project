<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리 페이지</title>
    <link type="text/css" rel="stylesheet" href='<c:url value="/css/creatorstyle.css"/>'>
</head>
<body>
	<c:import url="/WEB-INF/views/creator/header.jsp"></c:import>
    <article>
		<h2># 진행 중 강의</h2>    		
    	
    	<table border="1">
		<tr>
			<th align="center" width="80">번호</th>
			<th align="center" width="320">강의명</th>
			<th align="center" width="100">시작일</th>
			<th align="center" width="100">종료일</th>
			<th align="center" width="100">리뷰</th>
			<th align="center" width="100">신청인원</th>
			<th align="center" width="100">찜수</th>
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
						<td align="center">${offclass.classMemberSet}</td>
						<td align="center">${offclass.classPrice}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>			
    		
    </article>
    <c:import url="/WEB-INF/views/creator/footer.jsp"></c:import>  
</body>
</html>