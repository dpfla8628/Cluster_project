<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	img{
		width: 200px;
		height: 200px;
	}
	.name-line{
    	float:left; 
    	font-size:0.7em; 
    	font-weight:600;
    	color: gray;
    	display: inline-block;
    	width:100px;
    	margin-left: 0.5em;
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
    }
    /* .title-line:hover{
    	text-decoration: underline;
    } */
    .content-line{
    	font-size: 0.9em;
    	display: inline-block;
    	width:280px;
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
	.heart {
    	width: 15px;
	    height: 15px;
	    background: white/* #ea2027 */;
	    position: relative;
	    transform: rotate(45deg);
	    border: 1px solid gray;
	  }
	.heart::before,
	.heart::after {
	    content: "";
	    width: 15px;
	    height: 15px;
	    position: absolute;
	    border-radius: 50%;
	    background: white/* #ea2027 */;
	    border: 1px solid gray;
	  }
	.heart::before {
	    left: -50%;
	  }
	.heart::after {
	    top: -50%;
	  }
</style>
<jsp:include page="/WEB-INF/views/maintemplate/header.jsp"></jsp:include>
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
						<a href="#" style="font-weight: bold; font-size: large;">공예 BEST &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				
				<!-- for문 써야함 -->
				<div class="item">
			  		<a href="#">
						<img src="https://image.freepik.com/free-vector/leather-texture-realistic-samples-set_1284-23446.jpg">
						<span class="heart" style="float: right"></span>
						<span class="name-line">크리에이터 이름</span>
						<br><br>
						<span class="title-line">클래스 제목</span>
						<br>
						<span class="price-line">클래스 가격</span>
					</a>
				</div>
				
				<div class="item">
			  		<a href="#">
						<img src="https://image.freepik.com/free-vector/leather-texture-realistic-samples-set_1284-23446.jpg">
						<span class="name-line">크리에이터 이름</span>
						<span class="heart" style="float:right margin-top:1em"></span>
						<br><br>
						<span class="title-line">클래스 제목</span>
						<br>
						<span class="price-line">클래스 가격</span>
					</a>
				</div>
				
			</div>
		

<jsp:include page="/WEB-INF/views/maintemplate/footer.jsp"></jsp:include>		
