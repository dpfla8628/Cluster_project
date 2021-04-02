<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <p class="grid-header">쿠폰함</p>
    <div class="item-wrapper">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>쿠폰명</th>
              <th>발급일</th>
              <th>만료일</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>쿠폰명 데이터</td>
              <td>발급일 데이터</td>
              <td>만료일 데이터</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>


<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>