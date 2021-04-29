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
		
		 $(".QBtn").on("click", function(){
 			
			 if($(".questionTitle").val() == 0 || $(".questionQ").val()==0){
				 alert("공백없이 입력해주세요");
				 return false;
			 }
			 else if(confirm("문의 등록 완료하시겠습니까?")){
					var form = $("#question").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/community/question",  
			            data : form,  
 			            success : function(data){
 			            	alert("문의 완료!");
 			            	window.location.href = "/community/qList";
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
             margin: 0 auto;
            text-align: center;
        }

        .inBox {
            width: 800px;
            margin: 0 auto;
             text-align: center;
        }

        .QForm,
        .QList {
            font-size: 25px; 
            font-weight: lighter;
            color : black;
            margin: 0 100px 0px 100px;
            text-decoration: none;
        }

        .QForm:hover,
        .QList:hover {
            font-weight: 500;
        }

        .QFormBox {
            margin-top: 0rem;
            width: 650px;
            margin: 0 auto;
        }

        .questionTitle {
            width: 650px;
            padding: 1rem;
        }

        .questionQ {
            resize: none;
             height: 600px;
            width: 650px;
            padding: 1rem;
        }

        .QBtn {
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
        <h1>고객센터</h1>  
        <div class="inBox">
            <div class="inBoxA">
                <a href="/community/question" class="QForm">문의 등록</a>
                <a href="/community/qList" class="QList">문의 내역</a>
            </div>
            <br>
            <div class="QFormBox">
                <form id="question">
                	<input type="hidden" name="memberNo" value="${member.memberNo}">
                    <input type="text" class="questionTitle" maxlength="50" name="questionTitle" placeholder="제목">
                    <br><br>
                    <textarea class="questionQ" name="questionQ" placeholder="내용"></textarea>
                    <br><br>
                    <button type="button" class="QBtn">문의하기</button>
                </form>
            </div>
            <br>
        </div>
        </div>
</body>
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>
</html>
