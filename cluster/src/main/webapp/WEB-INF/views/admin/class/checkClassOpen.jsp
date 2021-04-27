<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>
		
	a{
		color:black;
	}
	.outbox{
		width:1200px;
	}
	#searchBtn{
		margin-left: 0.5rem;
	    height: 40px;
	    background: #fccc5b;
	    color: black;
	    cursor: pointer;
	    width: 50pt;
	    font-size: 15px;
	    border-color: #fccc5b;
	    
	}
	
	.searchBox{
		padding: 0.5rem;
    	height: 40px;
    	width: 30%;
    	border: 0.5px solid lightgray;
    	font-size: 15px;
	}
	#selectBox{
		padding: 0.5rem;
    	height: 40px;
    	width: 20%;
    	border: 0.5px solid lightgray;
    	font-size: 15px;
	}
	.swTable{
		margin-top: 2rem;
	}
</style>

<script>

	$(function(){
		
		$("#classMenu").next("ul").slideDown();
		
		//검수하기 버튼 클릭시
		$("#checkBtn").click(function(){
			
			var classNo = $("#classNo").text();
			self.location = "checkClassOpenDetail?classNo="+classNo;
			
		});
		
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
	<div class="row">
		<h2>크리에이터 클래스 오픈 검수</h2>
	</div>
	
	<div class="row">
		<form action="checkClassOpen" method="get">
			<select name="type" id="selectBox">
				<c:if test="${type != null && type == 'member_id'}">
					<option value="member_id" selected>아이디</option>
					<option value="member_nick">크리에이터</option>
				</c:if>
				<c:if test="${type != null && type == 'member_nick'}">
					<option value="member_id">아이디</option>
					<option value="member_nick" selected>크리에이터</option>
				</c:if>
				<c:if test="${type == null}">
					<option value="member_id">아이디</option>
					<option value="member_nick">크리에이터</option>
				</c:if>
			</select>
			<c:if test="${key != null}">
				<input type="text" class="searchBox" name="key" value="${key}">
			</c:if>
			<c:if test="${key == null}">
				<input type="text" class="searchBox" name="key" placeholder="검색어를 입력하세요.">
			</c:if>
			<input type="submit" id="searchBtn" value="검색">
		</form>
	</div>
	
	
	<!-- 게시판 페이징 구현 -->
	<div class="row center">
		<table class="swTable">
			<tr>
				<th>No.</th>
				<th>신청일</th>
				<th>아이디</th>
				<th>크리에이터</th>
				<th>상태</th>
				<th>검수</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="6">검색결과가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="adminOffclassVO">
						<tr>
							<td id="classNo">${adminOffclassVO.classNo}</td>
							<td>${adminOffclassVO.classRegdate}</td>
							<td>${adminOffclassVO.memberId}</td>
							<td>${adminOffclassVO.memberNick}</td>
							<c:if test="${adminOffclassVO.classCheck == '반려'}">
								<td>반려</td>
							</c:if>
							<c:if test="${adminOffclassVO.classCheck == '검수완료'}">
								<td>승인</td>
							</c:if>
							<c:if test="${adminOffclassVO.classCheck == '검수대기'}">
								<td>검수대기</td>
							</c:if>
							
							<c:if test="${adminOffclassVO.classCheck == '반려'}">
								<td>검수완료</td>
							</c:if>
							<c:if test="${adminOffclassVO.classCheck == '검수완료'}">
								<td>검수완료</td>
							</c:if>
							<c:if test="${adminOffclassVO.classCheck == '검수대기'}">
								<td><button type="submit" id="checkBtn">검수하기</button></td>		
							</c:if>
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
							<a href="checkClassOpen?p=${startNum - 1}&type=${type}&key=${key}">&lt; 이전</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="checkClassOpen?p=${startNum - 1}">&lt; 이전</a>
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
						<a href="checkClassOpen?p=${i}&type=${type}&key=${key}">${i}</a>
					</c:if>
					<c:if test="${!isSearch}">
						<a href="checkClassOpen?p=${i}">${i}</a>
					</c:if>		
						</li>	
				</c:forEach>
			
				
				<li>
					<c:if test="${pageSize > endNum}">	
						<c:if test="${isSearch}">
							<a href="checkClassOpen?p=${endNum + 1}&type=${type}&key=${key}">다음 &gt;</a>
						</c:if>
						<c:if test="${!isSearch}">
							<a href="checkClassOpen?p=${endNum + 1}">다음 &gt;</a>
						</c:if>
					</c:if>
				</li>
				
			</c:if>
		</ul>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>