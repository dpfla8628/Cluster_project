<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       

<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>
		
	a{
		color:black;
	}
</style>

<script>

	$(function(){
		
		$("#classMenu").next("ul").slideDown();
		
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
	<h2>오픈 예정 클래스</h2>
	
	<div class="row">
		<form action="comingSoonClass" method="get">
			<select name="type">
				<c:if test="${type != null && type == 'class_name'}">
					<option value="class_name" selected>클래스명</option>
					<option value="member_nick">크리에이터</option>
				</c:if>
				<c:if test="${type != null && type == 'member_nick'}">
					<option value="class_name">클래스명</option>
					<option value="member_nick" selected>크리에이터</option>
				</c:if>
				<c:if test="${type == null}">
					<option value="class_name">클래스명</option>
					<option value="member_nick">크리에이터</option>
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
	
	<select style=float:right;>
		<option>빠른 순</option>
		<option>늦은 순</option>
	</select>
	
	<br>
	
	<table class="swTable">
		<tr>
			<th>No.</th>
			<th>클래스명</th>
			<th>크리에이터</th>
			<th>오픈일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">클래스가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="adminOffclassVO">
					<tr>
						<td>${adminOffclassVO.classNo}</td>
						<td>${adminOffclassVO.className}</td>
						<td>${adminOffclassVO.memberNick}</td>
						<td>${adminOffclassVO.classStart}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
	
	<!--페이지 네비게이션-->
	<div class="row center">
		<ul class="paginav center">
		
			<c:if test="${not empty list}">
				
				<li>
					<c:if test="${startNum != 1}">
						<c:if test="${isSearch}">
							<a href="comingSoonClass?p=${startNum - 1}&type=${type}&key=${key}">&lt; 이전</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="comingSoonClass?p=${startNum - 1}">&lt; 이전</a>
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
						<a href="comingSoonClass?p=${i}&type=${type}&key=${key}">${i}</a>
					</c:if>
					<c:if test="${!isSearch}">
						<a href="comingSoonClass?p=${i}">${i}</a>
					</c:if>		
						</li>	
				</c:forEach>
			
				
				<li>
					<c:if test="${pageSize > endNum}">	
						<c:if test="${isSearch}">
							<a href="comingSoonClass?p=${endNum + 1}&type=${type}&key=${key}">다음 &gt;</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="comingSoonClass?p=${endNum + 1}">다음 &gt;</a>
						</c:if>
					</c:if>
				</li>
				
			</c:if>
		</ul>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>
