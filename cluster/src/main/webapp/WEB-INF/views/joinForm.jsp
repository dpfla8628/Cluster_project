<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <title>크리에이터 신청 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../resources/vendors/iconfonts/mdi/css/materialdesignicons.css">
    <link rel="stylesheet" href="../resources/css/shared/style.css">
    <link rel="stylesheet" href="../resources/css/demo_1/style.css">
</head>
<style>
	.btnSet{
		margin: 20px 0px;
		float: right;	
	}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
			var formObj = $("#creator")
			
			$("#btnJoin").on("click", function(){
				formObj.attr("action", "/joinForm")
				formObj.attr("method", "post")
				formObj.submit();
		})
		
		$("#btnList").on("click", function(){
			self.location = "/join"
		})
	});
	
</script>
<body class="header-fixed">
	
	<nav class="t-header">
      <div class="t-header-brand-wrapper">
        <a href="/">
          <h1 style="color: orange;">Cluster</h1>
        </a>
      </div>
      <div class="t-header-content-wrapper">
        <div class="t-header-content">
       		<c:choose>
       			<c:when test="${member.memberAuth == '강사'}">
       				<div class="top_btn gohome"><i class="mdi mdi-account-circle"></i>
		       			<a href="/creator/home">크리에이터 홈으로</a>
		       		</div>
       			</c:when>
       			<c:when test="${member.memberAuth == '일반'}">
       				<div class="top_btn gojoin"><i class="mdi mdi-account-circle"></i>
		       			<a href="/joinForm">크리에이터 신청하기</a>
		       		</div>
       			</c:when>
       			<c:otherwise>
       				<div class="top_btn gojoin"><i class="mdi mdi-account-circle"></i>
		       			<a href="/">홈으로</a>
		       		</div>
       			</c:otherwise>
       		</c:choose>
       		
        </div>
      </div>
    </nav>
	
	<div class="page-body">
		<div class="sidebar">
			 <p>memberNo = ${member.memberNo}</p>
		</div>
		
			<div class="page-content-wrapper">
			<div class="col-lg-12">
			    <div class="grid">
			        <p class="grid-header">크리에이터 신청 페이지</p>
			        <div class="grid-body">
			            <div class="item-wrapper">
			                <div class="row mb-3">
			                    <div class="col-md-8 mx-auto">	
									<form:form modelAttribute="creator" action="joinForm" method="post">
										<input type="hidden" name="memberNo" value="${member.memberNo}"/>
										
										<div class="form-group row showcase_row_area">
						                    <div class="col-md-3 showcase_text_area"><label for="inputType9">크리에이터 설명</label></div>
						                    <div class="col-md-9 showcase_content_area"><form:textarea class="form-control" id="inputType9" cols="12" rows="5" path="creatorInfo"></form:textarea></div>
					                    </div>
					                    
					                    <div class="form-group row showcase_row_area">
						                    <div class="col-md-3 showcase_text_area"><label for="inputType1">계좌번호</label></div>
						                    <div class="col-md-9 showcase_content_area"><form:input type="text" class="form-control" id="inputType1" path="creatorAccount"/></div>
					                    </div>
									
									</form:form>
									
										<div class="btnSet">
											<button type="button" class="btn btn-outline-success" id="btnJoin">신청 하기</button>
											<button type="button" class="btn btn-outline-warning" id="btnList">취소 하기</button>      
										</div>
					
										 <h3>번호 : ${member.memberNo}</h3>
							             <h3>id : ${member.memberId}</h3>
										 <h3>권한 : ${member.memberAuth}</h3>	
								</div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>

<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  