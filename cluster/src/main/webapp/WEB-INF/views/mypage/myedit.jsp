<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/mypage/template/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/mypage/template/sidebar.jsp"></jsp:include>
<style>
	label{
	color: orange;
    font-weight: bold;
    }
</style>
<script>
 	$(document).ready(function () {
 		
		$(".uploadedList").on("click", "span", function () {
			$(this).parent("div").remove();
		})
		
		// 정규 표현식으로 *.jpg, *.gif, *.png, *.jpeg 파일중 하나 검출
		function checkImageType (fileName) {
			var pattern = /jpg|gif|png|jpeg/i
			
			return fileName.match(pattern)
		}
		
		function getOriginalName (fileName) {
			if (checkImageType (fileName)) {
				return;
			}
			
			var idx = fileName.indexOf("_") + 1;
			
			return fileName.substr(idx);
		}
		
		function getThumbnailName (fileName) {
			var front = fileName.substr(0, 12)
			var end = fileName.substr(12)
			
			console.log("front: " + front)
			console.log("end: " + end)
			
			return front + "s_" + end
		}
		
		// 사진 추가 및 수정에 대한 고려가 필요
		var memberNo = ${mymember.memberNo}
		
		$.getJSON("/mypage/getAttach/" + memberNo, function (list) {
			$(list).each(function () {
				var data = this
				
				var str = ""
				
				if (checkImageType(data)) {
					str = "<div><a href='/mypage/displayFile?fileName=" + 
							data + "'>" +
							"<img src='/mypage/displayFile?fileName=" + 
							getThumbnailName(data) + "'/>" +
							"</a></div>"
				} else {
					str = "<div><a href='/mypage/displayFile?fileName=" + 
							data + "'>" + getOriginalName(data) +
							"</a></div>"
				}
				
				$(".uploadedList").append(str)
			})
		})
		
		$("#mymember").submit(function(event) {
			
			
			event.preventDefault()
			
			var that = $(this)
			
			var str = ""
			
			$(".uploadedList a").each(function(idx) {
				var value = $(this).attr("href")
				
				console.log('value: ' + value)
				
				value = value.substr(27);
				
				console.log('value: ' + value)
				
				str += "<input type='hidden' name='files[" + idx + 
					"]' value = '" + value + "'>";
			})
			
			console.log("str: " + str)
			
			that.append(str)
			
			that.get(0).submit()
			
		})
		
		$("#inputFile").on("change", function(event) {
		
			console.log("change")
			
			var files = event.target.files
			var file = files[0]
			
			console.log(file)
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: "/mypage/uploadAjax",
				data: formData,
				dataType: "text",
				processData: false,
				contentType: false,
				type: "POST",
				success: function (data) {
					console.log(data)
					
					var str = ""
					
					if (checkImageType(data)) {
						str = "<div><a href='/mypage/displayFile?fileName=" + 
								data + "'>" + 
								"<img src='/mypage/displayFile?fileName=" +
								getThumbnailName(data) + "'>" +
								"</a></div>"
					} else {
						str = "<div><a href='/mypage/displayFile?fileName=" +
								data + "'>" + 
								"</a></div>"
					}
					
					$(".uploadedList").append(str);
				}
			})
		})
	}) 
</script>
<div class="grid">
  <p class="grid-header">내 정보 수정</p>
  <div class="grid-body">
    <div class="item-wrapper">
     <label>프로필 사진</label>
     <p>(프로필 사진이 없을 경우에 수정이 제대로 되지 않을 수 있습니다)</p>
 	<form action="/mypage/mydelete" method="post">
 		<input hidden="hidden" name="memberNo" value="${mymember.memberNo }">
 		<input type="submit" value="프로필 삭제하기">
 	</form>
      <form:form modelAttribute="mymember" action="/mypage/myedit" method="post" enctype="multipart/form-data">
		<form:hidden path="memberNo"/>
		<div class="form-group">
          	<input type="file" id="inputFile">
			<div class="uploadedList"></div>
        </div>
        <div class="form-group">
          <label for="memberId">아이디</label>
          <form:input path="memberId" class="form-control" readonly="true"/>
        </div>
        <div class="form-group">
          <label for="memberNick">닉네임</label>
           <form:input path="memberNick" class="form-control"/>
        </div>
        <div class="form-group">
          <label for="memberPhone">휴대폰번호</label>
           <form:input path="memberPhone" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
      </form:form>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/mypage/template/footer.jsp"></jsp:include>