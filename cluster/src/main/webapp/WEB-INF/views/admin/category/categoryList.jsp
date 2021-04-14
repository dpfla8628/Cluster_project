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
		
		$("#categoryMenu").next("ul").slideDown();
		
		//검색버튼 클릭시 값이 key값이 없으면 전송x
		$("#searchBtn").click(function(){
			
			var key = $("input[name=key]").val();
			
			if(!key) {
				alert("검색어를 입력해주세요!");
				$("input[name=key]").focus();
				return false;
			}
		});	
		
		
		//카테고리 수정
		$(".editBtn").click(function(){
			
			//수정버튼을 클릭한 카테고리의 번호 가져오기
			var categoryNo = $(this).parent().prev().prev().prev().text();
			
			location.href = "edit?categoryNo="+categoryNo;
			
		});
		
		//카테고리 삭제
		$(".deleteBtn").click(function(){
			
			//삭제버튼을 클릭한 카테고리의 번호 가져오기
			var categoryNo = $(this).parent().prev().prev().prev().text();
			
			var confirm = window.confirm("정말로 삭제하시겠습니까?");
			
			if(!confirm) {
				
				return false;
			}
			else {
				location.href = "delete?categoryNo="+categoryNo;
			}
			
			
		});
		
		
		
		
		
});
	

</script>

<div>

	<h2>카테고리 목록</h2>
	
	<div class="row">
		<form action="categoryList" method="get">
			<select name="type">
				<c:if test="${type != null && type == 'category_big'}">
					<option value="category_big" selected>대분류</option>
					<option value="category_small">소분류</option>
				</c:if>
				<c:if test="${type != null && type == 'category_small'}">
					<option value="category_big">대분류</option>
					<option value="category_small" selected>소분류</option>
				</c:if>
				<c:if test="${type == null}">
					<option value="category_big">대분류</option>
					<option value="category_small">소분류</option>
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
	
	<!-- 카테고리 목록 -->
	<div class="row center">
		<table class="swTable">
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 대분류</th>
				<th>카테고리 소분류</th>
				<th>카테고리 관리</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4">검색결과가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="classCategory">
						<tr>
							<td>${classCategory.categoryNo}</td>
							<td>${classCategory.categoryBig}</td>
							<td>${classCategory.categorySmall}</td>
							<td>
								<button class="editBtn">수정</button>
								<button class="deleteBtn">삭제</button>
							</td>
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
							<a href="categoryList?p=${startNum - 1}&type=${type}&key=${key}">&lt; 이전</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="categoryList?p=${startNum - 1}">&lt; 이전</a>
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
						<a href="categoryList?p=${i}&type=${type}&key=${key}">${i}</a>
					</c:if>
					<c:if test="${!isSearch}">
						<a href="categoryList?p=${i}">${i}</a>
					</c:if>		
						</li>	
				</c:forEach>
			
				
				<li>
					<c:if test="${pageSize > endNum}">	
						<c:if test="${isSearch}">
							<a href="categoryList?p=${endNum + 1}&type=${type}&key=${key}">다음 &gt;</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="categoryList?p=${endNum + 1}">다음 &gt;</a>
						</c:if>
					</c:if>
				</li>
				
			</c:if>
		</ul>
	</div>


</div>





<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>