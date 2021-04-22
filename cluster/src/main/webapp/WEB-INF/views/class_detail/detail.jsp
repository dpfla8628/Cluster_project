<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>강의 상세페이지</title>
     
    <link rel="stylesheet" type="text/css" href="/css/class.css">
     <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var no = $(".no").val();

            $(".orderBtn").click(function() {
                if (no == '') {
                    alert("로그인 후 이용가능합니다");
                    return false;
                }
                else if(${offClass.classMemberSet} == ${classMemberCount}){
                	alert("수강인원 마감")
               		return false;
                }
                
                else {
                    location.href = '/class_order/order/${offClass.classNo}';
                }
                
            })

            $(".askBtn").click(function() {
                var popupWidth = 430;
                var popupHeight = 530;

                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

                var popupY = (window.screen.height / 2) - (popupHeight / 2);
                // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

                if (no == '') {
                    alert('로그인 후 이용 가능합니다');
                    return false;
                } else {
                    window.open('/class_detail/classQuestion/${offClass.classNo}/${member.memberNo}', '', 'toolbar=no, menubar=no, scrollbar=no,resizable=no, status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY);

                }
            })
            $(".moreReviewBtn").click(function() {
                open("/class_detail/review/${offClass.classNo}")
            })
			
            //천단위 콤마
            var price = $('#price').text();
            $('#price').text(price.replace(/\B(?=(\d{3})+(?!\d))/g, ","))
         
        })
        
 

 
    </script> 
    <style>


    </style>
</head>
 
