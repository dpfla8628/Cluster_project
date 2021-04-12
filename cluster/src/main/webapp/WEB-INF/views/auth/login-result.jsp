<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>id : ${id}</h3>
	<h3>권한 : ${auth}</h3>
	<h3>token: ${token }</h3>
	<a href="/login/logout">로그아웃</a>
</body>
</html>