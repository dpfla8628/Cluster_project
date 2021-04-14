<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>

</style>

<script>
	
	$(function(){
		
		$("#creatorMenu").next("ul").slideDown();
		
	});

	
</script>

<div class="outbox">

	<h2>크리에이터 명단</h2>
	<input type="text" placeholder="크리에이터명을 입력하세요.">
	<button>검색</button>
	
	<br>
	
	<div class="row center">
		<table class="swTable">
			<tr>
				<th>No.</th>
				<th>크리에이터</th>
				<th>진행중인클래스</th>
				<th>오픈예정클래스</th>
				<th>종료된클래스</th>
				<th>크리에이터정보</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="6">검색결과가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="adminCreatorVO">
						<tr>
							<td>${adminCreatorVO.creatorNo}</td>
							<td>${adminCreatorVO.creatorNick}</td>
							<td>${adminCreatorVO.countIng}</td>
							<td>${adminCreatorVO.countComingSoon}</td>
							<td>${adminCreatorVO.countEnd}</td>
							<td><a href="#">조회</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>