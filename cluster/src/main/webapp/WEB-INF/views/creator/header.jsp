<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>크리에이터 관리 페이지</title>
    <link type="text/css" rel="stylesheet" href='<c:url value="/css/creatorstyle.css"/>'>
</head>
<body>
    <main>
        <header>크리에이터 관리 페이지</header>
        <section>
            <aside>메뉴 리스트
                <div class="menu">
                    <ul>
                        <li class="menu menu-title"><a href="/creator/">진행 중 강의</a></li>
                    </ul>
                    <ul>
                        <li class="menu menu-title"><a href="/creator/register">강의 추가</a></li>
                    </ul>
                    <ul>
                        <li class="menu menu-title"><a href="">매출 확인</a></li>
                        <ul>
                            <li class="menu menu-detail"><a href="">강의별</a></li>
                            <li class="menu menu-detail"><a href="">기간별</a></li>
                        </ul>
                    </ul>
                    <ul>
                        <li class="menu menu-title"><a href="">문의사항</a></li>
                    </ul>
                </div>
            </aside>    
          
</body>
</html>