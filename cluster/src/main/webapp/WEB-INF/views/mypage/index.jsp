<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>
<link rel="stylesheet" href="../resources/package/swiper-bundle.min.css">
<style>
	.display-avatar{
		float:left;
	}
	.user-profile{
		padding: 3rem;
	    background-color: linen;
	    margin: 3rem;
	    border-radius: 39px;
	}
	.user-info>li{
		margin:5px;
	}
	.display-avatar{
		margin: 3rem;
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
    
    .likeimg:hover{
    	border: 4px solid orange;
    }
    .likeimg{
    	width: 190px;
    	height: 135px;
    }
    .clsname{
    	position: absolute;
    	top: 78%;;
    }
    .hello{
    	color: lightslategrey;
    }
    .likecss{
    	color: firebrick;
    	font-weight: bold;
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
             <!-- 세션 테스트입니다 !! -->
              <%-- <h3>번호 : ${no}</h3>
             <h3>id : ${id}</h3>
			 <h3>권한 : ${auth}</h3> --%>
			 
             <div class="user-profile">
			    <div class="display-avatar">
			    <c:set var="fullname" value="${mymember.fullName }"></c:set>
			    	<c:if test="${empty mymember.fullName }">
			    	<img class="profile-img img-lg rounded-circle" src="../resources/image/profile.jpg" alt="profile image">
			    	</c:if>
			    	<c:if test="${!empty mymember.fullName }">
			      	<img class="profile-img img-lg rounded-circle" src="/mypage/displayFile?fileName=${fn:substringAfter(fullname,'=')}" alt="profile image">
			    	</c:if>
			    </div>
			    	<h1 class="hello">${mymember.memberNick }님 반갑습니다😊</h1>
			    	<ul class="user-info">
			    		<!-- member_coupon / 해당 member_no에 맞는 coupon_no 카운팅 -->
			    		<li>
			    			내 쿠폰
			    			<a href="mycoupon">
				    			<div class="btn btn-outline-danger btn-rounded btn-xs">${couponcount}</div>
				    		</a>	
			    		</li>
			    		
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
          	<h4 class="likecss"><i class="mdi mdi-heart-box-outline"></i>찜한 강의</h4>
          	
			  <!-- Swiper -->
			  <div class="swiper-container">
			    <div class="swiper-wrapper">
			    <c:forEach items="${likeList}" var="likelist">
			    <!-- offclass 메인 이미지 불러오기 (classlike랑 join해서 로그인한 member_no가 찜한걸로) -->
			      <div class="swiper-slide">
			      	<div><a href="#"><img class="likeimg" src="../resources/image/test.PNG"></a></div>
			      	<div class="clsname">${likelist.className}</div>
			      </div>
			      </c:forEach>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			  </div>
          	
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
        delay: 3500,
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

