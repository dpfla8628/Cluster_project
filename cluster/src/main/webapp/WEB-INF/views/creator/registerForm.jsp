<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 설정 페이지</title>
<link type="text/css" rel="stylesheet" href='<c:url value="/css/creatorstyle.css"/>'>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

</script>
<body>
	<form:form modelAttribute="offclass" action="register" enctype="multipart/form-data">
        <fieldset class="outbox">
           <legend>강의 설정</legend>
            <fieldset class="outbox">
               <legend>기본 정보 입력</legend>
                <div class="row">
                    <label>강의 명</label>
                    <form:input class="input" path="className"/>
                </div>
                <div class="row">
                    <label>카테고리</label>
                    <form:select class="select" path="categoryNo">
                        <option>Purchases</option>
                        <option>Purchases</option>
                        <option>Purchases</option>
                    </form:select>
                </div>
                <div class="row">
                    <label>시작일</label>
                    <form:input type="date" path="classStart"/>
                    
                    <label>종료일</label>
                    <form:input type="date" path="classEnd"/>
                </div>
                <div class="row">
                    <label>인원 제한</label>
                    <form:input class="input" type="text" path="classMemberSet"/>
                </div>
                <div class="row">
                    <label>모임 장소</label>
                    <form:input class="input" type="text" path="classPlace"/>
                </div>
                <div class="row">
                    <label>강의 썸네일</label>
                    <form:input type="file" path="classImage"/>
                </div>
            </fieldset>
            
            <fieldset class="outbox">
                <legend>강의 상세 정보</legend>
                <div class="row">
                    <label>강의 설명</label>
                    <form:textarea class="input" path="classInfo"></form:textarea>
                </div>               
                <div class="row">
                    <label>강의 설명 사진</label>
                    <form:input type="file" path="classImages"/>
                    <div class="uploadedList"></div>
                </div>        
                <div class="row">
                    <label>강의 가격</label>
                    <form:input class="input" type="text" path="classPrice"/>
                </div>
                <div class="row">
                    <label>강의 연락처</label>
                    <form:input class="input" type="text" path="classTalk"/>
                </div>        
            </fieldset>
            <div>
	            <button type="submit" id="btnRegister">검수 신청</button>
	            <button type="submit" id="btnList">취소 하기</button>     
            </div>
        </fieldset>
    </form:form>
</body>
</html>