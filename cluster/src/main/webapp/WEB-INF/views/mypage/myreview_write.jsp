<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>

<style>

</style>

<script>

</script>

<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>

  <div class="content-viewport">
    <div class="row">
      <div class="col-lg-6 equel-grid">
        <div class="grid">
          <p class="grid-header">리뷰관리</p>
          <div class="grid-body">
            <div class="item-wrapper">
              <form>
                <div class="form-group">
                <!-- 강의명은 수정 불가능 -->
                  <label for="inputEmail1">오프라인 강의명</label>
                  <input type="text" class="form-control" id="inputClass" value="오프라인 강의명" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="inputPassword1">리뷰 내용</label>
                  <textarea class="form-control" id="inputReview" placeholder="Enter your review" cols="12" rows="20"></textarea>
                </div>
                <button type="submit" class="btn btn-sm btn-primary">작성하기</button>
              </form>
            </div>
          </div>
        </div>
      </div>
<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>