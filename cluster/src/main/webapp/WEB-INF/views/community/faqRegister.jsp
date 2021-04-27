<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<head>
<meta charset="UTF-8">
<title>1:1문의 등록</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){ 
		
		 $(".faqBtn").on("click", function(){
 			
			 if($(".faqTitle").val() == 0 || $(".faqContent").val()==0){
				 alert("공백없이 입력해주세요");
				 return false;
			 }
			 else if(confirm("등록 완료하시겠습니까?")){
					var form = $("#faq").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/community/faqRegister",  
			            data : form,  
 			            success : function(data){
 			            	alert("등록 완료!");
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

        .faqBtn {
            width: 650px;
            padding: 1rem;
            border: 1px solid #ffc107;
            background-color: transparent;
            font-size: 20px;
            font-weight: lighter;
        }

    </style>
</head>

<body>
    <div class="outbox">
        <h1>고객센터</h1> <a href="/login/">로그인</a> <a href="/login/logout">로그아웃</a> 멤버번호 : ${member.memberNo} / 권한 : ${member.memberAuth}
        <div class="inBox">
            <br>
            <div class="faqFormBox">
                <form id="faq">
                	<input type="hidden" name="memberNo" value="${member.memberNo}">
                    <input type="text" class="faqTitle" maxlength="50" name="faqTitle" placeholder="제목">
                    <br><br>
                    <textarea class="faqContent" name="faqContent" placeholder="내용"></textarea>
                    <br><br>
                    <button type="button" class="faqBtn">등록</button>
                </form>
            </div>
            <br>
        </div>
        </div>
</body>
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>

</html>
