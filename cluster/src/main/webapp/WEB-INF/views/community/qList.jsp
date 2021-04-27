<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#cntPerPage").on("change", function() {
                var sel = $("#cntPerPage option:selected").val()
                self.location = "/community/qList?nowPage=1&cntPerPage=" + sel;
            })
        })

    </script>
    <style>
        .outbox {
             margin: 0 auto;
            text-align: center;
        }

        .inBox {
            width: 1000px;
            margin: 0 auto;
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
            width: 800px;
            margin: 0 auto;
        }

        Table {
            border-collapse: separate;
            border-spacing: 0 15px;
         }

        Table a {
            text-decoration: none;
            color: black;
        }

        .paging a {
            text-decoration: none;
            color: black;
            margin: 10px;
            font-weight: 300;
            display: inline-block;
            text-align: center;
        }

        .paging a:hover {
            font-weight: 500;
        }

        .no {
            font-size: 13px;
            background-color: lightgray;
            padding: 5px 10px 5px 10px;
            margin : 0 auto;
        }

        .ok {
            font-size: 13px;
            background-color: #ffc107;
            padding: 5px 10px 5px 10px;
            margin : 0 auto;
        }

    </style>
</head>

<body>
    <div class="outbox">
        <h1>고객센터</h1> <a href="/login/">로그인</a> <a href="/login/logout">로그아웃</a> 멤버번호 : ${member.memberNo} / 권한 : ${member.memberAuth}
        <div class="inBox">
            <div class="inBoxA">
                <a href="/community/question" class="QForm">문의 등록</a>
                <a href="/community/qList" class="QList">문의 내역</a>
            </div>
            <div style="width: 700px">

            </div>
            <br>
            <div class="QFormBox">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th> <select id="cntPerPage" class="select" name="sel">
                                    <option value="5" <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
                                    <option value="10" <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                                    <option value="15" <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                                    <option value="20" <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
                                </select></th>
                        </tr>
                        <tr>
                            <th width="500">제목</th>
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
                                    <c:set var="ok" value="${list.questionOk}" />
                                    <tr>
                                        <td align="left"><a href="/community/qDetail/${list.questionNo}" class="qTitle">${list.questionTitle}</a></td>
                                        <td>${list.questionDate}</td>
                                        <td>${list.memberNick}</td>
                                        <c:if test="${ok eq '답변 대기'}">
                                            <td><label class="no">${list.questionOk}</label></td>
                                        </c:if>
                                        <c:if test="${ok eq '답변 완료'}">
                                            <td><label class="ok">${list.questionOk}</label></td>
                                        </c:if>
                                    </tr>

                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <br>
            <div class="paging">
                <c:if test="${paging.startPage != 1 }">
                    <a href="/community/qList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
                </c:if>
                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
                            <b style="margin: 10px;">${p }</b>
                        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <a href="/community/qList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:if test="${paging.endPage != paging.lastPage}">
                    <a href="/community/qList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
                </c:if>
            </div>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>

</html>
