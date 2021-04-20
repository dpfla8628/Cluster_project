<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>


<style>
	a{
		color:black;
	}
</style>

<script>
	
	$(function(){
		
		$("#creatorMenu").next("ul").slideDown();
		
		//선택할 수 있는 날짜의 최대값을 현재날짜로 지정
		var now = new Date().toISOString().substring(0, 10);
		
		//date 클래스를 갖고 있는 input[type=date]의 최대값을 현재날짜로 지정
		$(".date").attr("max", now);
		
		//검색안한 default 상태일때 보여지는 날짜를 오늘 날짜로 지정
		$("#defaultDate").val(now);
		
		
		//'정산하기' 버튼 클릭시 비동기로 order_calc값 '정산완료'로 업데이트 하기
		$("#calcBtn").click(function(){
			
			//날짜값 가져오기
			var date = $(".date").val();
			
			var confirm = window.confirm("해당일의 정산을 완료하시겠습니까?");
			
			if(!confirm) {
				
				return false;
			}
			else {
				
				$.ajax({
					url: "/admin/creator/calcIncome",
					type: "POST",
					data: {
						date : date
					},
					success: function(date) {
						
						alert(date+" 정산이 완료되었습니다.");
						
						//'정산완료'로 업데이트
						$(".orderCalc").text("정산완료");
						//'정산하기' 버튼 비활성화
						$("#calcBtn").attr("disabled", "disabled");
						
					}
				
				
				});
			}
			
		});
		
		
		//목록 맨윗줄의 상태가 '정산완료' or 정산할 건이 없으면 '정산하기' 버튼 비활성화 
		if($(".orderCalc").first().text() == '정산완료' || ${empty list}) {
			
			$("#calcBtn").attr("disabled", "disabled");
		}
		
		
});

</script>

<div>

	<h2>크리에이터 정산</h2>
	
	<form action="income" method="get">
		<c:if test="${date != null}">
			<input type="date" class="date" name="date" value="${date}">
		</c:if>
		<c:if test="${date == null}">
			<input type="date" class="date" name="date" id="defaultDate">
		</c:if>
		
		<br><br>
		
		<select name="type">
			<c:if test="${type == 'member_nick'}">
				<option value="member_nick" selected>크리에이터</option>
				<option value="class_name">클래스</option>
			</c:if>
			<c:if test="${type == 'class_name'}">
				<option value="member_nick">크리에이터</option>
				<option value="class_name" selected>클래스</option>
			</c:if>
			<c:if test="${type == null}">
				<option value="member_nick">크리에이터</option>
				<option value="class_name">클래스</option>
			</c:if>
			
		</select>
		
		<c:if test="${key != null}">
			<input type="text" name="key" placeholder="검색어를 입력하세요." value="${key}">
		</c:if>
		<c:if test="${key == null}">
			<input type="text" name="key" placeholder="검색어를 입력하세요.">
		</c:if>
		
		<input type="submit" id="searchBtn" value="검색">
	</form>
	
	
	<button type="submit" id="calcBtn" style="float:right;">정산하기</button>
	
	
	<br><br>
	
	<!-- 정산 관련 화면 -->
	<div class="row center">
		<table class="swTable">
			<tr>
				<th>크리에이터 번호</th>
				<th>크리에이터</th>
				<th>클래스</th>
				<th>날짜</th>
				<th>매출액</th>
				<th>정산금액</th>
				<th>상태</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="7">정산 건이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="adminCreatorVO">
						<tr>
							<td>${adminCreatorVO.creatorNo}</td>
							<td>${adminCreatorVO.creatorNick}</td>
							<td>${adminCreatorVO.className}</td>
							<td>${adminCreatorVO.orderDate}</td>
							<td>
								<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminCreatorVO.classSales}"/>
							</td>
							<td>
								<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminCreatorVO.creatorIncome}"/>
							</td>
							<td class="orderCalc">${adminCreatorVO.orderCalc}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	
	
</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>