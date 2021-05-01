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
				height: 10rem; 
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
					location.href="${contextPath}/login/";
				});
				
				$("#submitBtn").click(function(){
					var target = $("#memberId").val().trim();
					if(!target){
						$("#findPwHelp").text("이메일을 입력해 주세요!");
						$("#findPwHelp").addClass("text-danger");
						return;
					}
					
					var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					if(!regex.test(target)){
						$("#findPwHelp").text("올바른 이메일을 입력해 주세요!");
						$("#findPwHelp").addClass("text-danger");
						return;
					}
					
					$.ajax({
						type: "post",
						dataType: "text",
						async: true,
						url:"${contextPath}/login/findpw",
						data: {id : target},
						success: function(data, textStatus){
							if(data == "y"){
								alert("메일 전송을 완료했습니다!");
							}
							else if(data == "s"){
								$("#findPwHelp").text("sns로그인을 해주세요!");
								$("#findPwHelp").addClass("text-danger");
							}
							else{
								$("#findPwHelp").text("등록되지 않은 회원입니다.");
								$("#findPwHelp").addClass("text-danger");
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
				
				<form class="form-width">
				
					<div class="title font-weight-bold text-center">
						<span class="text-warning title-text">CLUSTER</span>
					</div>
					
					<div class="form-group">
					  <input type="email" class="form-control" id="memberId" name="memberId" placeholder="이메일" required>
					  <small id="findPwHelp"></small>
					</div>
					
					<button type="button" id="submitBtn" class="btn btn-outline-warning btn-lg btn-block btn-gap">이메일로 비밀번호 변경 링크 보내기</button>
					
				</form>

			</div>
		    
		</div>
		
			
	</body>
	
	
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>