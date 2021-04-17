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
						<a href="#" style="font-weight: bold; font-size: large;">공예 BEST &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img" src="https://image.freepik.com/free-vector/leather-texture-realistic-samples-set_1284-23446.jpg">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line" style="margin-top: 0.5rem">가죽공예장인</span>
							</td>
							<td>
								<img class="heart" src="resources/image/empty-heart.jpeg">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line">가죽으로 지갑 만들기</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line">300000원</span>
							</td>					
						</tr>
					</table>
				</div>
			</div>
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="#" style="font-weight: bold; font-size: large;">운동 BEST &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img  class="img" src="https://image.freepik.com/free-vector/soccer-stadium_1284-22432.jpg">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line" style="margin-top: 0.5rem">국대출신공격수</span>
							</td>
							<td>
								<img class="heart" src="resources/image/empty-heart.jpeg">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line">축구, 기초부터간다!</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line">200000원</span>
							</td>					
						</tr>
					</table>
				</div>
			</div>		
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="#" style="font-weight: bold; font-size: large;">드로잉 BEST &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img" src="https://as2.ftcdn.net/jpg/03/92/37/13/500_F_392371350_p2fyOpv18fvjLlsFpnaJnCPGZe2Bb0HH.jpg">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line" style="margin-top: 0.5rem">한국의 멋</span>
							</td>
							<td>
								<img class="heart" src="resources/image/empty-heart.jpeg">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line">한국화의 아름다움</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line">250000원</span>
							</td>					
						</tr>
					</table>
				</div>
			</div>	
			
			<div class="container top">
				<div class="row">
					<div class="col">
						<a href="#" style="font-weight: bold; font-size: large;">음악 BEST &gt;</a>
					</div>
				</div>
			</div>
			
			<div class="bestlist" style="padding-left: 5rem">
				<div class="item">
					<table>
						<tr>
							<td colspan="2">
								<img class="img" src="https://image.freepik.com/free-psd/music-festival-banner-template_23-2148911140.jpg">
							</td>
						</tr>
						<tr>
							<td>
								<span class="name-line" style="margin-top: 0.5rem">용감한자매들</span>
							</td>
							<td>
								<img class="heart" src="resources/image/empty-heart.jpeg">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="title-line">brave sound?</span>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<span class="price-line">400000원</span>
							</td>					
						</tr>
					</table>
				</div>
			</div>	
				
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>