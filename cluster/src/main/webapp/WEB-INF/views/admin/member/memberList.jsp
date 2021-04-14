<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>

	a{
		color:black;
	}
	
</style>


<script>
	
	$(function(){
		
		$("#memberMenu").next("ul").slideDown();
		
		//검색버튼 클릭시 값이 key값이 없으면 전송x
		$("#searchBtn").click(function(){
			
			var key = $("input[name=key]").val();
			
			if(!key) {
				alert("검색어를 입력해주세요!");
				$("input[name=key]").focus();
				return false;
			}
		})	
	});
	

</script>

<div class="outbox">
	<h2>회원 목록</h2>
	
	<div class="row">
		<form action="memberList" method="get">
			<select name="type">
				<c:if test="${type != null && type == 'member_id'}">
					<option value="member_id" selected>아이디</option>
					<option value="member_nick">닉네임</option>
				</c:if>
				<c:if test="${type != null && type == 'member_nick'}">
					<option value="member_id">아이디</option>
					<option value="member_nick" selected>닉네임</option>
				</c:if>
				<c:if test="${type == null}">
					<option value="member_id">아이디</option>
					<option value="member_nick">닉네임</option>
				</c:if>
			</select>
			<c:if test="${key != null}">
				<input type="text" name="key" value="${key}">
			</c:if>
			<c:if test="${key == null}">
				<input type="text" name="key" placeholder="검색어를 입력하세요.">
			</c:if>
			<input type="submit" id="searchBtn" value="검색">
		</form>
	</div>
	
	
	<br>
	
	<div class="row center">
		<table class="swTable">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>회원등급</th>
				<th>구매내역</th>
				<th>회원정보</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="6">검색결과가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="adminMemberVO">
						<tr>
							<td>${adminMemberVO.memberNo}</td>
							<td>${adminMemberVO.memberId}</td>
							<td>${adminMemberVO.memberNick}</td>
							<td>${adminMemberVO.memberAuth}</td>
							<td>${adminMemberVO.orderCount}</td>
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
							<a href="memberList?p=${startNum - 1}&type=${type}&key=${key}">&lt; 이전</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="memberList?p=${startNum - 1}">&lt; 이전</a>
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
						<a href="memberList?p=${i}&type=${type}&key=${key}">${i}</a>
					</c:if>
					<c:if test="${!isSearch}">
						<a href="memberList?p=${i}">${i}</a>
					</c:if>		
						</li>	
				</c:forEach>
			
				
				<li>
					<c:if test="${pageSize > endNum}">	
						<c:if test="${isSearch}">
							<a href="memberList?p=${endNum + 1}&type=${type}&key=${key}">다음 &gt;</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="memberList?p=${endNum + 1}">다음 &gt;</a>
						</c:if>
					</c:if>
				</li>
				
			</c:if>
		</ul>
	</div>

</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>
