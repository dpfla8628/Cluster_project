<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>

<style>

</style>

<script>

</script>

<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>

      <div class="col-lg-6 equel-grid">
        <div class="grid">
          <p class="grid-header">리뷰관리</p>
          <div class="grid-body">
            <div class="item-wrapper">
              <form:form modelAttribute="myreview" action="/mypage/myreview_write" method="post">
                <form:hidden path="classNo"/>
                <div class="form-group">
                <!-- 강의명은 수정 불가능 -->
                  <label for="className">오프라인 강의명</label>
                  <form:input path="className" class="form-control" readonly="true"/>
                </div>
                <div class="form-group">
                  <label for="reviewContext">리뷰 내용</label>
                  <form:textarea path="reviewContext" placeholder="수업은 즐거우셨나요 ? 솔직한 리뷰 부탁드려요:)" class="form-control" cols="12" rows="20"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary">작성하기</button>
             	</form:form>
            </div>
          </div>
        </div>
      </div>
<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>