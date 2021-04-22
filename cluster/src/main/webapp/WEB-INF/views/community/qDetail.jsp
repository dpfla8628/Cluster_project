<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src='js/autosize.js'></script> 
<script>autosize(document.querySelectorAll('textarea'));</script> 
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
        	
			
			function qDetail(){
    	        $.ajax({
    	            type: "get",  
    	            url: "/community/qDetail/${q.questionNo}",  
    	            success: function(result){     
    	            $(".inBox").html(result);
    	                }
    	            });
			} 
    	        
        	 var txtArea = $("#questionQ");
        	    if (txtArea) {
        	        txtArea.each(function(){
        	            $(this).height(this.scrollHeight);
        	        });
        	    }
        	    
        	 var txtArea = $("#questionA");
        	    if (txtArea) {
        	        txtArea.each(function(){
        	            $(this).height(this.scrollHeight);
        	        });
        	    }
        	  
        	    $('.memberOkBtn').hide()
        	    $('.memberNoBtn').hide()
        	    $('.adminOkBtn').hide()
        	    $('.adminNoBtn').hide()
        	    
        	    $('.memberQbtn').click(function(){
        	    	$('.memberOkBtn').show()
        	    	$('.memberNoBtn').show()
        	    	$('.memberQbtn').hide()
        	    	$('#questionQ').attr("readonly", false)

				})
				
				$('.memberOkBtn').click(function(){
					var form = $("#memberQ").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/community/qDetail",  
			            data : form,  
 			            success : function(data){
  			            	$('#questionQ').attr("readonly", true);
  			            	 qDetail()
 			            }
			        });
				})
				
				$('.adminAbtn').click(function(){
        	    	$('.adminOkBtn').show()
        	    	$('.adminNoBtn').show()
        	    	$('.adminAbtn').hide()
        	    	$('#questionA').attr("readonly", false)

				})
				
				$('.adminOkBtn').click(function(){
					var form = $("#adminA").serialize();
			        $.ajax({
			            type : "post", 
			            url : "/community/qDetail/admin",  
			            data : form,  
 			            success : function(data){
  			            	$('#questionA').attr("readonly", true);
  			            	 
  			            }
			        });
				})
				
 				
				$('.deleteQ').click(function(){
					$.ajax({
			            type : "post", 
			            url : "/community/qDetail/deleteQuestion/${q.questionNo}", 
			            data: "questionNo=" + '${q.questionNo}',
 			            success : function(data){
 			            	 window.location.href = "/community/qList/${member.memberNo}";
  			            }
			        });
				})
				
				$('.deleteA').click(function(){
					$.ajax({
			            type : "post", 
			            url : "/community/qDetail/deleteA/${q.questionNo}", 
			            data: "questionNo=" + '${q.questionNo}',
 			            success : function(data){
 			            	 
   			            }
			        });
				})

        })

    </script>
    <style>
        .outbox {
            border: 1px dotted gray;
            margin: 0 auto;
            text-align: center;
        }

        .inBox {
            width: 800px;
            margin: 0 auto;
            border: 0.5px dotted black;
            text-align: center;
        }

        .QForm,
        .QList {
            font-size: 25px;
            font-weight: lighter;
            color: black;
            margin: 0 100px 0px 100px;
            text-decoration: none;
        }

        .QForm:hover,
        .QList:hover {
            font-weight: 500;
        }

        .QFormBox {
            margin-top: 0rem;
            width: 600px;
            margin: 0 auto;
        }

        table {
            width: 700px;
            margin-left: -50px;
        }

        .questionQ,
        .questionA {
            width: 400px;
            margin: 0 auto;
            text-align: center;
            border: 1px solid lightgray;
            padding: 20px;
        }

        .btn {
            text-align: right;
        }
        
        #questionQ, #questionA{
        	width: 350px;
        	padding : 1rem;
        	height : 20px;
        	resize: none;
        	overflow: hidden;
         }

    </style>
</head>

<body>
    <div class="outbox">
        <h1>고객센터</h1> <a href="/login/">로그인</a> <a href="/login/logout">로그아웃</a> 멤버번호 : ${member.memberNo} / 권한 : ${member.memberAuth}
        <div class="inBox">
            <div class="inBoxA">
                <a href="/community/question" class="QForm">문의 등록</a>
                <a href="/community/qList/${member.memberNo}" class="QList">문의 내역</a>
            </div>
            <br>
            <div class="QFormBox">
                <table border="1">
                    <thead>
                        <tr>
                            <th align = "left" width="400">${q.questionTitle}</th>
                            <th width="100">${q.questionDate}</th>
                            <th width="100">${q.memberNick}</th>
                            <th width="100">${q.questionOk}</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td colspan="4">
                                <div class="questionQ">
                                <form id="memberQ">
                                <input type="hidden" class="questionNo" name="questionNo" value="${q.questionNo}">
                                <textarea id="questionQ" name="questionQ" readonly><c:out value="${q.questionQ}"/>
                                </textarea>
                                    <div class="btn">
                                        <input type="button" class="memberQbtn" value="수정">
                                        <input type="submit" class="memberOkBtn" value="수정 완료">
                                        <button class="memberNoBtn">수정 취소</button>
                                        <button type="button" class="deleteQ">삭제</button>
                                    </div>
                                </form>
                                </div>
                                
                                <br>
                                <div class="questionA">
                                <form id="adminA">
                                <input type="hidden" name="questionNo" value="${q.questionNo}">
                                    <textarea id="questionA" name="questionA" readonly><c:out value="${q.questionA}"/>
                                </textarea>
                                    <div class="btn">
                                        <input type="button" class="adminAbtn" value="등록">
                                        <input type="submit" class="adminOkBtn" value="등록 완료">
                                        <button class="adminNoBtn">등록 취소</button>
                                        <button class="deleteA">삭제</button>
                                    </div>
                                   </form>
                                </div>

                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <br>
        </div>
    </div>
</body>

</html>
