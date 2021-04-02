<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="../resources/package/swiper-bundle.min.css">
<style>
	.display-avatar{
		float:left;
	}
	.user-profile{
		margin:5rem;
	}
	.user-info>li{
		margin:5px;
	}
	.display-avatar{
		.margin-right:10px
	}
	
	a{
		color:black;
	}
	a:hover{
		font-weight:bold;
		color:orange;
	}
	
    .swiper-container {
      width: 100%;
      height: 250px;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
</style>



<script>
$(document).ready(function(){
	$("#myedit_click").on("click",function(){
		
	self.location="myedit"
	
	})

})
</script>
    
      <!-- partial -->
      <jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>
      
      <div class="page-content-wrapper">
        <div class="page-content-wrapper-inner">
             
             <div class="user-profile">
			    <div class="display-avatar">
			      	<img class="profile-img img-lg rounded-circle" src="assets/images/profile/male/image_1.png" alt="profile image">
			    </div>
				
			    	<h1>${member.memberNick }님 반갑습니다😊</h1>
			    	<ul class="user-info">
			    		<!-- member_coupon / 해당 member_no에 맞는 coupon_no 카운팅 -->
			    		<li><a href="coupon">내 쿠폰()</a></li>
			    		
			    		<!-- order / order_ok='입금 완료' 카운팅 -->
			    		<li>
			    		수강중인 강의
			    		<a href="myclass">
			    			<div class="btn btn-outline-danger btn-rounded btn-xs">${ordercount}</div>
			    		</a>
			    		</li>
			    	</ul>
                <div class="btn btn-outline-warning btn-rounded" id="myedit_click">수정하기</div>
          </div>
          
          <div class="user-like">
          	<h4><i class="mdi mdi-heart-box-outline"></i>찜한 강의</h4>
          	
			  <!-- Swiper -->
			  <div class="swiper-container">
			    <div class="swiper-wrapper">
			    <!-- offclass 메인 이미지 불러오기 (classlike랑 join해서 로그인한 member_no가 찜한걸로) -->
			      <div class="swiper-slide">Slide 1</div>
			      <div class="swiper-slide">Slide 2</div>
			      <div class="swiper-slide">Slide 3</div>
			      <div class="swiper-slide">Slide 4</div>
			      <div class="swiper-slide">Slide 5</div>
			      <div class="swiper-slide">Slide 6</div>
			      <div class="swiper-slide">Slide 7</div>
			      <div class="swiper-slide">Slide 8</div>
			      <div class="swiper-slide">Slide 9</div>
			      <div class="swiper-slide">Slide 10</div>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			  </div>
          	
          </div>
      </div>

<script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 30,
      slidesPerGroup: 3,
      loop: true,
      loopFillGroupWithBlank: true,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
</script>

<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>

