<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>


<script>
	$(function(){
		
		$("#salesMenu").next("ul").slideDown();
		
		
		//선택할 수 있는 년월의 최대값을 현재년월로 지정
		var now = new Date().toISOString().substring(0, 7);
		
		//yearMonth 클래스를 갖고 있는 input[type=month] 의 최대값을 현재년월로 지정
		$(".yearMonth").attr("max", now);
		
		//검색안한 default 상태일때 보여지는 날짜를 현재년월로 지정
		$("#defaultYearMonth").val(now);
		
		//검색한 월이든 현재월이든 만약 월매출이 없는 경우에는 id가 yearMonth인 span에 값이 없을 것이기 때문에 input[name=yearMonth]에서
		//value를 가져와서 찍어준다.
		if(!$("#yearMonth").text()) {
			
			var yearMonth = $("input[name=yearMonth]").val();
			$("#yearMonth").text(yearMonth);
		}
		
		//만약 연매출이 없는 해면 상단에 연매출로 불러온 값이 없기 때문에 id가 year인 span에 아무 내용도 없게된다.
		//그래서 그런 상황일 경우 input[name=yearMonth]의 value에서 year부분만 잘라서 찍어주는것.
		if(!$("#year").text()) {
			
			var year = $("input[name=yearMonth]").val().substring(0, 4);
			$("#year").text(year);
		}
		
		
	})
</script>

<div class="outbox">

	<h2>전체 매출현황</h2>
	
	
	
	<br>
	
	<table border="1">
		<tr>
			<th><span id="year">${yearSales.year}</span>년 매출액</th>
			<th><span id="yearMonth">${monthSales.yearMonth}</span>월 매출액</th>
		</tr>
		<tr>
			<c:if test="${yearSales.yearsales != null}">
				<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${yearSales.yearsales}"/></td>
			</c:if>
			
			<c:if test="${yearSales.yearsales == null}">
				<td>￦0</td>
			</c:if>
			
			<c:if test="${monthSales.salesForMonth != null}">
				<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${monthSales.salesForMonth}"/></td>
			</c:if>
			<c:if test="${monthSales.salesForMonth == null}">
				<td>￦0</td>
			</c:if>
		</tr>
	</table>
	
	<br>
	
	<div class="row">
		<form action="total" method="get">
			<c:if test="${yearMonth != null}">
				<input type="month" class="yearMonth" name="yearMonth" value="${yearMonth}">
			</c:if>
			<c:if test="${yearMonth == null}">
				<input type="month" class="yearMonth" id="defaultYearMonth" name="yearMonth">
			</c:if>
			
			<input type="submit" id="searchBtn" value="검색">
		</form>
	</div>
	
	<br>
	
	<table class="swTable">
		<tr>
			<th>날짜</th>
			<th>일매출</th>
			<th>월매출</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="3">매출액이 없습니다..</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="adminClassorderVO">
						<tr>
							<td>${adminClassorderVO.salesdate}</td>
							<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminClassorderVO.daysales}"/></td>
							<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminClassorderVO.monthsales}"/></td>
						</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
</div>


<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>