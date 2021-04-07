<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 설정 페이지</title>
<link type="text/css" rel="stylesheet" href='<c:url value="/css/creatorstyle.css"/>'>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("#offclass")
		
		$("btnRegister").on("click", function(){
			formObj.attr("action", "/creator/registerForm")
			formObj.attr("method", "post")
			formObj.submit();
		})
		
		$("btnList").on("click", function(){
			self.location = "/creator/register"
		})
		
		$(".uploadedList").on("click", "span", function(){
			$(this).parent("div").remove();
		})
		
		// 정규 표현식으로 *.jpg, *.gif, *.png, *.jpeg 파일 중 하나 검출
		function checkImageType(fileName){
			var pattern = /jpg|gif|png|jpeg/i
			return fileName.match(pattern)
		}
		
		// 파일 이름 처리: UUID 가짜 이름 제거
		function getOriginalName(fimeName){
			if(checkImageType(fileName)){
				return;
			}
			var idx = fileName.indexOf("_")+1;
			return fileName.substr(idx);
		}
			
		// 썸네일 이름 설정
		function getThumbnailName(fileName){
			var front = fileName.substr(0, 12)
			var end = fileName.substr(12)
			
			console.log("front: "+ front +", end: " + end)
						
			return front + "s_" + end
		}	
		
		$("#offclass").submit(function(event){
			event.preventDefault()
			
			var that = $(this)
			var str = ""
			
				$(".uploadedList a").each(function(idx){
					var value = $(this).attr("href")				
					value = value.substr(27);				
					str += "<input type='hidden' name='files["+idx+"]' value= '"+value+"'>";	
				})
			
			console.log("str = "+str)
			that.append(str)
			that.get(0).submit();
		})	
			
		$("#inputFile").on("change", function(event){
			console.log("change")
			
			var files = event.target.files
			var file = files[0]
			console.log(file)
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: "/creator/uploadAjax",
				data: formData,
				dataType: "text",
				processData: false,
				contentType: false,
				type: "POST",
				success: function (data) {
					console.log(data)
					
					var str = ""
					
					if(checkImageType(data)){
						str = "<div><a href='/creator/displayFile?fileName="+data+"'>"
								+"<img src='/creator/displayFile?fileName="+getThumbnailName(data)+"'>"
								+"</a><span>x</span></div>"
					}else{
						str = "<div><a href='/creator/displayFile?fileName="+data+"'>"
								+ "</a><span>x</span></div>"
					}
						
					$(".uploadedList").append(str);	
						
				}
			})
			
		})
			
	})
</script>
<body>
	<form:form modelAttribute="offclass" action="registerForm" enctype="multipart/form-data">
        <fieldset class="outbox">
           <legend>강의 설정</legend>
            <fieldset class="outbox">
               <legend>기본 정보 입력</legend>
               	<input type="hidden" name="creatorNo" value="${creator.creatorNo}"/>
                <div class="row">
                    <label>강의 명</label>
                    <form:input class="input" path="className"/>
                </div>
                <div class="row">
                    <label>카테고리</label>
                   	<form:select class="select" path="categoryNo">
                    	<option value="">---선택해 주세요---</option>
                        <form:options items="${categoryList}" itemValue="categoryNo" itemLabel="categorySmall"/>
                    </form:select>
                </div>
                <div class="row">
                    <label>시작일</label>
                    <form:input type="date" path="classStart"/>
                    
                    <label>종료일</label>
                    <form:input type="date" path="classEnd"/>
                </div>
                <div class="row">
                    <label>인원 제한</label>
                    <form:input class="input" type="text" path="classMemberSet"/>
                </div>
                <div class="row">
                    <label>모임 장소</label>
                   	<form:input class="inline-input" type="text" id="class_address" path="classPlace" placeholder="주소"/>
					<input type="button" onclick="class_execDaumPostcode()" value="주소 검색"><br>
					<div id="map" style="width:500px;height:500px;margin-top:10px;display:none"></div>
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5c4dad7c6553846d2eaceec72a34cf6&libraries=services"></script>
					<script>
					    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					        mapOption = {
					            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					            level: 5 // 지도의 확대 레벨
					        };
					
					    //지도를 미리 생성
					    var map = new daum.maps.Map(mapContainer, mapOption);
					    //주소-좌표 변환 객체를 생성
					    var geocoder = new daum.maps.services.Geocoder();
					    //마커를 미리 생성
					    var marker = new daum.maps.Marker({
					        position: new daum.maps.LatLng(37.537187, 127.005476),
					        map: map
					    });
					
					
					    function class_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                var addr = data.address; // 최종 주소 변수
					
					                // 주소 정보를 해당 필드에 넣는다.
					                document.getElementById("class_address").value = addr;
					                // 주소로 상세 정보를 검색
					                geocoder.addressSearch(data.address, function(results, status) {
					                    // 정상적으로 검색이 완료됐으면
					                    if (status === daum.maps.services.Status.OK) {
					
					                        var result = results[0]; //첫번째 결과의 값을 활용
					
					                        // 해당 주소에 대한 좌표를 받아서
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        // 지도를 보여준다.
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        // 지도 중심을 변경한다.
					                        map.setCenter(coords);
					                        // 마커를 결과값으로 받은 위치로 옮긴다.
					                        marker.setPosition(coords)
					                    }
					                });
					            }
					        }).open();
					    }
					</script>
                </div>
            </fieldset>
            <fieldset class="outbox">
                <legend>강의 상세 정보</legend>
                <div class="row">
                    <label>강의 설명</label>
                    <form:textarea class="input" path="classInfo"></form:textarea>
                </div>               
                <div class="row">
                    <label>강의 설명 사진</label>
                    <input type="file" id="inputFile"/>
                    <div class="uploadedList"></div>
                </div>        
                <div class="row">
                    <label>강의 가격</label>
                    <form:input class="input" type="text" path="classPrice"/>
                </div>
                <div class="row">
                    <label>강의 연락처</label>
                    <form:input class="input" type="text" path="classTalk"/>
                </div>        
            </fieldset>
        </fieldset>
        <div>
	      <button type="submit" id="btnRegister">검수 신청</button>
	      <button type="submit" id="btnList">취소 하기</button>     
    	</div>
    </form:form>
</body>
</html>