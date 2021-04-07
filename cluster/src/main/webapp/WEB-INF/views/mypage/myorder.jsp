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
	.showcase_content_area{
		width: 115px;
    	margin: 1rem;
    	margin-left: auto;		
	}
</style>

<script>
	$(document).ready(function(){
		
	$(document).on("click","#order_cancel",function(){
		if(confirm('정말로 해당 주문을 취소하시겠습니까?')){
			$("#del").submit;
		}
		else{
			return false;
		}
	})
	$('#orderCheck').change(function(){
		var sel = $(".custom-select").val()
		console.log(sel);
	});

})
</script>


<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>

<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">주문 내역</p>
    <h1>sel자리 : ${sel }</h1>
       <div class="col-md-9 showcase_content_area">
         <select class="custom-select" id="orderCheck" name="orderCheck">
           <option value="0" id="order_all" selected="selected">전체 보기</option>
           <option value="1" id="order_ok">입금완료</option>
           <option value="2" id="order_wait">입금 대기중</option>
         </select>
       </div>
    <div class="item-wrapper">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>주문 번호</th>
              <th>강의명</th>
              <th>주문일</th>
              <th>상태</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${orderList}" var="orderlist">
            <tr>
              <td >${orderlist.orderNo}</td>
              <td>${orderlist.className}</td>
              <td>${orderlist.orderDate}</td>
              <td>
              	<c:set var="ok" value="#{orderlist.orderOk }"/>
              	<c:choose>
	              	<c:when test="${ok eq '입금대기'}">
	   	              <label class="badge badge-warning">입금 대기중...</label>
    	            </c:when>
    	            <c:otherwise>
    	            	<label class="badge badge-success">입금 완료 !</label>
    	            </c:otherwise>
              	</c:choose>
              </td>
              <td>
				<c:if test="${ok eq '입금대기'}">
				<form action="/mypage/order_remove" method="get" id="del">
              		<input type="hidden" name="orderNo" value="${orderlist.orderNo }"> 
		           <button type="submit" class="btn btn-secondary btn-xs" id="order_cancel">주문 취소</button>
              	</form>
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