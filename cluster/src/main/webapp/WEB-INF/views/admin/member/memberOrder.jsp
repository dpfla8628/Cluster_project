<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>

	a{
		color:black;
	}
	
	.outbox{
		padding: 0 12rem;
	}
	#searchBtn{
		margin-left: 0.5rem;
	    height: 40px;
	    background: #ffc107;
	    color: black;
	    cursor: pointer;
	    width: 50pt;
	    font-size: 15px;
	    border-color: #ffc107;
	}
	.searchBox{
		padding: 0.5rem;
    	height: 40px;
    	width: 25%;
    	border: 0.5px solid lightgray;
    	font-size: 15px;
	}
	#selectBox{
		padding: 0.5rem;
    	height: 40px;
    	width: 15%;
    	border: 0.5px solid lightgray;
    	font-size: 15px;
	}
	.date{
		padding: 0.5rem;
    	height: 40px;
    	width: 15%;
    	border: 0.5px solid lightgray;
    	font-size: 15px;
	}
	.swTable{
		/*margin-top: 2rem;*/
	}
	#memberOrder{
		color:#fff;
	}
	
</style>

<script>

	$(function(){
		
		$("#memberMenu").next("ul").slideDown();
		
		//한국시간으로 반환해주기 위한 작업
		var offset = new Date().getTimezoneOffset() * 60000;
		var now = new Date(Date.now() - offset).toISOString().substring(0, 10);
		
		//date 클래스를 갖고 있는 input[type=date]의 최대값을 현재날짜로 지정
		$(".date").attr("max", now);
		
		
		//검색버튼 클릭시 
		$("#searchBtn").click(function(){
			
			var key = $("input[name=key]").val();
			var startDate = $("input[name=startDate]").val();
			var endDate = $("input[name=endDate]").val();
			
			//key값, startDate값, endDate값 중 하나라도 없으면 전송x
			if(!key && !startDate && !endDate) {
				alert("날짜 또는 검색어를 입력해주세요!");
				$("input[name=key]").focus();
				return false;
			}
			
			//기간 설정 이상하게 할때 ex) 2021-04-17 ~ 2021-04-15 
			if(startDate && endDate) {
				var endDateStr= endDate;
				var startDateStr = startDate;
				
				
				var endArr = endDateStr.split('-');
				var startArr = startDateStr.split('-');
				
				
				var endDate = new Date(endArr[0], endArr[1]-1, endArr[2]);
				var startDate = new Date(startArr[0], startArr[1]-1, startArr[2]);
				
				
				var dateDiff = (endDate.getTime() - startDate.getTime()) / 1000 / 60 / 60 / 24;
				

				//두 날짜의 차이 일수가 0보다 작거나 숫자가 아니라면
				if(dateDiff < 0 || isNaN(dateDiff)) {
					alert("기간을 올바르게 설정해주세요!");
					return false;
				}
			}
			
			
		});
		
		
		/*
		//'확인완료' 버튼을 클릭하면 비동기로  해당 주문건의 입금상태 '입금완료'로 변경처리 변경 처리
		$(".confirmBtn").click(function(){
			
			var orderNo = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
			
			var confirm = window.confirm("해당 주문의 입금을 확인하셨습니까?");
			
			if(!confirm) {
				return false;
			}
			else {
				$.ajax({
					url: "/admin/member/confirmPayment",
					type: "get",
					data: {
						orderNo : orderNo
					},
					success: function(orderNo) {
						
						alert("주문번호 "+orderNo+"번 입금확인완료!");
						
						$("."+orderNo).prev().text("입금완료");
						
						$("."+orderNo).text("입금확인");
						
					}
					
				});
			}
			
			
		});
		*/
		
});
</script>

<div class="outbox">
	<!-- 
	이용자가 주문하면  바로 강의를 지급해줌. 마이페이지에서 '입금전'이면 강의를 안보여주고 '입금완료'면
	안보여주는 식으로
	  -->
	  

	<h2>주문한 회원목록</h2>
	
	
	<div class="row">
		<form action="memberOrder" method="get">
			
			<c:if test="${startDate != null && endDate != null}">
				<input type="date" name="startDate" class="date" value="${startDate}"> ~ 
				<input type="date" name="endDate" class="date" value="${endDate}">
			</c:if>
			
			<c:if test="${startDate == null && endDate == null}">
				<input type="date" name="startDate" class="date"> ~ 
				<input type="date" name="endDate" class="date">
			</c:if>
			
			<select name="type" id="selectBox">
				<c:if test="${type == 'order_name'}">
					<option value="order_name" selected>입금자</option>
					<option value="member_no">회원번호</option>
				</c:if>
				<c:if test="${type == 'member_no'}">
					<option value="order_name">입금자</option>
					<option value="member_no" selected>회원번호</option>
				</c:if>
				<c:if test="${type == null}">
					<option value="order_name">입금자</option>
					<option value="member_no">회원번호</option>
				</c:if>
			</select>
			
			<c:if test="${key != null && key != ''}">
				<input type="text" class="searchBox" name="key" value="${key}">
			</c:if>
			<c:if test="${key == null || key == ''}">
				<input type="text" class="searchBox" name="key" placeholder="검색어를 입력하세요.">
			</c:if>
			<input type="submit" id="searchBtn" value="검색">
			
		</form>
	</div>
	
	
	<br>
	
	<div class="row center">
		<table class="swTable">
			<tr>
				<th>주문번호</th>
				<th>클래스</th>
				<th>회원번호</th>
				<th>입금자</th>
				<th>결제금액</th>
				<th>주문일</th>
				<th>상태</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="7">검색결과가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="adminClassorderVO">
						<tr>
							<td>${adminClassorderVO.orderNo}</td>
							<td>${adminClassorderVO.className}</td>
							<td>${adminClassorderVO.memberNo}</td>
							<td>${adminClassorderVO.orderName}</td>
							<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminClassorderVO.orderPrice}"/></td>
							<td><fmt:formatDate value="${adminClassorderVO.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${adminClassorderVO.orderOk}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	
	<!--페이지 네비게이션-->
	<div class="row center">
		<ul class="paginav center">
		
			<c:if test="${not empty list}">
				
				<li>
					<c:if test="${startNum != 1}">
						<c:if test="${isSearch}">
							<a href="memberOrder?p=${startNum - 1}&type=${type}&key=${key}&startDate=${startDate}&endDate=${endDate}">&lt; 이전</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="memberOrder?p=${startNum - 1}">&lt; 이전</a>
						</c:if>	
					</c:if>
				</li>
					
				
				<c:forEach var="i" begin="${startNum}" end="${endNum}" step="1">
					<c:if test="${p == i}">
						<li class="active">
					</c:if>
					<c:if test="${p != i}">
						<li>
					</c:if>
					<c:if test="${isSearch}">
						<a href="memberOrder?p=${i}&type=${type}&key=${key}&startDate=${startDate}&endDate=${endDate}">${i}</a>
					</c:if>
					<c:if test="${!isSearch}">
						<a href="memberOrder?p=${i}">${i}</a>
					</c:if>		
						</li>	
				</c:forEach>
			
				
				<li>
					<c:if test="${pageSize > endNum}">	
						<c:if test="${isSearch}">
							<a href="memberOrder?p=${endNum + 1}&type=${type}&key=${key}&startDate=${startDate}&endDate=${endDate}">다음 &gt;</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="memberOrder?p=${endNum + 1}">다음 &gt;</a>
						</c:if>
					</c:if>
				</li>
				
			</c:if>
		</ul>
	</div>


</div>





<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>