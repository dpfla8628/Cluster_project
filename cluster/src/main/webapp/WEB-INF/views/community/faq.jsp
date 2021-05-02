<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<head>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
    <title>FAQ</title>
    <style>
        .faqBox {
            width: 1000px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
        }

        .answer {
            display: none;
            padding-bottom: 30px;
         }

        #faq-title {
            font-size: 25px;
        }

        .faq-content {
        height : auto;
            border-bottom: 1px solid #e0e0e0;
        }

        .question {
            font-size: 17px;
            padding: 30px 0;
            cursor: pointer;
            border: none;
            outline: none;
            background: none;
            width: 80%;
            text-align: left;
        }

        .question:hover {
            color: #ffc107;
        }

        [id$="-toggle"] {
            margin-right: 15px;
        }
        
        .aBox{
        	display : inline-block;
        	width: 18%;
        	text-align: right;
        }
        .paging{
        	width : 200px;
        	margin : 0 auto;
        }

        .paging a {
        	font-weight : lighter;
            text-decoration: none;
            color: black;
            margin: 10px;
             display: inline-block;
            text-align: center;
        }

        .paging a:hover {
            font-weight: bold;
        }
        .insertBtn{
         	float: right;
        	border : 1px solid  lightgray;
        	background-color : transparent;
        	height: 35px;
			width: 100px;
        }
        #faqContent{
        font-size : 13px;
        	 width: auto;
             padding: 1rem;
             overflow: hidden;
            border: none;
         }
       
    </style>
</head>
<c:set var="auth" value="${member.memberAuth}"/>
<body>
    <div class="faqBox">
        <h1>고객센터</h1>
  		<div style="text-align: center;">
  			<a href="/community/question">1:1 문의</a> /
  			<a href="/community/faq">자주 묻는 질문</a>
  		</div>
        <span id="faq-title">자주 묻는 질문(FAQ)</span>
         
        <c:forEach items="${list}" var="faq">
            <div class="faq-content">
                	<button class="question" id="que-${faq.faqNo}"><span id="que-${faq.faqNo}-toggle">+</span><span>${faq.faqTitle}</span></button>
                <c:if test="${auth eq '관리자'}">
                <div class="aBox">
	                <a id="edit" class="edit${faq.faqNo}" href="/community/faqEdit/${faq.faqNo}">수정</a>
                </div>
                </c:if>
                <div class="answer" id="ans-${faq.faqNo}"><pre id="faqContent"><c:out value="${faq.faqContent}"/></pre></div>
            </div>
        </c:forEach>
        
         <c:if test="${auth eq '관리자'}">
        <button class="insertBtn" onclick="insertForm()">FAQ 등록</button>
        </c:if>
        
        <div class="paging">
             <c:if test="${paging.startPage != 1 }">
                <a href="/community/faq?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
            </c:if>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage }">
                        <b style="margin: 10px;">${p }</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage }">
                        <a href="/community/faq?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/community/faq?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
            </c:if>
        </div>
     </div>


</body>
<script>
    const items = document.querySelectorAll('.question');

    function openCloseAnswer() {
        const answerId = this.id.replace('que', 'ans');

        if (document.getElementById(answerId).style.display === 'block') {
            document.getElementById(answerId).style.display = 'none';
            document.getElementById(this.id + '-toggle').textContent = '+';
        } else {
            document.getElementById(answerId).style.display = 'block';
            document.getElementById(this.id + '-toggle').textContent = '-';
            $(".answer").css('height', 'auto');
            $("#faqContent").css('height', 'auto');
        }
    }

    items.forEach(item => item.addEventListener('click', openCloseAnswer));
	
	function insertForm(){
 		 window.location = "/community/faqRegister";
	}
	

 
</script>
 
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>

</html>
