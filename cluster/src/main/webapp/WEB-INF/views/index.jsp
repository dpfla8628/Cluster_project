<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function(){
    $("#sort").on("change", function(){
		let queryParams = getUrlParams();
		
		if (queryParams.subcategory) {
            self.location = "/crafts?subcategory=" + queryParams.subcategory + "&sort=" + this.value;
            return;
        }
        self.location = "/crafts?sort=" + this.value;
	})

  function getUrlParams() {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
  }
    
    $(".detail").css("cursor","pointer").on("click", function(){
    	var classNo = $(this).attr("classNo");
    	
    	self.location = "/detail/" + classNo;
    	
    	/* alert(classNo + "값으로 페이지 이동 예정"); */
    	
    	/* to-do */
    	/* self.location = "/detail?classNo=" + classNo; */
    	
    })
    
    $(".heart").css("cursor","pointer").on("click", function(e){
    	var $thisObj = $(this);
    	var classNo = $thisObj.attr("classNo");
    	var isLiked = $thisObj.attr("isLiked");
    	
    	var method = '';
    	var updateLiked = '';
    	var updateSrc = '';
    	
    	if(isLiked == "true") {
    		method = "DELETE";
    		updateLiked = "false";
    		updateSrc = "resources/image/empty-heart.jpeg";
    	}
    	else {
    		method = "POST";
    		updateLiked = "true";
	    	updateSrc = "resources/image/full-heart.png";
    	}
    	
    	$.ajax({
			url: "/offclass/"+classNo+"/like",
			type: method,
			success: function (data) {
				$thisObj.attr("isLiked", updateLiked);
				$thisObj.attr("src", updateSrc);
				
			},
    		error: function (xhr) {
    			/* alert("실패!" + xhr.status); */
    			
    			if(xhr.status == 401) {
    				alert("로그인을 해주셔야 합니다.")
    				self.location= "/login/";
    				return;
    			}
    			alert("오류가 발생하였습니다.");
    		}
		})
    	
    })
	
})
</script>
<style>
	.bestlist{
		display: grid;
		grid-template-columns: repeat(4,1fr);
		grid-auto-rows: minmax(1em, auto);
		grid-gap: 1rem;
		justify-items: start;
		align-items: start;		
		padding: 10px 0 0 ;
		margin-left: 1.2rem;
	}
	.item{
		padding: 1rem;
		width: 210px;
	}
	.img{
		width: 200px;
		height: 200px;
	}
	.name-line{
    	float:left; 
    	font-size:0.7em; 
    	font-weight:600;
    	color: gray;
    	display: inline-block;
    	/* width:100px; */
    	/* margin-left: 0.5em; */
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
    }
    .title-line:hover{
    	text-decoration: underline;
    }
    .title-line{
    	font-size: 1em;
    	display: inline-block;
    	width:200px;
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
    	white-space: normal;
    	line-height: 1.5;
    	height: 3em;
    	word-wrap: break-word;
    	display: -webkit-box;
    	-webkit-line-clamp: 2;
    	-webkit-box-orient: vertical;
    }
	.heart{
		width: 30px;
		height: 30px;
		float: right;
	}
