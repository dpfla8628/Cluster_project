<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="../resources/package/swiper-bundle.min.js"></script>
<script src="../resources/vendors/js/core.js"></script>
<script src="../resources/js/template.js"></script>
<script src="../resources/js/dashboard.js"></script>
<style>
	#memberout{
		margin-left: 1rem;
	}
</style>
<script>
$(document).ready(function(){
	$(document).on("click","#memberout",function(){
		if(confirm('정말로 회원 탈퇴 하시겠습니까? \n (탈퇴시 구매내역, 이벤트 등의 정보 복구가 불가능합니다)')){
			$("#del").submit;
		}
		else{
			return false;
		}
	})
})
</script>
<!-- partial -->
    <div class="page-body">
      <!-- partial:partials/_sidebar.html -->
      <div class="sidebar">
        <ul class="navigation-menu">

  
		<li>
		<!-- 만약 크리에이터 권한이 있다면??? -->
		<c:if test="${auth eq '강사'}">
			<li>
            <a href="#">
              <span class="link-title">크리에이터 페이지 이동하기</span>
              <i class="mdi mdi-arrow-right-bold"></i>
            </a>
            </li>
            <hr><br>
         </c:if>
         <!--  --> 
          
          <li>
            <a href="#myinfo" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">내 정보</span>
              <i class="mdi mdi-account-box"></i>
            </a>
            <ul class="collapse navigation-submenu" id="myinfo">
              <li>
                <a href="myquestion">강의 문의 내역</a>
              </li>
            </ul>
          </li>
          
 		  <li>
            <a href="#myclass" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">내 클래스</span>
              <i class="mdi mdi-airplay"></i>
            </a>
            <ul class="collapse navigation-submenu" id="myclass">
              <li>
                <a href="myclass">강의실</a>
              </li>
              <li>
                <a href="myreview_list">리뷰확인</a>
              </li>
            </ul>
          </li>
          
          <li>
            <a href="myorder">
              <span class="link-title">주문내역</span>
              <i class="mdi mdi-shopping"></i>
            </a>
          </li>
          
        </ul>
        <form action="/mypage/memberout" method="post" id="del">
        	<button type="submit" class="btn btn-inverse-dark btn-xs" id="memberout">회원 탈퇴</button>
        </form>
      </div>
