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
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
    	 	//엔터쳤을 때 submit 방지
    	 	$("input[type=text], input[type=text], button").keydown(function(){
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
        .img {
            margin: 10px 0;
        } 
        .reviewList {
            display: block;
            width: 600px;
            margin: 0 auto;
            height: auto;
        }

        .link>a {
            margin-left: 80px;
        }

        #reviewBox {
             height: auto;

        } 
        #creatorName
        {
            font-size: 20px;
            font-weight: 600;

        }
 
         .reviewImg {
            border-radius: 50%;
            width: 30px;
            height: 30px;

        }

        .reviewImgBox {
            float: left;
            margin-right: 10px;
        }

        .reviewImgBox::after {
            content: "";
            display: block;
            clear: both;
        }

        .reviewNick {
            font-size: 14px;
            font-weight: 600;
        }

        .reviewDate {
            font-size: 11px;
            font-weight: 300;
        }
 

        .review-left {
            margin-top: 0px;
            padding: 0px;
            margin-bottom: -3px;
        }
        .reviewBtn {
            float: right;
            /* width: 100px; */
            border: none;
            background-color: transparent;
            font-weight: 300;
            text-decoration: none;
            color: black;
            font-size: 13px; 
            margin-left : 50px;
        }

        .reviewBtn > a:hover {
            font-weight: bold;
        }
        
        .reviewOkNick{
        	font-size: 15px;
        }
        .reviewContext {
        	font-size : 13px;
            margin: 1rem 0;
        }
        #reviewOk {
            margin-top: 0px;
            margin-left : 1.6rem;
            font-weight: 300;
            font-size: 13px;
        }
        
 
		.link> a{
			text-decoration: none;
			color : gray;
			font-weight: 300;
		}
		.link >a:hover{
			color : black;
			font-weight: 500;
		}
          .reviewA {
             width: 520px;
             height: 100px;
             margin-top: 1rem;
             padding-left: 5px;
 			 
 			  }

         .reviewInsertBtn {
             width: 65px;
             height: 106px;
             background-color: transparent;
             margin-left: -5px;
             font-size: 16px;
             font-weight: 300;
             border-left: none;
             border : 0.1px solid gray;
             padding: 0;
          }

         .reviewInsertBtn:hover {
             font-weight: 400;
             background-color: #ffc107;
             color: aliceblue;
/*             border: none;*/
             border-radius: 0;
             height: 106px;
         }
                  .box {
             width: 600px;
             height: 100px;
             background-color: #ffc107;
             display: flex;
             justify-content: center;
             align-items: center;
             margin-bottom : 10px;
         }

         .boxText {
             width: 300px;
             height: 50px;
             font-weight: 100;
             font-size: 50px;
             display: flex;
             justify-content: center;
             align-items: center;
         }
    </style>
</head>
<body>
 <c:set var="logInMember" value="${nick}"/>
<c:set var="classMember" value="${offClass.member.memberNick}"/>

<div class="reviewList">
  	
  <c:choose>
    <c:when test="${empty classReview}">
        <h2 style="text-align: center">등록된 리뷰가 없습니다</h2>
        <script>
        	$(".reviewList").css("height","100")
        </script>
  	</c:when>
    
   
    <c:otherwise>
       <div class="box">
                     <div class="boxText">클래스 후기</div>
                 </div>
        <c:forEach items="${classReview}" var="review">
<div class="reviewMemberInfoBox">

        <div class="reviewImgBox">
         <c:set var="fullname" value="${review.fullName}"/>
        	<c:if test="${empty review.fullName }">
               <img src="/image/basic.png" class="reviewImg">
            </c:if>
              <c:if test="${!empty review.fullName }">
            	<div>
               		<img class="reviewImg" src="/mypage/displayFile?fileName=${fn:substringAfter(fullname,'=')}">
            	</div>  
              </c:if>
             
        </div>
        <div class="review-left">
            <label class="reviewNick"> ${review.memberNick}</label>

            <c:if test="${not empty review.reviewOk}">
                <c:if test="${logInMember eq classMember}">
                    <div class="reviewBtn">
                        <a id="reviewEdit${review.reviewNo}">답변 수정</a>
                        &nbsp; &nbsp;
                        <a id="reviewDelete${review.reviewNo}">답변 삭제</a>
                        <input type="hidden" class="reviewOkNum" value="${review.reviewNo}">
                    </div>
                </c:if>
            </c:if>

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
                        <div class="reviewOk${review.reviewNo}" id="reviewOk">${review.reviewOk}</div>
                    </c:if>
                </div>
               <c:if test="${empty review.reviewOk}">
                	<c:if test="${logInMember eq classMember}"> 
                <div class="reviewForm">
                    <form action="/class_detail/review/${review.classNo}" method="post" id="insertForm" > 
                        <input type="hidden" id ="reviewNo${review.reviewNo}" name="reviewNo" value="${review.reviewNo}">
                         <input type="text" name="reviewOk" class="reviewA" value="${review.reviewOk}">
                        <input type="submit" class="reviewInsertBtn" value="등록">
                    </form>
                </div>
                	</c:if>
                </c:if>
				<div class="reviewForm${review.reviewNo}">
                    <form:form modelAttribute="review" action="${review.classNo}" method="post" id="updateForm"> 
                        <input type="hidden" name="reviewNo" id="reviewNo${review.reviewNo}" value="${review.reviewNo}">
                         <input type="text" name="reviewOk" class="reviewA" value="${review.reviewOk}">
                        <input type="submit" class="reviewInsertBtn" value="등록">
                    </form:form>
                </div>
                <script>
                $(document).ready(function(){ 
					  var reviewDelete = $("#updateForm")
					  var reviewNum = $("#reviewNo${review.reviewNo}").val()
 					  var classNum = ${review.classNo}
					  
  					  $("#reviewDelete${review.reviewNo}").on("click",function(){
						  if(confirm("리뷰 답변 삭제하시겠습니까?")){
							  reviewDelete.attr("action", "/class_detail/reviewDelete/"+classNum+"/"+reviewNum);
							  reviewDelete.submit();
						  }  
						  
					  })   
					  

		                $("#updateForm").hide();
		                $(".reviewForm${review.reviewNo}").hide();

		                $("#reviewEdit${review.reviewNo}").on("click", function() {
		                    $(".reviewForm${review.reviewNo}").show();
		                    $(".reviewOk${review.reviewNo}").hide();
  		                });  
					});
                

            	
            	
                </script>
		
            </div>
            <hr>
        </c:forEach>  
    </c:otherwise>
</c:choose>  
 
</div>
 
</body>
<script> 

 
</script>
</html>