</style>
<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>
		<section>
		
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="#" style="font-weight: bold; font-size: large;">현재 진행 중 이벤트 &gt;</a>
					</div>
				</div>
			</div>
			
			<div id="carouselExampleIndicators" class="carousel slide top" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			    	<a href="#">
			      		<img class="d-block w-100" src="https://image.freepik.com/free-photo/soccer-ball-white-line-stadium_1150-5285.jpg" alt="First slide" width="100%" height="400px">
			      	</a>
			    </div>
			    <div class="carousel-item">
			   		<a href="#">
			      		<img class="d-block w-100" src="https://image.freepik.com/free-photo/female-hands-play-piano_169016-10608.jpg" alt="Second slide" width="100%" height="400px">
			    	</a>
			    </div>
			    <div class="carousel-item">
			   		<a href="#">
			      		<img class="d-block w-100" src="https://image.freepik.com/free-photo/computer-program-code_1385-530.jpg" alt="Third slide" width="100%" height="400px">
			      	</a>
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="/crafts" style="font-weight: bold; font-size: large;">공예 더보기 &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<c:forEach items="${craftClasses}" var="a">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img detail" classNo=${a.classNo} src="/mypage/displayFile?fileName=${a.thumbnailImage}" alt="${a.thumbnailImage}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line detail" classNo=${a.classNo} style="margin-top: 0.5rem">${a.memberNick}</span>
							</td>
							<td>
								<c:choose>
									<c:when test="${a.liked}">
										<img class="heart" classNo=${a.classNo} isLiked="true" 
											src="resources/image/full-heart.png">
									</c:when>
									
									<c:otherwise>
										<img class="heart" classNo=${a.classNo} isLiked="false" 
										src="resources/image/empty-heart.jpeg">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line detail" classNo=${a.classNo}>${a.className}</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line detail" classNo=${a.classNo}>${a.classPrice} 원</span>
							</td>					
						</tr>
					</table>
				</div>
				</c:forEach>
			</div>
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="/exercise" style="font-weight: bold; font-size: large;">운동 더보기 &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<c:forEach items="${exerciseClasses}" var="a">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img detail" classNo=${a.classNo} src="/mypage/displayFile?fileName=${a.thumbnailImage}" alt="${a.thumbnailImage}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line detail" classNo=${a.classNo} style="margin-top: 0.5rem">${a.memberNick}</span>
							</td>
							<td>
								<c:choose>
									<c:when test="${a.liked}">
										<img class="heart" classNo=${a.classNo} isLiked="true" 
											src="resources/image/full-heart.png">
									</c:when>
									
									<c:otherwise>
										<img class="heart" classNo=${a.classNo} isLiked="false" 
										src="resources/image/empty-heart.jpeg">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line detail" classNo=${a.classNo}>${a.className}</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line detail" classNo=${a.classNo}>${a.classPrice} 원</span>
							</td>					
						</tr>
					</table>
				</div>
				</c:forEach>
			</div>		
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="/drawing" style="font-weight: bold; font-size: large;">드로잉 더보기 &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<c:forEach items="${drowingClasses}" var="a">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img detail" classNo=${a.classNo} src="/mypage/displayFile?fileName=${a.thumbnailImage}" alt="${a.thumbnailImage}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line detail" classNo=${a.classNo} style="margin-top: 0.5rem">${a.memberNick}</span>
							</td>
							<td>
								<c:choose>
									<c:when test="${a.liked}">
										<img class="heart" classNo=${a.classNo} isLiked="true" 
											src="resources/image/full-heart.png">
									</c:when>
									
									<c:otherwise>
										<img class="heart" classNo=${a.classNo} isLiked="false" 
										src="resources/image/empty-heart.jpeg">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line detail" classNo=${a.classNo}>${a.className}</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line detail" classNo=${a.classNo}>${a.classPrice} 원</span>
							</td>					
						</tr>
					</table>
				</div>
				</c:forEach>
			</div>	
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="/music" style="font-weight: bold; font-size: large;">음악 더보기 &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<c:forEach items="${musicClasses}" var="a">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img detail" classNo=${a.classNo} src="/mypage/displayFile?fileName=${a.thumbnailImage}" alt="${a.thumbnailImage}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line detail" classNo=${a.classNo} style="margin-top: 0.5rem">${a.memberNick}</span>
							</td>
							<td>
								<c:choose>
									<c:when test="${a.liked}">
										<img class="heart" classNo=${a.classNo} isLiked="true" 
											src="resources/image/full-heart.png">
									</c:when>
									
									<c:otherwise>
										<img class="heart" classNo=${a.classNo} isLiked="false" 
										src="resources/image/empty-heart.jpeg">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line detail" classNo=${a.classNo}>${a.className}</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line detail" classNo=${a.classNo}>${a.classPrice} 원</span>
							</td>					
						</tr>
					</table>
				</div>
				</c:forEach>
			</div>	
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="/cooking" style="font-weight: bold; font-size: large;">요리 더보기 &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<c:forEach items="${cookingClasses}" var="a">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img detail" classNo=${a.classNo} src="/mypage/displayFile?fileName=${a.thumbnailImage}" alt="${a.thumbnailImage}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line detail" classNo=${a.classNo} style="margin-top: 0.5rem">${a.memberNick}</span>
							</td>
							<td>
								<c:choose>
									<c:when test="${a.liked}">
										<img class="heart" classNo=${a.classNo} isLiked="true" 
											src="resources/image/full-heart.png">
									</c:when>
									
									<c:otherwise>
										<img class="heart" classNo=${a.classNo} isLiked="false" 
										src="resources/image/empty-heart.jpeg">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line detail" classNo=${a.classNo}>${a.className}</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line detail" classNo=${a.classNo}>${a.classPrice} 원</span>
							</td>					
						</tr>
					</table>
				</div>
				</c:forEach>
			</div>	
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="/study" style="font-weight: bold; font-size: large;">스터디 더보기 &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<c:forEach items="${sutudyClasses}" var="a">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img detail" classNo=${a.classNo} src="/mypage/displayFile?fileName=${a.thumbnailImage}" alt="${a.thumbnailImage}">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line detail" classNo=${a.classNo} style="margin-top: 0.5rem">${a.memberNick}</span>
							</td>
							<td>
								<c:choose>
									<c:when test="${a.liked}">
										<img class="heart" classNo=${a.classNo} isLiked="true" 
											src="resources/image/full-heart.png">
									</c:when>
									
									<c:otherwise>
										<img class="heart" classNo=${a.classNo} isLiked="false" 
										src="resources/image/empty-heart.jpeg">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line detail" classNo=${a.classNo}>${a.className}</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line detail" classNo=${a.classNo}>${a.classPrice} 원</span>
							</td>					
						</tr>
					</table>
				</div>
				</c:forEach>
			</div>	
				
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>