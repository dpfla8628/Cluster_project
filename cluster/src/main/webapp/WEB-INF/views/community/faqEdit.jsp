<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>
<head>
<meta charset="UTF-8">
<title>1:1문의 수정</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){ 
		
		 $(".editBtn").on("click", function(){
 			
			 if($(".faqTitle").val() == 0 || $(".faqContent").val()==0){
				 alert("공백없이 입력해주세요");
				 return false;
			 }
			 else if(confirm("수정 완료하시겠습니까?")){
					var edit = $("#faqEdit").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/community/faqEdit",  
			            data : edit,  
 			            success : function(data){
 			            	alert("수정 완료!");
 			            	window.location.href = "/community/faq";
 			            },
 			            error : function(data){
 			            	alert('글자 수 초과!')
 			            }
			        });
 
			  }
			 else{
				  return false
			 	}
		 })
		 $(".deleteBtn").on("click", function(){
			 if(confirm("삭제 하시겠습니까?")){
					var del = $("#faqEdit").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/community/faqDelete",  
			            data : del,  
			            success : function(data){
			            	window.location.href = "/community/faq";
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
        .outbox {
            border: 1px dotted gray;
            margin: 0 auto;
            text-align: center;
        }
 
        .faqFormBox {
            margin-top: 0rem;
            width: 650px;
            margin: 0 auto;
        }

        .faqTitle {
            width: 650px;
            padding: 1rem;
        }

        .faqContent {
            resize: none;
             height: 600px;
            width: 650px;
            padding: 1rem;
         }

        .editBtn {
            width: 650px;
            padding: 1rem;
            border: 1px solid #ffc107;
            background-color: transparent;
            font-size: 20px;
            font-weight: lighter;
        }
        .deleteBtn{
 			width: 50px;
 			padding: 5px;
 			background-color: transparent;
 			float : right;
 			border : 1px solid lightgray;
 			margin : 0 0 10px 10px;      
        }

    </style>
</head>

<body>
    <div class="outbox">
    권한 : ${member.memberAuth}
        <h1>고객센터</h1> 
        <h4>FAQ 수정</h4>  
        <div class="inBox">
            <br>
            <div class="faqFormBox">
                <form id="faqEdit">
                	<input type="hidden" name="faqNo" value="${faq.faqNo}">
                	<button type="submit" class="deleteBtn">삭제</button>
                     <input type="text" class="faqTitle" maxlength="50" name="faqTitle" placeholder="제목" value="${faq.faqTitle}">
                    <br><br>
                    <textarea class="faqContent" name="faqContent" placeholder="내용">${faq.faqContent}</textarea>
                    <br><br>
                    <button type="button" class="editBtn">수정</button>
                </form>
            </div>
            <br>
        </div>
        </div>
</body>
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>
</html>
