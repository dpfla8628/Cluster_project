<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>
	
</style>

<script>
	
	$(function(){
		
		$("#creatorMenu").next("ul").slideDown();
		
		
		//검색버튼 클릭시 값이 key값이 없으면 전송x
		$("#searchBtn").click(function(){
			
			var key = $("input[name=key]").val();
			
			if(!key) {
				alert("검색어를 입력해주세요!");
				$("input[name=key]").focus();
				return false;
			}
		});
		
	});

	
</script>

<div class="outbox">

	<h2>크리에이터 명단</h2>
	
	<form action="creatorList" method="get">
		<c:if test="${key != null}">
			<input type="text" name="key" value="${key}">
		</c:if>
		<c:if test="${key == null}">
			<input type="text" name="key" placeholder="크리에이터명을 입력하세요.">
		</c:if>
		<input type="submit" id="searchBtn" value="검색">
	</form>
	
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
							<td>
								<c:if test="${adminCreatorVO.countIng == 0}">
									${adminCreatorVO.countIng}건
								</c:if>
								<c:if test="${adminCreatorVO.countIng != 0}">
									<a href="/admin/class/openClass?type=member_nick&key=${adminCreatorVO.creatorNick}">
										${adminCreatorVO.countIng}건
									</a>
								</c:if>
							</td>
							<td>
								<c:if test="${adminCreatorVO.countComingSoon == 0}">
									${adminCreatorVO.countComingSoon}건
								</c:if>
								<c:if test="${adminCreatorVO.countComingSoon != 0}">
									<a href="/admin/class/comingSoonClass?type=member_nick&key=${adminCreatorVO.creatorNick}">
										${adminCreatorVO.countComingSoon}건
									</a>
								</c:if>
							</td>
							<td>
								<c:if test="${adminCreatorVO.countEnd == 0}">
									${adminCreatorVO.countEnd}건
								</c:if>
								<c:if test="${adminCreatorVO.countEnd != 0}">
									<a href="/admin/class/closedClass?type=member_nick&key=${adminCreatorVO.creatorNick}">
										${adminCreatorVO.countEnd}건
									</a>
								</c:if>	
							</td>
							<td><a href="#">조회</a></td>
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
							<a href="creatorList?p=${startNum - 1}&type=${type}&key=${key}">&lt; 이전</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="creatorList?p=${startNum - 1}">&lt; 이전</a>
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
						<a href="creatorList?p=${i}&type=${type}&key=${key}">${i}</a>
					</c:if>
					<c:if test="${!isSearch}">
						<a href="creatorList?p=${i}">${i}</a>
					</c:if>		
						</li>	
				</c:forEach>
			
				
				<li>
					<c:if test="${pageSize > endNum}">	
						<c:if test="${isSearch}">
							<a href="creatorList?p=${endNum + 1}&type=${type}&key=${key}">다음 &gt;</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="creatorList?p=${endNum + 1}">다음 &gt;</a>
						</c:if>
					</c:if>
				</li>
				
			</c:if>
		</ul>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>