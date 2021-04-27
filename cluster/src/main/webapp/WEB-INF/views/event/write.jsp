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
				width: 50%;
			}
			
			.form-group > label{
				margin: 0;
			}
			
			.form-group > input:focus{
				border-color:#ffc107;
				box-shadow: none;
			}
			
			.title{
				font-size: 2rem;
				margin-bottom: 1rem;
				margin-top: 1rem;
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
			
			.title-text{
				cursor: pointer;
			}
			
			.hiddengap{
				height: 2rem;
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$(".title-text").click(function(){
					location.href="${contextPath}/";
				});
				
				$("#insertBtn").click(function(){
					$("#eventForm").submit();
				});
				
				$("#cancleBtn").click(function(){
					location.href="${contextPath}/event/";
				});
				
				$("#addBtn").click(function(){
					var str = "<div class='addedBox'><hr><div class='form-group h5'>쿠폰<button type='button' class='close closeBtn' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
					str += "<div class='form-group'><label>쿠폰명</label><input type='text' class='form-control couponName'></div>";
					str += "<div class='form-group'><label>쿠폰 사용기간</label><div class='form-row'><div class='col'><input type='date' class='form-control couponStart'></div><span>~</span><div class='col'><input type='date' class='form-control couponEnd'></div></div></div>";
					str += "<div class='form-group'><label>할인금액</label><input type='number' class='form-control couponDiscount'></div>";
			  		str += "<div class='form-group'><label>쿠폰 이미지</label><input type='file' class='form-control-file couponFile'></div></div>";
					$(".couponBox").append(str);
				});
				
				$(document).on("click", ".closeBtn", function(){
					$(this).parent().parent().remove();
				});
				
				$("#eventForm").on("submit", function(e){
					e.preventDefault();
					
					$(".addedBox").each(function(idx){
						$(this).find(".couponName").attr("name", "coupons["+idx+"].couponName");
						$(this).find(".couponStart").attr("name", "coupons["+idx+"].couponStart");
						$(this).find(".couponEnd").attr("name", "coupons["+idx+"].couponEnd");
						$(this).find(".couponBy").attr("name", "coupons["+idx+"].couponBy");
						$(this).find(".couponDiscount").attr("name", "coupons["+idx+"].couponDiscount");
						$(this).find(".couponFile").attr("name", "coupons["+idx+"].couponFile");
					});
					
					this.submit();
				});
				
			});
		</script>
	</head>
	<body>
		<div class="container">
		
			<div class="row justify-content-md-center align-middle">
				<div class="title font-weight-bold ">
					<span class="text-warning title-text">CLUSTER</span>
				</div>
			</div>
			
			<div class="row justify-content-md-center">
				
				<form class="form-width" id="eventForm" action="/event/write" method="post" enctype="multipart/form-data">
					<div class="h4 font-weight-bold">
						이벤트
					</div><hr>
					
					<!-- 이벤트 폼 -->
					<div class="form-group">
					    <label for="eventTitle">이벤트명</label>
					    <input type="text" class="form-control" id="eventName" name="eventTitle">
				  	</div>
					<div class="form-group">
					    <label for="eventStart">이벤트 기간</label>
					    <div class="form-row">
						    <div class="col">
						      <input type="date" class="form-control" name="eventStart">
						    </div>
						    <span>~</span>
						    <div class="col">
						      <input type="date" class="form-control" name="eventEnd">
						    </div>
				  		</div>
				  	</div>
					<div class="form-group">
					    <label for="eventContent">이벤트 내용</label>
    					<textarea class="form-control" id="eventContent" rows="3" name="eventContent"></textarea>
				  	</div>
					<div class="form-group">
					    <label for="eventFile">이벤트 썸네일</label>
					    <input type="file" class="form-control-file" id="eventFile" name="eventFile">
				  	</div>
				  	
				  	<div class="hiddengap"></div>
				  	
				  	<!-- 쿠폰 폼 -->
					<div class="h4 font-weight-bold">
						쿠폰
						<button type="button" id="addBtn" class="btn btn-warning btn-sm">추가</button>
					</div>
				  	<div class="couponBox">
				  		<div class="addedBox">
				  			<hr>
					  		<div class="form-group h5">
					  			쿠폰
					  			<button type="button" class="close closeBtn" aria-label="Close">
	  								<span aria-hidden="true">&times;</span>
								</button>
					  		</div>
							<div class="form-group">
							    <label for="couponName">쿠폰명</label>
							    <input type="text" class="form-control couponName" id="couponName">
						  	</div>
							<div class="form-group">
							    <label for="couponStart">쿠폰 사용기간</label>
							    <div class="form-row">
								    <div class="col">
								      <input type="date" class="form-control couponStart">
								    </div>
								    <span>~</span>
								    <div class="col">
								      <input type="date" class="form-control couponEnd">
								    </div>
						  		</div>
						  	</div>
						  	<div class="form-group">
						  		<label for="couponDiscount">할인금액</label>	
							    <input type="number" class="form-control couponDiscount">
						  	</div>
							<div class="form-group">
							    <label for="couponFile">쿠폰 이미지</label>
							    <input type="file" class="form-control-file couponFile">
						  	</div>
				  		</div>
				  	</div>
					
					<hr>
					<button type="button" id="insertBtn" class="btn btn-warning">등록</button>
					<button type="button" id="cancleBtn" class="btn btn-secondary">취소</button>
					
				</form>
			</div>
			<div class="row fakebox"></div>
		</div>
			
	</body>
	
	
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>