<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<script>

	$(function(){
		
		
		$(".uploadedList").on("click", "span", function () {
			$(this).parent("div").remove();
		})
		
		//정규 표현식으로 *.jpg, *.gif, *.png, *.jpeg 파일중 하나 검출
		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i
			
			return fileName.match(pattern);
		}
		
		function getOriginalName(fileName) {
			if (checkImageType(fileName)) {
				return;
			}
			
			var idx = fileName.indexOf("_") + 1;
			
			return fileName.substr(idx);
		}
		
		
		function getThumbnailName(fileName) {
			var front = fileName.substr(0, 12)
			var end = fileName.substr(12);
			
			console.log("front: " + front)
			console.log("end: " + end)
			
			return front + "s_" + end;
		}
		
		//input[type=file]에 변화가 있을시
		$("#inputFile").change(function(e){
			console.log("change");
			
			var files = e.target.files;
			var file = files[0];
			
			console.log(file);
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: "/admin/uploadEventImage",
				data: formData,
				dataType: "text",
				processData: false,
				contentType: false,
				type: "POST",
				success: function(data) {
					console.log(data)
					
					var str = "";
					
					if(checkImageType(data)) {
						str = "<div><a href='/admin/displayFile?fileName=" +
								data + "'>" +
								"<img src = '/admin/displayFile?fileName=" +
								getThumbnailName(data) + "'>" +
								"</a><span>취소</span></div>"
					}
					else {
						str = "<div><a href='/admin/displayFile?fileName=" +
								data + "'>" +
								"</a><span>취소</span></div>"
					}
					
					$(".uploadedList").append(str);
					
				}
				
			});
			
		});
		
		
});

</script>

<div class="outbox">

	<h2>이벤트 등록</h2>
	
	이벤트 사진1
	
	<form action="" method="" enctype="multipart/form-data">
		<input type="file" id="inputFile">
		<div class="uploadedList"></div>
	</form>
	
	
	


</div>



<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>