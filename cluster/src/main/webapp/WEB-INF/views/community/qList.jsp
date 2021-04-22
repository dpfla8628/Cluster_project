<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
	 
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
                                <th width="400">제목</th>
                                <th width="100">작성 날짜</th>
                                <th width="100">작성자</th>
                                <th width="100">답변 여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <c:choose>
                            	<c:when test="${empty qList}">
                            	<tr>
                            	<td colspan="4">
                            		<h2>작성한 문의가 없습니다</h2>
                            	</td>
                            	</tr>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach items="${qList}" var="list">
                            			<tr>
			         						<td align = "left"><a href="/community/qDetail/${list.questionNo}" class="qTitle">${list.questionTitle}</a></td>
			                                <td>${list.questionDate}</td>
			                                <td>${list.memberNick}</td>
			                                <td>${list.questionOk}</td>                           				
                            			</tr>
                            		<%-- 	<tr class="questionQ${list.questionNo}">
                            				<td colspan="4">
                            					${list.questionQ}
                            				</td>
                            			</tr> --%>
                            		</c:forEach>
                            	</c:otherwise>
                            </c:choose>
                        
                            
                        </tbody>
                    </table>
             </div>
            <br>
        </div>
    </div>
</body>
</html>