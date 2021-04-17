<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/simple-sidebar.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
		<div class="sidebar-heading">공예 </div>
		
		<div class="list-group list-group-flush">
			<a href="#" class="list-group-item list-group-item-action bg-light">도자기</a>
			<a href="#" class="list-group-item list-group-item-action bg-light">가죽</a>
			<a href="#" class="list-group-item list-group-item-action bg-light border-bottom">액세서리</a>
		</div>
	</div>

	<div id="page-content-wrapper">

		<nav class="navbar navbar-expand-lg navbar-light" style="margin: 2rem 2rem 2rem 2rem;">
			<select class="selectpicker" name="selected"> 
				<option selected="selected" value="new">최신순</option>
				<option value="hprice">높은 가격순</option>
				<option value="rprice">낮은 가격순</option>
				<option value="manyLike">찜이 많은순</option> 
			</select>
		</nav>
		
		<div class="bestlist">
			<div class="item" style="margin-left: 2rem;">
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
	</div>
</div>	

<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>