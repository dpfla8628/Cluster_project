<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date"/>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
      <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            //천단위 콤마 
            var classPrice = $('label[for=classPrice]').text();
            $('label[for=classPrice]').text(classPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ","))
            var orderPrice = $('input[name=orderPrice]').val();
            $('input[name=orderPrice]').val(orderPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ","))
            
            var coupon = $('input[name="couponNo"]');
            var totalPrice = $("input[name=totalPrice]").val();

            $(".cancelBtn").click(function() {
                for (var i = 0; i < coupon.length; i++) {
                    coupon[i].checked = false;
                }
                $("label[for='discount']").text("0");
                $("input[name=orderPrice]").val(classPrice);
                $("label[for='discount']").css("color", "black")
                
                var orderPrice = $('input[name=orderPrice]').val();
                $('input[name=orderPrice]').val(orderPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ","))
               
            })
            $(".checkBtn").click(function() {
                var discount = $("input[type='radio']:checked:last").next().text()
                if(!discount){
                    return false
                }
 				if(discount>classPrice){
 					return false
 				}
                $("label[for='discount']").text(-discount);
                $("label[for='discount']").css("color", "red")
                $("input[name=orderPrice]").val(parseInt(classPrice) - parseInt(discount));
                
                 var orderPrice = $('input[name=orderPrice]').val();
                 $('input[name=orderPrice]').val(orderPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ","))
                
                var discount = $("label[for='discount']").text();
            	$('label[for=discount]').text(discount.replace(/\B(?=(\d{3})+(?!\d))/g, ",")) 
            })
            
             $('.phone').keydown(function (event) {
             	var key = event.charCode || event.keyCode || 0;
             	$text = $(this); 
	             if (key !== 8 && key !== 9) {
	                 if ($text.val().length === 3) {
	                     $text.val($text.val() + '-');
	                 }
	                 if ($text.val().length === 8) {
	                     $text.val($text.val() + '-');
	                 }
             }

             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
			 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
			 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
         	})
			
          
         	
            $('.orderBtn').click(function(){
            	if($('.name').val() == 0|| $('.phone').val() == 0){
            		alert("정보를 입력해주세요")
            		return false;
             	}
            	//콤마 제거
            	var orderPrice =  $("input[name=orderPrice]").val();
                $("input[name=orderPrice]").val(orderPrice.replace(/[^\d]+/g, ""))
            
            })
    	 	//엔터쳤을 때 submit 방지
    	 	$("input[type=text], button").keydown(function(){
    	 	    if(event.keyCode === 13)
    	 	        event.preventDefault();
    	 	});
            

			
         })
 
    </script>

       <style>
          padding: 0;
          margin: 0;
          }

          * {
              box-sizing: border-box;
          }

          .outbox {
              width: 600px;
              margin: 0 auto;
            }

          .classPrice,
          .discount,
          .orderPrice {
              float: right;
          }

          .priceBox>div {
              margin-top: 1rem;
          }

          .name,
          .phone {
              width: 600px;
              height: 35px;
              margin-bottom: 15px;
              border: 0.5px solid lightgray;
              padding-left : 0.5rem;
          }

          .cancelBtn,
          .checkBtn {
              width: 100px;
              height: 30px;
               border: 0.5px solid lightgray;
              background-color: transparent;
              border-radius: 50px;
              font-size :13px;
          }

          .cancelBtn:hover,
          .checkBtn:hover {
              border: none;
              background-color: #ffc107;
              color: aliceblue;
              font-weight: 500;
          }

          .orderBtn {
              width: 600px;
              height: 50px;
			  border: 0.5px solid lightgray;
              background-color: transparent;
              font-size: 18px;
              font-weight: 300;
			  margin-top: 1rem;
          }

          .orderBtn:hover {
              border: none;
              background-color: #ffc107;
              color: white;
              font-weight: 400;
          }

          .text {
              font-weight: bold;
              font-size: 20px;
              margin : 0;
           }

          .couponBox {
              margin-top: 0.5rem;
           }
          
          .couponBtn{
          	margin-top :0.5rem;
          }
          input[name=orderPrice]{
              border:none;
              text-align: right;
              font-size: 17px;
              font-weight: bold;
          }
 		
      </style>
</head>
<body>

    <div class="outbox">
        <form:form modelAttribute="myClassOrder" action="${offClass.classNo}" method="post">
             	<label class="text">결제하기</label>   
        	<br>
            <div>
                <h3>수강 신청 클래스</h3>
                <label><a href="/class_detail/detail/${offClass.classNo}">${offClass.className}</a></label><br>
           		 <c:forEach items="${readImg}" var="readImg" varStatus="st"  begin="0" end="0">
                 <c:set var="fullname" value="${readImg.fullName}"/>
            	<div>
               		<img class="img" width="200" src="/mypage/displayFile?fileName=${fn:substringAfter(fullname,'=')}">
            	</div> 
            	<br> 
         </c:forEach>
            </div>
             <div>
                <h3>주문자 정보</h3>
                <input type="hidden" name="classNo" value="${offClass.classNo}">
                <input type="hidden" name="memberNo" value="${member.memberNo}">
                <div>
                    <label>입금자 이름</label><br>
                    <input type="text" class="name" name="orderName" value="">
                </div>
                <div>
                    <label>휴대폰 번호</label><br>
                    <input type="text" class="phone" name="memberPhone" maxlength="13" value="${member.memberPhone}">
                </div>
            </div>
			<hr>
            <div class="priceBox">
                <h3>결제 금액</h3>
                <div>
                     
                          <label class="text">사용 가능한 쿠폰</label>
                      
                    
	                   <%--  <c:when test="${!empty couponList}"> --%> 
	                    <div class="couponBtn">
	                    	<button type="button" class="cancelBtn">쿠폰 취소</button>
			 				<button type="button" class="checkBtn">쿠폰 적용</button>
			 			</div> <c:choose>
			 			<c:when test="${!empty couponList}">
	                        <c:forEach items="${couponList}" var="coupon">	
                    			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" var="today" />  
				 				<fmt:formatDate value="${coupon.couponEnd }" pattern="yyyy-MM-dd hh:mm:ss" var="myCoupon"/>
			 					<c:if test="${today <= myCoupon }">	
			 						<div class="couponBox">
			 							<label>
			 								<input type="radio" id="couponRadio" value="${coupon.couponNo}" name="couponNo">
			 								${coupon.couponName} (<span>${coupon.couponDiscount}</span>원 할인)
			 							</label>
			 						</div>
					     		</c:if>
							</c:forEach>
							</c:when>
							<c:otherwise> 
							<c:if test="${today >= myCoupon }">
								<script>
									 $('.couponBtn').hide()
								</script>
								<div class="couponBox">사용가능한 쿠폰이 없습니다</div>
							</c:if>
							</c:otherwise>
			 					</c:choose>
	                   <%--  </c:when>
                    	<c:otherwise>
                   
 	                    	<div class="couponBox">사용가능한 쿠폰이 없습니다</div>
                     	</c:otherwise>  --%> 
                	           
                </div>
                <hr>
                <div>
                    총 금액
                    <div class="classPrice"><label for="classPrice">${offClass.classPrice}</label></div>
                </div>
                <div>
                    쿠폰 할인 금액
                    <div class="discount"><label for="discount">0</label></div>
                </div>

                <hr>
                <div>
                    최종 금액
                    <div class="orderPrice"><input type="text" name="orderPrice" value="${offClass.classPrice}"></div>
                </div>
            </div>
            <input type="submit" class="orderBtn" value="결제하기">
        </form:form>
    </div>
</body>
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>

</html>