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
		padding: 0 21rem;
		margin: 0rem 10rem 0 10rem;
	}
	.input{
		margin-bottom:1rem;
   		height:50px;
    	font-size:18px;
	}
	#editBtn{
		cursor:pointer;
		background-color:#ffc107;
		border-color: #ffc107;
	}
	#edit{
		color:#fff;
	}
</style>

<script>
	
	$(function(){
		
		//카테고리 글자수 제한
		$(".category").on("input", function(){
			
			var count = $(this).val().length;
			
			while(count > 10) {
				var text = $(this).val();
				text = text.substring(0, text.length-1);
				$(this).val(text);
				
				count--;
			}
			
			
		});
		
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

<div class="outbox">
	<div class="row">
		<h2>카테고리 수정</h2>
	</div>
	<div class="row">
		<form:form modelAttribute="classCategory" action="edit" method="post">
			<form:hidden path="categoryNo"/>
			<div class="row">
				<form:input type="text" class="input category" path="categoryBig"/>
			</div>
			<div class="row">
				<form:input type="text" class="input category" path="categorySmall"/>
			</div>
		</form:form>
		<div class="row">
			<button type="submit" id="editBtn" class="input">수정하기</button>
		</div>
	</div>

</div>




<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>
