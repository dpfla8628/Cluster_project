<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/maintemplate/header.jsp"></c:import>

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
		width: 17.5rem;
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
	.btn-gap{
		margin-right: 0.2rem;
		margin-top: 1rem;
	}
	
	.ableClick:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.imgOpacity{
		opacity: 0.5;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		$(".addBtn").click(function(){
			location.href="${ContextPath}/event/write";
		});
		
		$(".updateBtn").click(function(){
			location.href="${ContextPath}/admin/event/eventList";
		});
		
		
		//ajax설정
		$(".ongoing").click(function(){
			$(this).removeClass("ableClick");
			$(this).parent().addClass("active");
			$(".finished").addClass("ableClick");
			$(".finished").parent().removeClass("active");
			
			var formData = new FormData();
			formData.append("type", "ongoing");
			formData.append("start", 1);
			formData.append("end", 12);
			
			$.ajax({
				url:"${ContextPath}/event/getList",
				type:"post",
				data: formData,
				processData: false,
				contentType: false,
				success: function (data, status) {
					
					$(".listBox").children().remove();
					
					console.log(data);
					
					var str = "";
					$.each(data, function(idx, event){
						str = "<div class='card'><a href='${ContextPath}/event/detail?no=";
						str += event.eventNo;
						str += "'><img width='286' height='180' class='card-img-top' src='${ContextPath}/event/displayFile?fileName=";
						str += event.eventFileName;
						str += "' alt='Card image cap'></a><div class='card-body'><h6 class='card-title'>";
						str += event.eventTitle;
						str += "</h6><p class='card-text'>";
						str += event.eventStart + "~" + event.eventEnd;
						str += "</p></div></div>";
						
						$(".listBox").append(str);
					});
					
				}
				
			});
		});
		
		$(document).on("click", ".finished", function(){
			$(this).removeClass("ableClick");
			$(this).parent().addClass("active");
			$(".ongoing").addClass("ableClick");
			$(".ongoing").parent().removeClass("active");
			
			var formData = new FormData();
			formData.append("type", "finished");
			formData.append("start", 1);
			formData.append("end", 12);
			
			$.ajax({
				url:"${ContextPath}/event/getList",
				type:"post",
				data: formData,
				processData: false,
				contentType: false,
				success: function (data, status) {
					
					$(".listBox").children().remove();
					
					console.log(data);
					
					var str = "";
					$.each(data, function(idx, event){
						str = "<div class='card'><a href='${ContextPath}/event/detail?no=";
						str += event.eventNo;
						str += "'><img width='286' height='180' class='card-img-top imgOpacity' src='${ContextPath}/event/displayFile?fileName=";
						str += event.eventFileName;
						str += "' alt='Card image cap'></a><div class='card-body'><h6 class='card-title'>";
						str += event.eventTitle;
						str += "</h6><p class='card-text'>";
						str += event.eventStart + "~" + event.eventEnd;
						str += "</p></div></div>";
						
						$(".listBox").append(str);
					});
					
				}
				
			});
			
		});
		
	});			
</script>

	<c:set var="e" value="${event}" scope="page"/>

	<section class="container event-body">
		<article class="row"><h3>이벤트</h3></article>
		
		<!-- 목록 필터 및 이벤트 관리 버튼-->
		<article class="row">
			<nav aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active"><span class="ongoing">진행중인 이벤트</span></li>
			    <li class="breadcrumb-item" ><span class="finished ableClick">종료된 이벤트</span></li>
			  </ol>
			</nav>
			<c:if test="${!(empty member) && (member.memberAuth == '관리자')}">
				<div class="col text-right">
					<button type="button" class="btn btn-secondary btn-sm btn-gap updateBtn">이벤트 관리</button>
					<button type="button" class="btn btn-secondary btn-sm btn-gap addBtn">이벤트 추가</button>
				</div>
			</c:if>
		</article>
		
		<!-- 본문 -->
		<article class="row listBox">
			<c:forEach var="e" items="${e}" >
				<div class="card">
					<a href="${ContextPath}/event/detail?no=${e.eventNo}">
					  	<img width="286" height="180" class="card-img-top" src="${ContextPath}/event/displayFile?fileName=${e.eventFileName}" alt="Card image cap">
					</a>
				  	<div class="card-body">
				    	<h6 class="card-title">${e.eventTitle}</h6>
				    	<p class="card-text">${e.eventStart}~${e.eventEnd }</p>
				  	</div>
				</div>
			</c:forEach>
		</article>

		<!-- 페이징 -->
		<!-- <article class="row justify-content-center">
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
		</article> -->
	</section>
	
<c:import url="/WEB-INF/views/maintemplate/footer.jsp"></c:import>