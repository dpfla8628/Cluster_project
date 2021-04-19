<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		 $(".sendBtn").on("click", function(){
 			
			 if($(".classQ").val() == 0){
				 alert("내용 입력바랍니다");
				 return false;
			 }
			 else if(confirm("문의 등록 완료하시겠습니까?")){
				  close()
			  }
			 else{
				 return false
			 }
		 })
		 
		 
	})
</script> 
    <style>
        .outBox {
            border: 1px solid #ffc107;
            width: 400px;
            height: 500px;
			margin: auto 0.5rem;
            
        }

     
       .classQ {
            width: 350px;
            height: 400px;
            resize: none;
            margin: auto 1rem;
            border : 1px solid lightgray;
        } 

        .sendBtn {
            width: 355px;
            height: 40px;
            border: none;
            margin: 0.5rem 1rem;

        }
       
    </style>
</head>
<body>
	<div class="outBox">
         <form:form modelAttribute="qna" action="${memberLogIn.memberNo}" methos="POST">
           <div class="questionForm">
            <input type="hidden" name="classNo" value="${offClass.classNo}">
            <input type="hidden" name="memberNo" value="${memberLogIn.memberNo}">
            <br>
            <div>
                <textarea class="classQ" name="classQ" placeholder="문의 내용"></textarea>
            </div>
            <input type="submit" class="sendBtn" value="문의하기">
            </div>
    </form:form>
 </div>
</body>
</html>