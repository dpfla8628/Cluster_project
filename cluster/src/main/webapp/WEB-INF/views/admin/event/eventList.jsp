<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>
</style>

<script>
	$(function(){
		
		$("#eventMenu").next("ul").slideDown();
		
		
		//검색버튼 클릭시 값이 key값이 없으면 전송x
		$("#searchBtn").click(function(){
			
			var key = $("input[name=key]").val();
			
			if(!key) {
				alert("검색어를 입력해주세요!");
				$("input[name=key]").focus();
				return false;
			}
		});
		
		//셀렉박스 change이벤트 발생시
		$("#selectBox").change(function(){
			
			//셀렉박스에서 선택한 옵션값
			var option = $(this).val();
			
			//검색+옵션인지 확인하기 위해
			var key = $("input[name=key]").val();
			
			//검색 + 옵션으로 필터링 하는 경우라면
			if(key) {
				location.href = "eventList?key="+key+"&option="+option;
			}
			//검색이 아닌 옵션으로만 필터링 하는 경우
			else {
				location.href = "eventList?option="+option;
			}
			
			
			
			
		});
		
		
	});
</script>

<div class="outbox">
	
	<h2>이벤트 목록</h2>
	
	<div class="row">
		<form action="eventList" method="get">
			
			<c:if test="${key != null}">
				<input type="text" name="key" value="${key}">
			</c:if>
			<c:if test="${key == null}">
				<input type="text" name="key" placeholder="이벤트명을 입력하세요.">
			</c:if>
			<input type="submit" id="searchBtn" value="검색">
		</form>
		
		<select id="selectBox" style=float:right;>
			<c:if test="${option == null}">
				<option value="all">전체</option>
				<option value="ing">진행중</option>
				<option value="comingSoon">진행예정</option>
				<option value="end">진행종료</option>
			</c:if>
			
			<c:if test="${option == 'all'}">
				<option value="all" selected>전체</option>
				<option value="ing">진행중</option>
				<option value="comingSoon">진행예정</option>
				<option value="end">진행종료</option>
			</c:if>
			
			<c:if test="${option == 'ing'}">
				<option value="all">전체</option>
				<option value="ing" selected>진행중</option>
				<option value="comingSoon">진행예정</option>
				<option value="end">진행종료</option>
			</c:if>
			
			<c:if test="${option == 'comingSoon'}">
				<option value="all">전체</option>
				<option value="ing">진행중</option>
				<option value="comingSoon" selected>진행예정</option>
				<option value="end">진행종료</option>
			</c:if>
			
			<c:if test="${option == 'end'}">
				<option value="all">전체</option>
				<option value="ing">진행중</option>
				<option value="comingSoon">진행예정</option>
				<option value="end" selected>진행종료</option>
			</c:if>
		</select>
	
	</div>
	
	<br>
	
	<!-- 오늘 날짜 -->
	<fmt:formatDate var="today" value="${today}" pattern="yyyy-MM-dd"/>
	
	<table class="swTable">
		<tr>
			<th>이벤트번호</th>
			<th>이벤트명</th>
			<th>이벤트기간</th>
			<th>상태</th>
			<th>이벤트정보</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">검색결과가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="event">
						<tr>
							<td>${event.eventNo}</td>
							<td>${event.eventTitle}</td>
							<td>${event.eventStart} ~ ${event.eventEnd}</td>
							<td>
								<fmt:formatDate value="${event.eventEnd}" pattern="yyyy-MM-dd" var="endDate"/>
								<fmt:formatDate value="${event.eventStart}" pattern="yyyy-MM-dd" var="startDate"/>
								<c:if test="${today <= endDate && today >= startDate}">
									진행중
								</c:if>
								<c:if test="${today > endDate}">
									진행종료
								</c:if>
								<c:if test="${today < startDate}">
									진행예정
								</c:if>
							</td>
							<td><a href="#">조회</a></td>
						</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

</div>




<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>