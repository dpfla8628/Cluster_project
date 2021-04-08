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
		width: 150px;
    	margin: 1rem;
    	margin-left: auto;		
	}
	.mb-0{
		float: right;	
	}
</style>

<script>
	$(document).ready(function(){
		
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
       <div class="item-wrapper">
      <div class="table-responsive">
        <div class="btn-group mb-0">
           <label class="btn btn-outline-info">
             <input type="radio" name="options" id="option1_1" OnClick="window.location.href='/mypage/myorder';">
             	입금 대기중
           </label>
           <label class="btn btn-outline-info active">
             <input type="radio" name="options" id="option1_2" checked>
             	입금 완료
           </label>
         </div>
        <table class="table table-striped">
          <thead>
            <tr>
              <th>주문 번호</th>
              <th>강의명</th>
              <th>주문일</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${orderList}" var="orderlist">
          <c:set var="ok" value="#{orderlist.orderOk }"/>
          <c:if test="${ok eq '입금완료'}">
            <tr>
              <td >${orderlist.orderNo}</td>
              <td>${orderlist.className}</td>
              <td>${orderlist.orderDate}</td>
              <td>
    	          <label class="badge badge-success">입금 완료 !</label>
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