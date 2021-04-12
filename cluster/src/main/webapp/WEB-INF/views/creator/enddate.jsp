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
		var formObj = $("#offclass")
		
		$("#btnUpdate").on("click", function(){
			formObj.attr("action", "/creator/enddatemodify")
			formObj.attr("method", "post")
			formObj.submit();
	})
	
	$("#btnList").on("click", function(){
		self.location = "/creator/classinfo"
	})
});
	
</script>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="col-lg-12">
    <div class="grid">
        <p class="grid-header">시작날짜 수정</p>
        <div class="grid-body">
            <div class="item-wrapper">
                <div class="row mb-3">
                    <div class="col-md-8 mx-auto">	
						<form:form modelAttribute="offclass" action="enddatemodify" method="post">
							<form:hidden path="classNo"/>
							
							<div class="form-group row showcase_row_area">
	                            <div class="col-md-3 showcase_text_area"><label for="inputType14">시작날짜 설정</label></div>
	                            <div class="col-md-9 showcase_content_area mb-2 pl-1">
	                                <div class="demo-wrapper">
	                                    <div id="datepicker-popup" class="input-group date datepicker"><form:input type="date" class="form-control" path="classEnd"/> <span class="input-group-addon input-group-append"><span class="mdi mdi-calendar input-group-text"></span></span></div>
	                                </div>
	                            </div>
	                        </div>
						
						</form:form>
						
							<div class="btnSet">
								<button type="button" class="btn btn-outline-success" id="btnUpdate">날짜 수정</button>
								<button type="button" class="btn btn-outline-warning" id="btnList">취소 하기</button>      
							</div>
						
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  