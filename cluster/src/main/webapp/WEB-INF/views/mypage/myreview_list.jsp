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
	$(document).on("click","#delbtn",function(){
		if(confirm('정말로 해당 리뷰를 삭제하시겠습니까?')){
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
   <p class="grid-header">나의 리뷰</p>
    <div class="item-wrapper">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>리뷰번호</th>
              <th>강의명</th>
              <th>작성날짜</th>
              <th></th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
           <c:forEach items="${reviewList}" var="review">	
           <c:if test="${!empty review.reviewContext }">			
            <tr>
              <td>${review.reviewNo }
              <td>${review.className}</td>
              <td>${review.reviewDate }</td>
              <td>
              
				 <a href="#r${review.reviewNo}" data-toggle="collapse" aria-expanded="false">
					<i class="mdi mdi-arrow-bottom-left">리뷰 보기</i>
				  </a>
			 
              </td>
              <td>
              <c:if test="${empty review.reviewOk }">
              	<a href="/mypage/myreview_edit?reviewNo=${review.reviewNo}">
              		<button type="button" class="btn btn-inverse-success btn-xs" id="edit">수정하기</button>
              	</a>
              </c:if>
              </td>
              <td>
              	<form action="/mypage/review_remove" method="get" id="del">
              		<input type="hidden" name="reviewNo" value="${review.reviewNo }"> 
              	 	<button type="submit" class="btn btn-inverse-dark btn-xs" id="delbtn">삭제하기</button>
              	</form>
              </td>
            </tr>
			<tr>
            <td colspan="6">
	            <div class="collapse navigation-submenu" id="r${review.reviewNo}">
				<p>
					${review.reviewContext }
					<c:if test="${!empty review.reviewOk }">
						<hr>
						<i class="mdi mdi-message-reply-text">강사님 답변  : ${review.reviewOk}</i>
					</c:if>
				</p>
				</div>
			</td>
            </tr>
             </c:if>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>