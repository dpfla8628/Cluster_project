<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/creator/template/header.jsp"></c:import>
<style>
	.btnSet{
		margin: 20px 0px;
		float: right;	
	}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
			var formObj = $("#classQuestion")
			
			$("#btnUpdate").on("click", function(){
				formObj.attr("action", "/creator/answer")
				formObj.attr("method", "post")
				formObj.submit();
		})
		
		$("#btnList").on("click", function(){
			self.location = "/creator/inquiry"
		})
	});
	
</script>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="page-content-wrapper">
<div class="col-lg-12">
    <div class="grid">
        <p class="grid-header">강의 질문 답변</p>
        <div class="grid-body">
            <div class="item-wrapper">
                <div class="row mb-3">
                    <div class="col-md-8 mx-auto">	
						<form:form modelAttribute="classQuestion" action="answer" method="post">
							<form:hidden path="classqNo"/>
							<div class="form-group row showcase_row_area">
	                            <div class="col-md-3 showcase_text_area"><label for="inputType9">질문 내용</label></div>
	                            <div class="col-md-9 showcase_content_area">
	                            	<form:textarea class="form-control" id="inputType9" col="10" row="10" path="classQ" readonly="readonly"/>
	                            </div>
	                        </div>
							<div class="form-group row showcase_row_area">
	                            <div class="col-md-3 showcase_text_area"><label for="inputType9">답변 내용</label></div>
	                            <div class="col-md-9 showcase_content_area">
	                            	<form:textarea class="form-control" id="inputType9" col="10" row="10" path="classA"/>
	                            </div>
	                        </div>
						</form:form>
						
							<div class="btnSet">
								<button type="button" class="btn btn-outline-success" id="btnUpdate">완료</button>
								<button type="button" class="btn btn-outline-warning" id="btnList">취소</button>      
							</div>
						
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  