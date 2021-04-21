<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/class.css">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		 $(".sendBtn").on("click", function(){
 			
			 if($(".classQ").val() == 0){
				 alert("내용 입력바랍니다");
				 return false;
			 }
			 else if(confirm("문의 등록 완료하시겠습니까?")){
					var form = $("#qnaForm").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/class_detail/classQuestion/${offClass.classNo}/${member.memberNo}",  
			            data : form,  
 			            success : function(data){
 			            	alert("문의 완료! \n문의 내역은 마이페이지에서 확인 가능합니다");
 			            	 window.close(); 
			            }
			        });
 
			  }
			 else{
				 return false
			 }
		 })
		 
		 
	})
</script> 
    <style>

       
    </style>
</head>
<body>
	<div class="qnaOutBox">
         <form id="qnaForm">
           <div class="questionForm">
            <input type="hidden" name="classNo" value="${offClass.classNo}">
            <input type="hidden" name="memberNo" value="${member.memberNo}">
            <br>
            <div>
                <textarea class="classQ" name="classQ" placeholder="문의 내용"></textarea>
            </div>
            <input type="submit" class="sendBtn" value="문의하기">
            </div>
    </form>
 </div>
</body>
</html>