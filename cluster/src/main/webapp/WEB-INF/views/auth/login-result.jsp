<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>no : ${member.memberNo}</h3>
	<h3>id : ${member.memberId}</h3>
	<h3>닉네임 : ${member.memberNick}</h3>
	<h3>권한 : ${member.memberAuth}</h3>
	<a href="/login/logout">로그아웃</a>
	<a href="/mypage/index">마이페이지</a>
</body>
</html>