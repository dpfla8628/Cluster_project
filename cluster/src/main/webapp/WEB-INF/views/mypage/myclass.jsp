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
	img{
		width: 155px;
   		height: 110px;
	}
</style>

<script>
</script>

<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>


<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">나의 클래스</p>
    <div class="item-wrapper">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>강의 이미지</th>
              <th>강의 명</th>
              <th>강의 날짜</th>
              <th>강의 연락처</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${orderList}" var="orderlist">				
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
		<fmt:formatDate value="${orderlist.classEnd }" pattern="yyyy-MM-dd" var="write_dt"/>
          <c:if test="${today <= write_dt }">
            <tr>
              <td><img src="../resources/image/test.PNG"></td><!-- 강의 이미지 넣기 !! -->
              <td><a href="#">${orderlist.className}</a></td><!-- 클릭하면 강의 상세페이지로 이동 -->
              <td>~${orderlist.classEnd} </td><!-- 오늘 날짜 기준으로 넘어가면 안보이게하기 !!! -->
              <td>${orderlist.classTalk }</td>
              <td>
				<!-- 이미 후기를 썼다면 해당 버튼 없애기 !! 후기 안쓴 경우에만 후기 쓸 수 있는 버튼 만들기 -->              
              	<c:if test="${empty orderlist.reviewContext }">
              		<a href="/mypage/myreview_write?classNo=${orderlist.classNo}">
		           		<button type="submit" class="btn btn-secondary btn-xs" id="r_write">후기 작성</button>
              		</a>
              	</c:if>
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