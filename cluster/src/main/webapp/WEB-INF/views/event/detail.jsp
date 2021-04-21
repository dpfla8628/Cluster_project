<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
		
</script>
<style>
	.container{
		padding: 0;
	}
	.event-body{
		min-height: 800px;
	}
	.breadcrumb{
		margin-top: 1rem;
	}
	.card{
		margin: 0.3rem;
		width: 17rem;
		border: none;
	}
	.card:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.pagination{
		margin: 0.5rem 0;
	}
	.card-body{
		padding: 0.5rem;
	}
	.card-title{
		margin-bottom: 0.2rem;
	}
	.card-text{
		font-size: 0.9rem;
	}
	.page-link{
		color: #ffc107;
	}
	.page-link:hover{
		color: #ffc107;
	}
	.page-item.active .page-link{
		background-color: #ffc107;
		border-color: #ffc107;
	}
</style>


	<section class="container event-body">
		<article class="row"><h3>이벤트</h3></article>
		<!-- 필터 -->
		<article class="row">
			<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">진행중인 이벤트</a></li>
			    <li class="breadcrumb-item active" aria-current="page">종료된 이벤트</li>
			  </ol>
			</nav>
		</article>
		
		<!-- 본문 -->
		<article class="row">
			<div class="card">
			  <img class="card-img-top" src="https://placeimg.com/286/180/tech" alt="Card image cap">
			  <div class="card-body">
			    <h6 class="card-title">이벤트 제목</h6>
			    <p class="card-text">진행기간</p>
			  </div>
			</div>
			<div class="card">
			  <img class="card-img-top" src="https://placeimg.com/286/180/tech" alt="Card image cap">
			  <div class="card-body">
			    <h6 class="card-title">이벤트 제목</h6>
			    <p class="card-text">진행기간</p>
			  </div>
			</div>
			<div class="card">
			  <img class="card-img-top" src="https://placeimg.com/286/180/tech" alt="Card image cap">
			  <div class="card-body">
			    <h6 class="card-title">이벤트 제목</h6>
			    <p class="card-text">진행기간</p>
			  </div>
			</div>
			<div class="card">
			  <img class="card-img-top" src="https://placeimg.com/286/180/tech" alt="Card image cap">
			  <div class="card-body">
			    <h6 class="card-title">이벤트 제목</h6>
			    <p class="card-text">진행기간</p>
			  </div>
			</div>
			<div class="card">
			  <img class="card-img-top" src="https://placeimg.com/286/180/tech" alt="Card image cap">
			  <div class="card-body">
			    <h6 class="card-title">이벤트 제목</h6>
			    <p class="card-text">진행기간</p>
			  </div>
			</div>
		</article>

		<!-- 페이징 -->
		<article class="row justify-content-center">
			<nav aria-label="Page navigation example">
			  <ul class="pagination ">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    <li class="page-item active"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</article>
	</section>
	
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>