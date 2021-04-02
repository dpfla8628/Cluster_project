<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>
<script>
	$(document).ready(function(){
		//alert(${msg})
	})
</script>
<div class="grid">
  <p class="grid-header">내 정보 수정</p>
  <div class="grid-body">
    <div class="item-wrapper">
      <form:form modelAttribute="member" action="/mypage/myedit" method="post">
       <!--프로필 사진 추가해야함  
       <div class="form-group">
			<input type="file" id="inputFile" value="">
		</div> -->
		<form:hidden path="memberNo"/>
        <div class="form-group">
          <label for="memberId">아이디</label>
          <form:input path="memberId" class="form-control" readonly="true"/>
        </div>
        <div class="form-group">
          <label for="memberNick">닉네임</label>
           <form:input path="memberNick" class="form-control"/>
        </div>
        <div class="form-group">
          <label for="memberPhone">휴대폰번호</label>
           <form:input path="memberPhone" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
      </form:form>
      <p>${msg }</p>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>