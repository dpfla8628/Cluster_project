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
	.outbox{
		width:1200px;
	}
	.input{
		width:50%;
		margin-bottom:1rem;
   		height:50px;
    	font-size:15px;
	}
	#editBtn{
		cursor:pointer;
		background-color:#fccc5b;
		border-color: #fccc5b;
	}
</style>

<script>
	
	$(function(){
		
		//수정하기 버튼 클릭시
		$("#editBtn").click(function(){
			
			var formObj = $("#classCategory");
			
			var confirm = window.confirm("정말로 수정하시겠습니까?");
			
			if(!confirm) {
				
				return false;
			}
			else {
				formObj.submit();
			}
		
		});
		
		
	});


</script>

<div class="outbox center">
	<div class="row">
		<h2>카테고리 수정</h2>
	</div>
	<div class="row">
		<form:form modelAttribute="classCategory" action="edit" method="post">
			<form:hidden path="categoryNo"/>
			<div class="row">
				<form:input type="text" class="input" path="categoryBig"/>
			</div>
			<div class="row">
				<form:input type="text" class="input" path="categorySmall"/>
			</div>
		</form:form>
		<div class="row">
			<button type="submit" id="editBtn" class="input">수정하기</button>
		</div>
	</div>

</div>




<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>
