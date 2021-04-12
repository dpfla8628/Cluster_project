<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>
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

</script>

<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>

<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">나의 쿠폰</p>
    <div class="item-wrapper">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>이벤트명</th>
              <th>쿠폰명</th>
              <th>쿠폰 만료일</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${couponlist}" var="couponlist">
          <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
		  <fmt:formatDate value="${couponlist.couponEnd }" pattern="yyyy-MM-dd" var="write_dt"/>
            <tr>
          	<c:if test="${today <= write_dt }">				
              <td>${couponlist.eventTitle }</td>
              <td>${couponlist.couponName }</td>
              <td>~${couponlist.couponEnd} </td>
              </c:if>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>


<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>