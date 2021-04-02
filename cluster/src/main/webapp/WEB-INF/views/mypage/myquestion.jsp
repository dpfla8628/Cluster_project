<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>

<style>
	.table:not(.table-bordered) thead tr th{
		background-color: orange;
    	color: white;
    	font-weight: bold;
	}
</style>

<script>
	$(document).ready(function(){
	$(document).on("click","#question_cancel",function(){
		if(confirm('정말로 해당 질문을 삭제하시겠습니까?')){
			$("#del").submit;
		}
		else{
			return false;
		}
	})
})
	
</script>

<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>

 <div class="col-lg-6">
  <div class="grid">
   <p class="grid-header">나의 강의 문의</p>
    <div class="item-wrapper">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>문의 번호</th>
              <th>강의명</th>
              <th><i class="mdi mdi-comment-question-outline"> </i>문의 사항</th>
              <th>상태</th>
              <th></th><th></th>
            </tr>
          </thead>
          <tbody>
			<c:forEach items="${questionList}" var="question">				
            <tr>
              <td>${question.classqNo}</td>
              <td>${question.className }</td>
              <td>${question.classQ }</td>
              <td>
              	<c:choose>
	              	<c:when test="${empty question.classA}">
	   	              <label class="badge badge-warning">답변 대기중</label>
	   	              <td> </td>
    	            </c:when>
    	            <c:otherwise>
    	            		<label class="badge badge-success">
				              	답변 완료
				          	</label>
			</td>
			<td>
				            <a href="#q${question.classqNo}" data-toggle="collapse" aria-expanded="false">
								<i class="mdi mdi-arrow-bottom-left"></i>
				            </a>
    	            </c:otherwise>
              	</c:choose>
              </td>
              <td>
              <form action="/mypage/question_remove" method="get" id="del">
              		<input type="hidden" name="classqNo" value="${question.classqNo}"> 
		           <button type="submit" class="btn btn-secondary btn-xs" id="question_cancel">삭제</button>
              	</form>
              </td>
            </tr>
			<tr>
            <td colspan="6">
				<c:if test="${!empty question.classA }">
		            <div class="collapse navigation-submenu" id="q${question.classqNo}">
						<p>
						<i class="mdi mdi-comment-text-outline"></i>${question.classA }
						</p>
					</div>
            	</c:if>
			</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>