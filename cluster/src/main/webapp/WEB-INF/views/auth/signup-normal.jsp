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
				margin-bottom: 2rem;
			}
			
			.a-title, .a-title:hover{
				color: black;
				text-decoration: none;
			}
			
			.fakebox{
				height: 2.5rem; 
			}
			
			.custom-control-input:checked~.custom-control-label::before {
			    color: #fff;
			    border-color: #ffc107;
			    background-color: #ffc107;
			}
			
			.custom-checkbox{
				margin-bottom: 0.5rem;
			}
			
			.cb-sizing{
				margin-bottom: 1rem;
			}
			
			.btn-outline-warning:hover{
				color: white;
			}
			
			.title-text{
				cursor: pointer;
			}
			
			.moreInfo:hover{
				color: #ffc107;
			}
			
		</style>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script>
			$(function(){
				
				$(".title-text").click(function(){
					location.href="${contextPath}/";
				});
				
				$("#memberNick").change(function(){
					var target = $(this).val().trim();
					var regex = /^[가-힣a-zA-Z0-9]{2,10}$/;
					
					if(regex.test(target)){
						var json = { check: "nick", value: target};
						$.ajax({
							type: "post",
							dataType: "text",
							async: true,
							url:"${contextPath}/signup/check",
							contentType: "application/json",
							data: JSON.stringify(json),
							success: function(data, textStatus){
								if(data == "y"){
									$("#nickHelp").text("사용 가능한 닉네임입니다.");
									$("#nickHelp").removeClass("text-danger");
									$("#nickHelp").removeClass("text-muted");
									$("#nickHelp").addClass("text-success");
								}
								else{
									$("#nickHelp").text("사용할 수 없는 닉네임입니다.");
									$("#nickHelp").removeClass("text-muted");
									$("#nickHelp").addClass("text-danger");
								}
							}
						});
					}
					else{
						$("#nickHelp").text("한글, 영문, 숫자 2~10 글자");
						$("#nickHelp").removeClass("text-muted");
						$("#nickHelp").addClass("text-danger");
					}
				});
				
				$("#memberId").change(function(){
					var target = $(this).val().trim();
					var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

					if(regex.test(target)){
						var json = { check: "id", value: target};
						$.ajax({
							type: "post",
							dataType: "text",
							async: true,
							url:"${contextPath}/signup/check",
							contentType: "application/json",
							data: JSON.stringify(json),
							success: function(data, textStatus){
								if(data == "y"){
									$("#idHelp").text("사용 가능한 이메일입니다.");
									$("#idHelp").removeClass("text-danger");
									$("#idHelp").removeClass("text-muted");
									$("#idHelp").addClass("text-success");
								}
								else{
									$("#idHelp").text("사용할 수 없는 이메일입니다.");
									$("#idHelp").removeClass("text-muted");
									$("#idHelp").addClass("text-danger");
								}
							}
						});
					}
					else{
						$("#idHelp").text("유효하지 않은 형식입니다.");
						$("#idHelp").removeClass("text-muted");
						$("#idHelp").addClass("text-danger");
					}
				});
				
				$("#memberPw").change(function(){
					var target = $(this).val().trim();
					var regex = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&+=]).{8,15}$/;
					
					if(regex.test(target)){
						$("#pwHelp").text("사용 가능한 비밀번호입니다.");
						$("#pwHelp").removeClass("text-danger");
						$("#pwHelp").removeClass("text-muted");
						$("#pwHelp").addClass("text-success");
					}
					else{
						$("#pwHelp").text("영문, 숫자, 특수문자(!@#$%^&+=) 포함 8~15 글자");
						$("#pwHelp").removeClass("text-muted");
						$("#pwHelp").addClass("text-danger");
					}
				});
				
				$("#memberPwCheck").change(function(){
					var check = $(this).val().trim();
					var target = $("#memberPw").val().trim();
					
					if(check===target){
						$("#pwCheck").text("비밀번호가 일치합니다.");
						$("#pwCheck").removeClass("text-danger");
						$("#pwCheck").removeClass("text-muted");
						$("#pwCheck").addClass("text-success");
					}
					else{
						$("#pwCheck").text("비밀번호가 일치하지 않습니다.");
						$("#pwCheck").removeClass("text-muted");
						$("#pwCheck").addClass("text-danger");
					}
				});
				
				$("#signupBtn").click(function(){
					var formSerializeArray = $('#signupForm').serializeArray();
					var object = {};
					for (var i = 0; i < formSerializeArray.length; i++){
					    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
					}
					 
					var json = JSON.stringify(object);

					$.ajax({
						type: "post",
						dataType: "text",
						async: true,
						url:"${contextPath}/signup/check2",
						contentType: "application/json",
						data: json,
						success: function(data, textStatus){
							if(data == "y"){
								$("#signupForm").submit();
							}
							else{
								alert("회원가입 양식을 완성해주세요!");
							}
						}
					});
				});
				
			});
		</script>
	</head>
	<body>
		<div class="container">
		
			<div class="row fakebox"></div>
			
			<div class="row justify-content-md-center">
				
				<form class="form-width" id="signupForm" action="/signup/" method="post">
				
					<div class="title font-weight-bold text-center">
						<span class="text-warning title-text">CLUSTER</span>
					</div>
					
					<div class="form-group">
					  	<label class="text-muted" for="memberNick">닉네임</label>
					  	<input type="text" class="form-control" id="memberNick" name="memberNick" aria-describedby="nickHelp" required>
					  	<small id="nickHelp" class="text-muted">
					      한글, 영문, 숫자 2~10 글자
						</small>
					</div>
					
					<div class="form-group">
					  	<label class="text-muted" for="memberId">아이디</label>
					  	<input type="email" class="form-control" id="memberId" name="memberId" placeholder="example@email.com" aria-describedby="idHelp" required>
						<small id="idHelp" class="text-muted"></small>
					</div>
					
					<div class="form-group">
					  	<label class="text-muted" for="memberPw">비밀번호</label>
					  	<input type="password" class="form-control" id="memberPw" name="memberPw" aria-describedby="pwHelp" required>
					  	<small id="pwHelp" class="text-muted">
					    	영문, 숫자, 특수문자(!@#$%^&+=) 포함 8~15 글자
						</small>
					</div>
					
					<div class="form-group">
					  <label class="text-muted" for="memberPwCheck">비밀번호 확인</label>
					  <input type="password" class="form-control" id="memberPwCheck" name="memberPwCheck" required>
					  <small id="pwCheck"></small>
					</div>
					
					<hr>
					
					<div class="cb-sizing text-muted">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="memberAgreement1" name="memberAgreement1" value="y" required>
							<label class="custom-control-label" for="memberAgreement1">(필수) 만 14세 이상</label>
							<small><a class="moreInfo text-muted" href="">더보기</a></small>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="memberAgreement2" name="memberAgreement2" value="y" required>
							<label class="custom-control-label" for="memberAgreement2">(필수) 이용약관 동의</label>
							<small><a class="moreInfo text-muted" href="">더보기</a></small>
						</div>
					</div>
					
					<button type="button" id="signupBtn" class="btn btn-outline-warning btn-lg btn-block">회원가입 하기</button>
				
				</form>
			</div>
		</div>
					
	</body>
	
	
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>