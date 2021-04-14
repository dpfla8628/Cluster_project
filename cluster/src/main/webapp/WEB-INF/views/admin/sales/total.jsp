<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>


<script>
	$(function(){
		
		$("#salesMenu").next("ul").slideDown();
		
		//끝날짜의 값을 오늘 날짜로 설정
		//$("#endDate").val(new Date().toISOString().substring(0, 10));
		
		//시작날짜와 끝날짜를 설정할 수 있는 최대값을 오늘날짜로 제한
		$("#startDate, #endDate").attr("max", new Date().toISOString().substring(0, 10));
		
		
		//테스트
		$("#searchBtn").click(function(){
			
			var endDateStr= $("#endDate").val();
			var startDateStr = $("#startDate").val();
			
			console.log(typeof endDateStr);
			
			var endArr = endDateStr.split('-');
			var startArr = startDateStr.split('-');
			
			
			var endDate = new Date(endArr[0], endArr[1]-1, endArr[2]);
			var startDate = new Date(startArr[0], startArr[1]-1, startArr[2]);
			
			
			var dateDiff = (endDate.getTime() - startDate.getTime()) / 1000 / 60 / 60 / 24;
			
			$("#dateDiff").val(dateDiff);
				
			//두 날짜의 차이 일수가 0보다 작거나 숫자가 아니라면
			if(dateDiff < 0 || isNaN(dateDiff)) {
				alert("기간을 올바르게 설정해주세요.");
				return false;
			}
			
			else{
				console.log(dateDiff);
			}

			
		})
		
		
	})
</script>

<div class="outbox">

	<h2>전체 매출현황</h2>
	
	<div class="row">
		<form action="total" method="get">
			<c:if test="${startDate != null}">
				<input type="date" id="startDate" name="startDate" value="${startDate}">
			</c:if>
			<c:if test="${startDate == null}">
				<input type="date" id="startDate" name="startDate">
			</c:if>
			~
			<c:if test="${endDate != null}">
				<input type="date" id="endDate" name="endDate" value="${endDate}">
			</c:if>
			<c:if test="${endDate == null}">
				<input type="date" id="endDate" name="endDate">
			</c:if>
			
			<input type="submit" id="searchBtn" value="검색">
		</form>
	</div>
	
	
	
	<br><br><br>
	
	<table class="swTable">
		<tr>
			<th>날짜</th>
			<th>매출액</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="2">검색결과가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="adminClassorderVO">
						<tr>
							<td>${adminClassorderVO.orderdate}</td>
							<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminClassorderVO.sales}"/></td>
						</tr>
					</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
</div>


<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>