<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
    <script>
    $(function(){
/*         var IMP = window.IMP; // 생략가능
 */        IMP.init('imp10358005'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '${kakaopay.className}',
            amount : '${kakaopay.orderPrice}',
            buyer_email : '${kakaopay.memberId}',
            buyer_name : '${kakaopay.orderName}',
            buyer_tel : '${kakaopay.memberPhone}',
            buyer_postcode: '${kakaopay.orderNo}'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		     	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
    			}
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                $.ajax({
                    url: "/class_order/kakaopay/${kakaopay.orderNo}",
                    data: "orderNo=" + '${kakaopay.orderNo}',
                    type: "POST",
                    success : function(data){
                        if(confirm('입금 완료 \n 마이페이지로 이동하시겠습니까?')){
                        	location.href = "/mypage/myorder";
                        }
                        else{
                        	window.location.href = "/class_detail/detail/${kakaopay.classNo}";	
                        }
						
                      },
                    error : function(){
                       alert("에러")
                     }
                  });

             } else {
                msg = '결제에 실패하였습니다.'+ rsp.error_msg;
                msg +='\n 입금대기 상태입니다 마이페이지에서 확인 가능합니다';
                //실패시 이동할 페이지
                alert(msg);
                location.href="/class_detail/detail/${kakaopay.classNo}"; 
                
            }
        });
        
    });
    </script>
 
</body>
</html>
