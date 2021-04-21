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
			var formObj = $("#Creator")
			
			$("#btnEdit").on("click", function(){
				formObj.attr("action", "/creator/edit")
				formObj.attr("method", "post")
				formObj.submit();
		})
		
		$("#btnList").on("click", function(){
			self.location = "/creator/home"
		})
	});
	
</script>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="page-content-wrapper">
<div class="col-lg-12">
    <div class="grid">
        <p class="grid-header">크리에이터 수정 페이지</p>
        <div class="grid-body">
            <div class="item-wrapper">
                <div class="row mb-3">
                    <div class="col-md-8 mx-auto">	
						<form:form modelAttribute="Creator" action="edit" method="post">
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
								<button type="button" class="btn btn-outline-success" id="btnEdit">수정 하기</button>
								<button type="button" class="btn btn-outline-warning" id="btnList">취소 하기</button>      
							</div>
		
					</div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  