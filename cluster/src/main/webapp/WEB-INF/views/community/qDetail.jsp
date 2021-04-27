<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src='js/autosize.js'></script>
    <script>
        autosize(document.querySelectorAll('textarea'));

    </script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            var questionNo = $('.questionNo').val()

            var txtArea = $("#questionQ");
            if (txtArea) {
                txtArea.each(function() {
                    $(this).height(this.scrollHeight);
                });
            }

            var txtArea = $("#questionA");
            if (txtArea) {
                txtArea.each(function() {
                    $(this).height(this.scrollHeight);
                });
            }


            $('.memberOkBtn').hide()
            $('.adminOkBtn').hide()

            $('.memberQbtn').click(function() {
                $('.memberOkBtn').show()
                $('.memberQbtn').hide()
                $('#questionQ').attr("readonly", false)
                $('#questionQ').focus()
            })


            $('.adminAbtn').click(function() {
                $('.adminOkBtn').show()
                $('.adminAbtn').hide()
                $('#questionA').attr("readonly", false)
                $('#questionA').focus()
            })

            $('.deleteQ').on("click", function() {
                var DeleteQ = $("#memberQ")
                if (confirm("문의 삭제하시겠습니까?")) {
                    DeleteQ.attr("action", "/community/deleteQ");
                    DeleteQ.submit();
                }
            });

            $('.deleteA').on("click", function() {
                var DeleteA = $("#adminA")
                if (confirm("답변 삭제하시겠습니까?")) {
                    DeleteA.attr("action", "/community/deleteA/" + questionNo);
                    DeleteA.submit();
                }
            });

            
            $('#questionA').on('keyup', function() {
                $(this).css('height', 'auto');
                $(this).height(this.scrollHeight);
                $(this).val($(this).val().substring(0, 3000));
                $(document).scrollTop($(document).height());
            }); 
            
            $('.adminOkBtn').click(function(){
            	if($('#questionA').val() == 0){
            		alert('공백 불가')
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
            color: black;
            margin: 0 100px 0px 100px;
            text-decoration: none;
        }

        .QForm:hover,
        .QList:hover {
            font-weight: 500;
        }

        .QFormBox {
            
        }

        .QFormBox {
            width: 800px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 0rem;
            width: 600px;
            margin: 0 auto;
        }

        .questionQ,
        .questionA {
            width: 800px;
            margin: 0 auto;
            text-align: center;
            border: 1px solid lightgray;
            padding: 20px;
        }

 
        #questionQ,
        #questionA {
            width: 650px;
            padding: 1rem;
            height: 20px;
            resize: none;
            overflow: hidden;
            border: none;
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

        .memberQbtn,
        .memberOkBtn,
        .deleteQ,
        .adminAbtn,
        .adminOkBtn,
        .deleteA {
            padding: 5px 15px 5px 15px;
            background-color: transparent;
            border: 1px solid gray;
           
        }
		.title{
			text-align : left;
		}
    </style>
</head>
<c:set var="auth" value="${member.memberAuth}" />
<c:set var="loginNo" value="${member.memberNo}" />
<c:set var="memberNo" value="${q.memberNo}" />
<c:set var="ok" value="${q.questionOk}" />

<body>
    <div class="outbox">
        <h1>고객센터</h1> <a href="/login/">로그인</a> <a href="/login/logout">로그아웃</a> 멤버번호 : ${member.memberNo} / 권한 : ${member.memberAuth}
        <div class="inBox">
            <div class="inBoxA">
                <a href="/community/question" class="QForm">문의 등록</a>
                <a href="/community/qList" class="QList">문의 내역</a>
            </div>
            <br>
            <div class="QFormBox">
                <table style="border-collapse: separate; border-spacing: 0 10px;">
                    <thead>
                        <tr>
                            <th class="title" width="400">${q.questionTitle}</th>
                            <th width="100" style="font-weight: 300">${q.questionDate}</th>
                            <th width="120" style="font-weight: 300">${q.memberNick}</th>
                            <c:if test="${ok eq '답변 대기'}">
                                <th align="right" width="80"><label class="no">${q.questionOk}</label></th>
                            </c:if>
                            <c:if test="${ok eq '답변 완료'}">
                                <th width="80"><label class="ok">${q.questionOk}</label></th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td colspan="4">
                                <div class="questionQ">
                                    <form:form modelAttribute="question" action="/community/qDetail/" method="POST" id="memberQ">
                                        <input type="hidden" class="questionNo" name="questionNo" value="${q.questionNo}">
                                        <textarea id="questionQ" name="questionQ" readonly><c:out value="${q.questionQ}"/>
                                </textarea>
                                        <c:if test="${loginNo eq memberNo}">
                                            <div class="Btn">
                                                <input type="button" class="memberQbtn" value="수정">
                                                <input type="submit" class="memberOkBtn" value="수정 완료">
                                                <button type="button" class="deleteQ">삭제</button>
                                            </div>
                                        </c:if>
                                    </form:form>
                                </div>
                                <br>
                                <c:if test="${!empty q.questionA ||auth eq '관리자'}">
                                    <div class="questionA">
                                        <form:form modelAttribute="question" action="/community/qDetail/admin/" method="POST" id="adminA">
                                            <input type="hidden" name="questionNo" value="${q.questionNo}">
                                            <textarea id="questionA" name="questionA" readonly><c:out value="${q.questionA}"/></textarea>
                                            <c:if test="${auth eq '관리자'}">
                                                <div class="btn">
                                                    <input type="button" class="adminAbtn" value="작성">
                                                    <input type="submit" class="adminOkBtn" value="작성 완료">
                                                    <button type="button" class="deleteA">삭제</button>
                                                </div>
                                            </c:if>
                                        </form:form>
                                    </div>
                                </c:if>

                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <br>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>

</html>
