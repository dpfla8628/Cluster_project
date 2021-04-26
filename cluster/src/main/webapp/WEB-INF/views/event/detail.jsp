<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<style>
	.container{
		padding: 0;
	}
	.eventHeader{
		min-height: 300px;
	}
	.eventInfoBox{
		height: 200px;
	}
	.event-body{
		min-height: 800px;
	}
	.eventBody{
		width: 700px;
	}
	.card{
		width: auto;
		height: 300px;
	}
	.page-link{
		color: #ffc107;
	}
	.page-link:hover{
		color: #ffc107;
	}
	.page-item.active .page-link{
		background-color: #ffc107;
		border-color: #ffc107;
	}
	.fakebox{
		height: 3rem; 
	}
	.couponBox{
		width: 200px;
		margin-top: 2rem;
	}
	.getCoupon{
		cursor: pointer;
	}
	.myCoupon{
		cursor: pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".getCoupon").click(function(){
			var today = new Date();
			
			var start_val = $(".eventStart").val();
			var start = new Date(start_val);
			
			var end_val= $(".eventEnd").val();
			var end = new Date(end_val);
			
			if((start <= today) && (end >= today)){
				var couponNo = $(this).parent().next().val();
				
				var formData = new FormData();
				formData.append("couponNo", couponNo);
				
				$.ajax({
					url:"${ContextPath}/event/coupon",
					type:"post",
					data: formData,
					processData: false,
					contentType: false,
					success: function (data) {
						alert(data);	
					},
					error: function(xhr){
						
						if(xhr.status == 401) {
		    				alert("로그인을 해주세요.")
		    				self.location= "/login/";
		    				return;
		    			}
						else if(xhr.status == 403){
							alert("이미 다운로드 받은 쿠폰입니다.");
							return;
						}
		    			alert("오류가 발생하였습니다.");
					}
					
				});
				
				return;
			}
			
			alert("종료된 이벤트입니다.");
		});
		
		$(".myCoupon").click(function(){
			location.href="${ContextPath}/mypage/mycoupon";
		});
	});	
</script>


	<section class="container event-body">
		<!-- 썸네일 & 제목 -->
		<article class="row eventHeader">
			<!-- 썸네일 -->
			<div class="col">
				<img width="740" height="300" src="${ContextPath}/event/displayFile?fileName=${event.eventFileName}"/>
			</div>
			<!-- 제목 -->
			<div class="col-4">
				<div class="card" >
				  <div class="card-body">
				  	<div class="eventInfoBox">
					    <h5 class="card-title">${event.eventTitle}</h5>
					    <p class="card-text">${event.eventContent }</p>
					    <hr>
					    <h6 class="card-subtitle mb-2">이벤트 기간</h6>
					    <p class="card-text">${event.eventStart} ~ ${event.eventEnd}</p>
					    <input type="hidden" value="${event.eventStart}" class="eventStart">
					    <input type="hidden" value="${event.eventEnd}" class="eventEnd">
				  	</div>
				  	<c:if test="${!(empty member)}">
					    <hr>
					    <span class="card-text text-muted myCoupon">내 쿠폰함으로 이동하기</span>
				  	</c:if>
				  </div>
				</div>
			</div>
		</article>
		
		<div class="row fakebox"></div>
		
		<!-- 본문 -->
		<article class="row justify-content-md-center">
			<div class="eventBody container">
				<div class="h2 text-center">${event.eventTitle }</div>
				<hr>
				<div class="row justify-content-md-center">
					<c:forEach var="c" items="${coupons}" >
						<div class="couponBox">
							<div><h5>${c.couponName }</h5></div>
							<div><img width="200" height="130" src="${ContextPath}/event/displayFile?fileName=${c.couponFileName}"/></div>
							<div><small>쿠폰사용기간</small></div>
							<div><small class="align-top">${c.couponStart} ~ ${c.couponEnd}</small></div>
							<div><span class="text-muted getCoupon">쿠폰 다운로드하기</span></div>
							<input type="hidden" value="${c.couponNo}">
						</div>
					</c:forEach>
				</div>
			</div>
		</article>

	</section>
	
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>