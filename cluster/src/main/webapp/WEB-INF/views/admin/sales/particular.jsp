<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<script>
	
	$(function(){
		
		$("#salesMenu").next("ul").slideDown();
		
		//끝날짜의 값을 오늘 날짜로 설정
		$("#endDate").val(new Date().toISOString().substring(0, 10));
		
		//시작날짜와 끝날짜를 설정할 수 있는 최대값을 오늘날짜로 제한
		$("#startDate, #endDate").attr("max", $("#endDate").val());
		
		//검색 버튼 클릭시
		$("#searchBtn").click(function(e){
			
			e.preventDefault();
			
			var endDateStr= $("#endDate").val();
			var startDateStr = $("#startDate").val();
			
			var endArr = endDateStr.split('-');
			var startArr = startDateStr.split('-');
			
			
			var endDate = new Date(endArr[0], endArr[1]-1, endArr[2]);
			var startDate = new Date(startArr[0], startArr[1]-1, startArr[2]);
			
			
			var dateDiff = (endDate.getTime() - startDate.getTime()) / 1000 / 60 / 60 / 24;
				
			//두 날짜의 차이 일수가 0보다 작거나 숫자가 아니라면
			if(dateDiff < 0 || isNaN(dateDiff)) {
				alert("기간을 올바르게 설정해주세요.");
				return;
			}
			
			else{
				console.log(dateDiff);
			}
			
			var optionValue = $("#lecture").val();
			
			console.log(optionValue);
			
			$(".swTable").children().children().find(".lectureName").text(optionValue);
			
		})
		
	})
	
</script>

<div class="outbox">

	<h2>클래스별 매출현황</h2>
	
	<input type="date" id="startDate">
	~
	<input type="date" id="endDate">
	
	<br><br>
	
	<select id="lecture">
		<option>요리 잘하는법</option>
		<option>근육맨 되는법</option>
	</select>
	
	<button id="searchBtn">검색</button>
	
	<br><br><br>
	
	<table class="swTable">
		<tr>
			<th>날짜</th>
			<th>연매출(전체)</th>
			<th class="lectureName"></th>
			<th>월매출(전체)</th>
			<th class="lectureName"></th>
			<th>일매출(전체)</th>
			<th class="lectureName"></th>
		</tr>
		<c:choose>
			<c:when test="${false}">
				<tr>
					<td colspan="7">검색결과가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td>2021-03-03</td>
					<td>\5,000</td>
					<td>\1,000</td>
					<td>\1,000</td>
					<td>\200</td>
					<td>\100</td>
					<td>\20</td>
				</tr>
				<tr>
					<td>2021-03-02</td>
					<td>\5,000</td>
					<td>\1,000</td>
					<td>\1,000</td>
					<td>\200</td>
					<td>\100</td>
					<td>\20</td>
				</tr>
				<tr>
					<td>2021-03-01</td>
					<td>\5,000</td>
					<td>\1,000</td>
					<td>\1,000</td>
					<td>\200</td>
					<td>\100</td>
					<td>\20</td>
				</tr>
			</c:otherwise>
		</c:choose>
	
	</table>
	
	
	

</div>




<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>    
