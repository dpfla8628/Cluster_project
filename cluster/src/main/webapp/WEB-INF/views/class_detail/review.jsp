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
<link rel="stylesheet" type="text/css" href="/css/class.css">
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
    	 	//엔터쳤을 때 submit 방지
    	 	$("input[type=text], input[type=text], button").keydown(function(){
    	 	    if(event.keyCode === 13)
    	 	        event.preventDefault();
    	 	});
    	 	
    	 	$('.returnBtn').click(function(){
    	 		close();
    	 	})
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
 
 			  
 		 .reviewA{
             width: 600px;
             height : auto;
             padding-left: 5px;
 			 resize: none;
  			 margin-top: 5px;
  			 border : none;
  			 margin-left : 20px;
  			 overflow: hidden;
  			 
 			  }
 			  .reviewA2{
 			   width: 600px;
             height: 100px;
             padding-left: 5px;
 			 resize: none;
  			 margin-top: 5px;
   			 overflow: hidden;
 			  }

         .reviewInsertBtn, .reviewInsertBtn2 {
             width: 65px;
             height: 25px;
              background-color: transparent;
			float : right;
             font-weight: 300;
              border : 0.1px solid gray;
           }
 
         .reviewInsertBtn:hover {
             font-weight: 400;
             background-color: #ffc107;
             color: aliceblue;
          }
         .box {
             width: 600px;
             height: 120px;
              
         }
		.logImg{
 	 	margin: 15px 0 20px 0;
		}
     .returnBtn{
     	border : none;
     	background-color: transparent;
     	font-weight: 300;
     }
     .returnBtn:hover{
     	font-weight: 500;
     }
     
     
    </style>
</head>
<body>
 <c:set var="logInMember" value="${member.memberNick}"/>
<c:set var="classMember" value="${offClass.authMember.memberNick}"/>

<div class="reviewList">
  
        <div class="box">    
        <button class="returnBtn"> &lt; 돌아가기 </button>          
			<div class="logImg">
				<a href="/"><img src="/image/cluster.jpg" width="200"alt="logo"></a>
	 		</div>
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
               		<img class="reviewImg" src="/displayFile?fileName=${fn:substringAfter(fullname,'=')}">
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
                <!-- 답변 있을 때 또는 답변 수정 눌렀을 때 -->
                    <c:if test="${not empty review.reviewOk}">
                    <img src="/image/review.png" width="20px">
 						<label class="reviewOkNick">크리에이터</label> 
 					<div class="reviewForm${review.reviewNo}" >
	                    <form:form modelAttribute="review" action="${review.classNo}" method="post" id="updateForm"> 
	                    <input type="submit" class="reviewInsertBtn" id="reviewInsertBtn${review.reviewNo}" value="등록">
	                        <input type="hidden" name="reviewNo" id="reviewNo${review.reviewNo}" value="${review.reviewNo}">
	                         <textarea name="reviewOk" id="reviewA${review.reviewNo}"class="reviewA">${review.reviewOk}</textarea>
	                    </form:form>
                	</div>
                     </c:if>
                </div>
                <!-- 답변 새로 등록할 때 -->
               <c:if test="${empty review.reviewOk}">
                	<c:if test="${logInMember eq classMember}"> 
                <div class="reviewForm">
                    <form action="/class_detail/review/${review.classNo}" method="post" id="insertForm" >
                    <input type="submit" class="reviewInsertBtn2" value="등록"> 
                        <input type="hidden" id ="reviewNo${review.reviewNo}" name="reviewNo" value="${review.reviewNo}">
                          <textarea name="reviewOk" class="reviewA2"></textarea>
                        
                    </form>
                </div>
                
                	</c:if>
                </c:if>

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
					  
					  $('.reviewInsertBtn').hide();
					 
					  $('.reviewA').attr("readonly", true);
					  var txtArea = $("#reviewA${review.reviewNo}");
			            if (txtArea) {
			                txtArea.each(function() {
			                    $(this).height(this.scrollHeight);
			                });
			            }
			            
		               /*  $("#updateForm").hide();
		                $(".reviewForm${review.reviewNo}").hide(); */

		                $("#reviewEdit${review.reviewNo}").on("click", function() {
 		                     $(".reviewForm${review.reviewNo}").show();
		                     $('#reviewInsertBtn${review.reviewNo}').show();
		                   /* $(".reviewOk${review.reviewNo}").hide(); */
 		                    $('#reviewA${review.reviewNo}').attr("readonly", false);
		                    $('#reviewA${review.reviewNo}').css("border","1px solid gray")
		                    $('#reviewA${review.reviewNo}').css("height","100px")
		                    $('#reviewA${review.reviewNo}').css("overflow","auto")
		                    $('#reviewA${review.reviewNo}').css("margin-left","0")
		                
  		                });  
					});
                

            	
            	
                </script>
		
            </div>
            <hr>
        </c:forEach>  
   
</div>
 
</body>
<script> 

 
</script>
</html>