<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function(){
	    $("#sort").on("change", function(){
			let queryParams = getUrlParams();
			
			if (queryParams.subcategory) {
                self.location = "/music?subcategory=" + queryParams.subcategory + "&sort=" + this.value;
                return;
            }
            self.location = "/music?sort=" + this.value;
		})

      function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
        return params;
      }
	    
	    $(".detail").css("cursor","pointer").on("click", function(){
	    	alert($(this).attr("classNo") + "값으로 페이지 이동 예정");
	    	
	    	/* to-do
	    	self.location = "/music?classNo=" + ${classNo}.value; */ 
	    	
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
	main, header, nav, section, 
	aside, article, footer, div,
	label, span, p, a, button, option {
		font-family: '나눔고딕', 'Malgun Gothic', sans-serif;
	}
	.bestlist{
		display: grid;
		grid-template-columns: repeat(4,1fr);
		grid-auto-rows: minmax(1em, auto);
		grid-gap: 1rem;
		justify-items: start;
		align-items: start;		
		padding: 10px 0 0 ;
		margin-left: 1rem;
		text-align: center;
	}
	.item{
		/* padding: 1rem; */
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

<div class="d-flex" id="wrapper">

	<div class="border-right" id="sidebar-wrapper">
		<div class="sidebar-heading">음악</div>
		
		<div class="list-group list-group-flush">
			<a href="/music?subcategory=한국화" class="list-group-item list-group-item-action bg-light">실용음악</a>
			<a href="/music?subcategory=서양화" class="list-group-item list-group-item-action bg-light">피아노</a>
			<a href="/music?subcategory=유화" class="list-group-item list-group-item-action bg-light border-bottom">바이올린</a>
		</div>
	</div>

	<div id="page-content-wrapper">

		<nav class="navbar navbar-expand-lg navbar-light" style="margin: 2rem 2rem 2rem 2rem;">
			<select class="selectpicker" name="selected" id="sort"> 
				<option value="new"
                    <c:if test="${sort eq 'new'}">selected="selected"</c:if>>최신순</option>
                <option value="hprice"
                    <c:if test="${sort eq 'hprice'}">selected="selected"</c:if>>높은 가격순</option>
                <option value="rprice"
                    <c:if test="${sort eq 'rprice'}">selected="selected"</c:if>>낮은 가격순</option>
			</select>
		</nav>
		
		<div class="bestlist">
		<c:forEach items="${offclasses}" var="a">
		
			<div class="item" style="margin-left: 2rem;">
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
		
	</div>
</div>	

<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>