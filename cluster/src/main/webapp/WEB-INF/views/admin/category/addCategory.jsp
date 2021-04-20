<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>



<style>
	.outbox{
		width:500px;
		
	}
	.input {
		margin:0.5rem 0;
	
	}
</style>


<script>

	$(function(){
		
		$("#categoryMenu").next("ul").slideDown();
		
	
		
		
		//카테고리 대분류, 소분류 입력시 데이터베이스에 있는 목록 나타내주기
		
		//cf) 배열에 넣을때 ${i}이 문자열 일 경우 "" 안에 넣어줘야 작동함.
		var categoryBigArr = [];
		var categorySmallArr = [];
		
		<c:forEach items="${categoryBigList}" var="i">
			categoryBigArr.push("${i}");
		</c:forEach>
		
		<c:forEach items="${categorySmallList}" var="i">
			categorySmallArr.push("${i}");
		</c:forEach>
		
		console.log(categoryBigArr);
		console.log(categorySmallArr);
		
		//대분류
		$("input[name=categoryBig]").autocomplete({  
	         source : categoryBigArr,   
	         open: function(event, ui) {
	             $(this).autocomplete("widget").css({
	                 "width": 500
	             });
	         },
	         autoFocus: true,
	         classes: { 
	             "ui-autocomplete": "highlight"
	         },
	         delay: 0,   
	     });
		
		//소분류
		$("input[name=categorySmall]").autocomplete({  
	         source : categorySmallArr,   
	         open: function(event, ui) {
	             $(this).autocomplete("widget").css({
	                 "width": 500
	             });
	         },
	         autoFocus: true,
	         classes: { 
	             "ui-autocomplete": "highlight"
	         },
	         delay: 0,   
	     });
		
		
		//등록버튼 클릭시 비동기로 처리
		$("#registBtn").click(function(e){
			
			var categoryBig = $("input[name=categoryBig]").val();
			var categorySmall = $("input[name=categorySmall]").val();
			
			var confirm = window.confirm("정말로 등록하시겠습니까?");
			
			if(!confirm) {
				e.preventDefault();
			}
			
			else {
				$.ajax({
					url: "/admin/category/addCategory",
					type: "POST",
					data: {
						categoryBig : categoryBig,
						categorySmall : categorySmall
					},
					success: function(resp) {
						if(resp == 'fail') {
							alert("이미 존재하는 카테고리입니다.");
							$("#categoryCheck").text("이미 존재하는 카테고리입니다.");
						}
						else {
							$("#categoryCheck").text("");
							$(".category").val("");
							$(".countBig").text(0);
							$(".countSmall").text(0);
							alert("등록에 성공하였습니다.");
						}
					}
					
				});
			}
			
		
		});
		
		//카테고리 대분류 글자수 제한
		$("input[name=categoryBig]").on("input", function(){
			
			var count = $(this).val().length;
			
			while(count > 10) {
				var text = $(this).val();
				text = text.substring(0, text.length-1);
				$(this).val(text);
				
				count--;
			}
			
			$(".countBig").text(count);
			
		});
		//카테고리 소분류 글자수 제한
		$("input[name=categorySmall]").on("input", function(){
			
			var count = $(this).val().length;
			
			while(count > 10) {
				var text = $(this).val();
				text = text.substring(0, text.length-1);
				$(this).val(text);
				
				count--;
			}
			
			$(".countSmall").text(count);
			
		});
		
		
			 
		
});

</script>

<div class="outbox">

	<h2>카테고리 추가</h2>
	
	<div class="row">
		
		<label>대분류</label>
		<span class="countBig">0</span> / 10
		<input type="text" class="input category" name="categoryBig" placeholder="대분류를 입력하세요." required>
				
		<label>소분류</label>
		<span class="countSmall">0</span> / 10
		<input type="text" class="input category" name="categorySmall" placeholder="소분류를 입력하세요." required>
			
		<span id="categoryCheck" style="color:red;"></span>
			
		<button type="submit" class="input" id="registBtn">등록하기</button>
	</div>
	

</div>



<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>    
    
