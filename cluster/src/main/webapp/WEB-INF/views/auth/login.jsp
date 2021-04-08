<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<title>CLUSTER</title>
		<style>
			.form-width{
				width: 40%;
			}
			
			.form-group > label{
				margin: 0;
			}
			
			.form-group > input:focus{
				border-color:#ffc107;
				box-shadow: none;
			}
			
			.title{
				font-size: 3rem;
				margin-bottom: 2.5rem;
			}
			
			.a-title:hover{
				text-decoration: none;
			}
			
			.fakebox{
				height: 5rem; 
			}
			
			.btn-outline-warning:hover{
				color: white;
			}
			
			.col{
				padding-right: 0.3rem;
				padding-left: 0.3rem;
				font-size: 0.8rem;
			}
			.col-container{
				margin-top: 1rem;
			}
			.a-col:hover{
				text-decoration: none;
			}
			
			.btn-gap{
				margin-top: 1.5rem;
			}
		</style>
	</head>
	<body>
		<div class="container">
		
			<div class="row fakebox"></div>
			
			<div class="row justify-content-md-center">
				
				<form class="form-width" action="/login/" method="post">
				
					<div class="title font-weight-bold text-center">
						<a class="a-title text-warning" href="/signup/">CLUSTER</a>
					</div>
					
					<div class="form-group">
					  <input type="email" class="form-control" name="memberId" placeholder="이메일" aria-describedby="emailHelp" >
					</div>
					
					<div class="form-group">
					  <input type="password" class="form-control" name="memberPw" placeholder="비밀번호">
					</div>
					
					<button type="submit" class="btn btn-outline-warning btn-lg btn-block btn-gap">로그인</button>
					<hr>
					<button type="submit" class="btn btn-outline-warning btn-lg btn-block">구글로 시작하기</button>
			
					<div class="container col-container">
						<div class="row justify-content-md-center">
						    <div class="col text-right"><a class="a-col text-muted" href="/login/find">비밀번호 찾기</a></div>
						    <div class="col text-left"><a class="a-col text-muted" href="/signup/">회원가입</a></div>
					    </div>
					</div>
					
				</form>
			</div>
		    
		</div>
		
			
	</body>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>