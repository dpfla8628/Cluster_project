<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>

</style>

<script>
	
	$(function(){
		
		$("#creatorMenu").next("ul").slideDown();
		
	});

</script>

<div>

	<h2>크리에이터 정산</h2>
	<input type="text" placeholder="크리에이터명을 입력하세요.">
	<button>검색</button>
	
	<!-- 정산 관련 화면 -->
	
</div>

<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>