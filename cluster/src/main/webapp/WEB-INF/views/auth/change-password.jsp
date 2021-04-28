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
				width: 35%;
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
			
			
			.title-text{
				cursor: pointer;
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".title-text").click(function(){
					location.href="${contextPath}/";
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
				
				$(".resetBtn").click(function(){
					var formSerializeArray = $('#resetPwForm').serializeArray();
					var object = {};
					for (var i = 0; i < formSerializeArray.length; i++){
					    object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
					}
					 
					var json = JSON.stringify(object);

					$.ajax({
						type: "post",
						dataType: "text",
						async: true,
						url:"${contextPath}/login/resetPw",
						contentType: "application/json",
						data: json,
						success: function(data, textStatus){
							alert("비밀번호 변경이 완료되었습니다.");
							location.href="${ContextPath}/login/";
						},
						error: function(xhr){
							alert("올바른 비밀번호를 입력해 주세요!");
							return;
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
				
				<form class="form-width" id="resetPwForm" action="/login/resetPw" method="post">
					<input type="hidden" value="${param.no}" name="memberNo">
					<div class="title font-weight-bold text-center">
						<span class="text-warning title-text">CLUSTER</span>
					</div>
					
					<div class="form-group">
					  	<input type="password" class="form-control" id="memberPw" name="memberPw" aria-describedby="pwHelp" placeholder="비밀번호" required>
					  	<small id="pwHelp" class="text-muted">
					    	영문, 숫자, 특수문자(!@#$%^&+=) 포함 8~15 글자
						</small>
					</div>

					<div class="form-group">
					  <input type="password" class="form-control" id="memberPwCheck" name="memberPwCheck" placeholder="비밀번호 확인" required>
					  <small id="pwCheck"></small>
					</div>
					
					<button type="button" class="btn btn-outline-warning btn-lg btn-block btn-gap resetBtn">비밀번호 변경하기</button>
					
				</form>

			</div>
		    
		</div>
		
			
	</body>
	
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>