<body>
    <c:set var="logInMember" value="${member.memberNick}" />
    <c:set var="classMember" value="${offClass.authMember.memberNick}" />

    <div>
         <label>번호 : ${member.memberNo}</label>
        <label>닉네임 : ${nick}</label>
        <label>권한 : ${auth}</label>

        <a href="/class_detail/list">리스트</a>
        <a href="/mypage/index">마이페이지</a>
        <a href="/login/">로긘</a> 
        <a href="/community/question">커뮤니티</a>
        <hr>
    </div>
    <div class="outbox">
        <div class="detail left_side">
            <input type="hidden" class="no" value="${member.memberNo}">
            
            <c:forEach items="${readImg}" var="readImg" varStatus="st" begin="0" end="0">
                <c:set var="fullname" value="${readImg.fullName}" />
                <div>
                    <img class="img" width="600" src="/displayFile?fileName=${fn:substringAfter(fullname,'=')}">
                </div>
            </c:forEach>
            <div class="detail link">
                <a href="#detail">상세정보</a>
                <a href="#reviewBox">리뷰(${totalReview})</a>
                <a href="#ask">문의하기</a>
                <a href="#refund">환불규정</a>
            </div>
            <hr>
            <div id="detail">
                <img class="photo" src="/image/photo2.jpg">
                <div>
                    <c:forEach items="${readImg}" var="readImg" varStatus="st" begin="1">
                        <c:set var="fullname" value="${readImg.fullName}" />
                        <div>
                            <img class="img" width="600" src="/displayFile?fileName=${fn:substringAfter(fullname,'=')}">
                        </div>
                    </c:forEach>
                    <br>
                    <label>${offClass.classInfo}</label>
                </div>

            </div>
            <div class="map">
                <h2>클래스 장소</h2>
                <label id="class_address">${offClass.classPlace}</label>
                <div id="map" style="width:auto;height:500px;margin-top:10px;"></div>
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51d927cd2d4debf550818792feac15f3&libraries=services"></script>
                <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = {
                            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                    // 지도를 생성합니다    
                    var map = new kakao.maps.Map(mapContainer, mapOption);
                    var class_address = $("#class_address").text();

                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(class_address, function(result, status) {

                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">${offClass.className}</div>'
                            });
                            infowindow.open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        }
                    });

                </script>


            </div>

            <hr>
            <div id="reviewBox">
                <h2>리뷰</h2>
                <c:choose>
                    <c:when test="${empty classReview}">
                        <h2 style="text-align: center">등록된 리뷰가 없습니다</h2>
                        <script>
                            $(".reviewList").css("height", "100")

                        </script>
                    </c:when>


                    <c:otherwise>
                        <c:forEach items="${classReview}" var="review" begin="0" end="4">
                            <div class="reviewMemberInfoBox">

                                <div class="reviewImgBox">
                                    <c:set var="fullname" value="${review.fullName}" />
                                    <c:if test="${empty review.fullName }">
                                        <img src="/image/basic.png" class="detail reviewImg">
                                    </c:if>
                                    <c:if test="${!empty review.fullName }">
                                        <div>
                                            <img class="detail reviewImg" src="/displayFile?fileName=${fn:substringAfter(fullname,'=')}">
                                        </div>
                                    </c:if>

                                </div>
                                <div class="review-left">
                                    <label class="reviewNick"> ${review.memberNick}</label>
                                </div>
                                <div class="reviewDate">
                                    <label>${review.reviewDate}</label>
                                </div>
                            </div>
                            <div class="review">
                                <div class="reviewContext">
                                    <label>${review.reviewContext}</label>

                                </div>
                                <div>
                                    <c:if test="${not empty review.reviewOk}">
                                        <img src="/image/review.png" width="20px">
                                        <label class="reviewOkNick">크리에이터</label>
                                        <div class="reviewOk">${review.reviewOk}</div>
                                    </c:if>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                <c:set var="total" value="${totalReview}" />
                <c:choose>
                    <c:when test="${total > 5 }">
                        <label>+ ${total-5}개 리뷰가 있습니다</label>
                        <button class="moreReviewBtn">리뷰 더보기</button>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${logInMember eq classMember}">
                            <button class="moreReviewBtn">리뷰 답변하기</button>
                        </c:if>
                    </c:otherwise>
                </c:choose>

                <%--     			  <jsp:include page="/WEB-INF/views/class_detail/review.jsp"/> 
 --%>
            </div>
            <div id="ask">
                <h2>문의하기</h2>
                <h4>유의사항</h4>
                <div>
                    - 클래스에 대한 궁금한 점만 문의바랍니다.<br>
                    - 클래스 외 궁금한 점은 고객센터-1:1문의하기를 이용해주시기 바랍니다.<br>
                    - 정확한 일정은 문의하기 또는 구매 후 크리에이터의 연락을 통해 이루어집니다.<br>
                    - 문의답변은 마이페이지에서 확인 가능합니다.<br>

                </div>
                <br>
                <button class="askBtn">${offClass.authMember.memberNick}님에게 문의하기</button>
            </div>

            <div id="refund">
                <h2>환불규정</h2>
                <label>강의 특성상 환불은 불가합니다.</label>
            </div>

        </div>

        <div class="detail right_side">
            <div id="classBox">
            <c:set var="totalMember" value="${offClass.classMemberSet}" />
            <c:set var="nowMember" value="${classMemberCount}" />
   				${offClass.classCategory.categoryBig} > ${offClass.classCategory.categorySmall} 
   				<label class="memberSet">${totalMember - nowMember}명 가능</label>
                <h2 class="class_name">${offClass.className}</h2><br>
                <div class="price"><label id="price">${offClass.classPrice}</label>원</div>
                <div>
                    <div class="iconBox">
                        <img src="/image/add.png" width="40px" class="icon">
                        <img src="/image/heart.jpg" width="40px" class="icon">

                    </div>
                    <div class="orderBox">
                        <button class="orderBtn">수강하기</button>

                    </div>
                </div>

            </div>

            <div id="creatorBox">
                <div class="float-box">
                    <div class=profileBox>
                        <c:set var="fullname" value="${mymember.fullName }"></c:set>
                        <c:if test="${empty mymember.fullName }">
                            <img src="/image/basic.png" class="detail profileImg">
                        </c:if>
                        <c:if test="${!empty mymember.fullName }">
                            <img class="detail profileImg" src="/displayFile?fileName=${fn:substringAfter(fullname,'=')}" alt="profile image">
                        </c:if>

                    </div>
                    <div class="creatorInfoBox">
                        <div id="creatorName"><label>${offClass.authMember.memberNick}</label></div>
                        <div id="creatorSNS"><img src="/image/icon.png" width="100"></div>
                    </div>
                </div>
                <div class="creatorInfo">
                    <label>${offClass.creator.creatorInfo}</label>
                </div>
            </div>

        </div>
    </div>
</body>


</html>
