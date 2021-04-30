<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLUSTER ADMIN</title>
<link rel="stylesheet" type="text/css" href="/css/sw.css">
<style>
	body{
		background-color:#E2E2E2;
		font-family: Metropolis,-apple-system,BlinkMacSystemFont,Segoe UI,
		Roboto,Helvetica Neue,Arial,sans-serif,Apple Color Emoji,
		Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;
	}
	main {
		width:100%;
		/*height:auto;*/
		margin:auto;
	}
	
	header {
		height:120px;
		position:fixed;
		width:100%;
		background-color: #343a40;
	}
	section {
		height: calc(100% - 120px);
		content: "";
		display: block;
		clear: both;
	}
	aside {
		width:14%;
		float:left;
		height:calc(100% - 120px);
		background-color:#212529;
		position:fixed;
		bottom:0;
	}
	article {
		width:86%;
		float:right;
		height:calc(100% - 120px);
		padding-top:120px;
		background-color:#E2E2E2;
	}
	.sideMenu li{
		font-size:20px;
	}
	.sideMenu > li {
		padding:1rem 0;
	}
	.sideMenu, 
	.sideMenu ul {
		margin:0;
		padding:0;
		list-style:none;
	}
	.sideMenu{
		padding:1.5rem;
		padding-left: 3.5rem;
	}
	.sideMenu a, .sideMenu label {
		color:rgba(255, 255, 255, 0.5);
		text-decoration:none;
	}
	.sideMenu a:hover, .sideMenu label:hover, 
	.sideMenu a:active, .sideMenu label:active{
		color:#fff;
	}
	.sideMenu ul {
		margin-left:0.3rem;
		margin-top:0.5rem;
		display:none;
	}	
	.sideMenu ul > li {
		padding:0.2rem;
	}
	.sideMenu label {
		cursor:pointer;
	}
	.title{
		padding-left: 20rem;
		position:absolute;
		top:50%;
		transform:translate(-50%, -50%);
		
	}
	
	#logo{
		margin-bottom:0.3rem;
	}
	#logo a{
		font-size:35px;
		color: #ffc107!important;
		font-weight: 700!important;
		font-family: -apple-system,BlinkMacSystemFont,
		"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",
		sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol",
		"Noto Color Emoji";
		text-decoration:none;
	}
	.sideBarLine{
		border-top: 1px solid rgba(255,255,255,.15);
	}
	.exit a{
		color:#fff;
    	font-size: 1.2rem;
	}
	.exit{
		margin:2rem 2rem 0 0;
	}
	.outbox{
		margin: 2rem 0 2rem 0;
	}
	
</style>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function(){
		$(".sideMenu").find("label").click(function(){
			
			$(this).next("ul").slideToggle();
		})
		
	});
		
</script> 

</head>
<body>
	<main>
		<header>
				<div class="exit right">
					<a href="/">나가기</a>		
				</div>
				<div class="title">
					<div id="logo">
						<a href="/admin/home">CLUSTER</a>
					</div>
					<!-- 닉네임 얻기 위해 LoginController에 session.setAttribute("memberNick", member.getMemberNick());
					추가해달라고 말하기
					 -->
					<div style="color:#fff;">admin님 안녕하세요 :)</div>
					<div style="color:#fff;">CLUSTER 관리자 페이지입니다.</div>
				</div>
		</header>
		
		<section>
			<aside>
					<ul class="sideMenu">
						<li>
							<a id="home" href="/admin/home">Dashboard</a>
						</li>
						<hr class="sideBarLine">
						<li>
							<label id="creatorMenu">크리에이터 관리</label>
							<ul>
								<li><a id="creatorList" href="/admin/creator/creatorList">크리에이터 명단</a></li>
								<li><a id="income" href="/admin/creator/income">크리에이터 정산</a></li>
							</ul>
						</li>
						<hr class="sideBarLine">
						<li>
							<label id="classMenu">클래스 관리</label>
							<ul>
								<li><a id="checkClassOpen" href="/admin/class/checkClassOpen">클래스 오픈 검수</a></li>
								<li><a id="openClass" href="/admin/class/openClass">진행중인 클래스</a></li>
								<li><a id="comingSoonClass" href="/admin/class/comingSoonClass">오픈 예정 클래스</a></li>
								<li><a id="closedClass" href="/admin/class/closedClass">종료된 클래스</a></li>
							</ul>
						</li>
						<hr class="sideBarLine">
						<li>
							<label id="memberMenu">회원 관리</label>
							<ul>
								<li><a id="memberList" href="/admin/member/memberList">전체 회원목록</a></li>
								<li><a id="memberOrder" href="/admin/member/memberOrder">주문한 회원목록</a></li>
							</ul>
						</li>
						<hr class="sideBarLine">
						<li>
							<label id="salesMenu">매출 현황</label>
							<ul>
								<li><a id="total" href="/admin/sales/total">전체 매출현황</a></li>
								<li><a id="particular" href="/admin/sales/particular">클래스별 매출현황</a></li>
							</ul>
						</li>
						<hr class="sideBarLine">
						<li>
							<label id="eventMenu">이벤트 관리</label>
							<ul>
								<li><a id="eventList" href="/admin/event/eventList">이벤트 목록</a></li>
								<li><a id="write" href="/event/write">이벤트 등록</a></li>
								<li><a id="eventPage" href="/event/">이벤트 게시판</a></li>
							</ul>
						</li>
						<hr class="sideBarLine">
						<li>
							<label id="categoryMenu">카테고리 관리</label>
							<ul>
								<li><a id="categoryList" href="/admin/category/categoryList">카테고리 목록</a></li>
								<li><a id="addCategory" href="/admin/category/addCategory">카테고리 추가</a></li>
							</ul>
						</li>
					</ul>
			</aside>
			<article>