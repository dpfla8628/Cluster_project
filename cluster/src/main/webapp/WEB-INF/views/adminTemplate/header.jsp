<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자단 헤더</title>
<link rel="stylesheet" type="text/css" href="/css/sw.css">
<style>
	main {
		width:100%;
		height:auto;
		margin:auto;
		font-size:18px;
	}
	header, aside, footer {
		background-color:#fccc5b;
	}
	header {
		height:150px;
		background-color:#fccc5b;
	}
	section {
		height:calc(100% - 150px);
		display:flex;
	}
	aside {
		width:200px;
		height:calc(100% - 150px);
		background-color:#fccc5b;
	}
	article {
		width: calc(100% - 200px);
		height:calc(100% - 150px);
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
	.sideMenu a {
		color:black;
		text-decoration:none;
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
	.headerDiv{
		position:fixed;
		width:100%;
		background-color:#fccc5b;
	}
	.asideDiv{
		height:calc(100% - 150px);
		width:300px;
		background-color:#fccc5b;
		position:fixed;
	}
	.title{
		padding:0 1.5rem;
		padding-left: 3.5rem;
	}
	#logo{
		margin-bottom:0.5rem;
	}
	#logo a{
		font-size:40px;
		color:black;
		text-decoration:none;
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
			<div class="headerDiv">
				<div class="right">
					<a href="/">나가기</a>		
				</div>
				<div class="title">
					<div id="logo">
						<a href="/admin/home">Cluster</a>
					</div>
					<!-- 닉네임 얻기 위해 LoginController에 session.setAttribute("memberNick", member.getMemberNick());
					추가해달라고 말하기
					 -->
					<div>admin님 안녕하세요.</div>
					<div>Cluster 관리자 페이지입니다.</div>
				</div>
			</div>
		</header>
		
		<section>
			<aside>
				<div class="asideDiv">
					<ul class="sideMenu">
						<li>
							<a href="/admin/home">대시보드</a>
						</li>
						<li>
							<label id="creatorMenu">크리에이터 관리</label>
							<ul>
								<li><a href="/admin/creator/creatorList">크리에이터 명단</a></li>
								<li><a href="/admin/creator/income">크리에이터 정산</a></li>
							</ul>
						</li>
						<li>
							<label id="classMenu">클래스 관리</label>
							<ul>
								<li><a href="/admin/class/checkClassOpen">클래스 오픈 검수</a></li>
								<li><a href="/admin/class/openClass">진행중인 클래스</a></li>
								<li><a href="/admin/class/comingSoonClass">오픈 예정 클래스</a></li>
								<li><a href="/admin/class/closedClass">종료된 클래스</a></li>
							</ul>
						</li>
						<li>
							<a href="/admin/member/memberList">회원 관리</a>
						</li>
						<li>
							<label id="salesMenu">매출 현황</label>
							<ul>
								<li><a href="/admin/sales/total">전체 매출현황</a></li>
								<li><a href="/admin/sales/particular">클래스별 매출현황</a></li>
							</ul>
						</li>
						<li>
							<a href="/admin/event/eventList">이벤트 관리</a>
						</li>
						<li>
							<label id="categoryMenu">카테고리 관리</label>
							<ul>
								<li><a href="/admin/category/categoryList">카테고리 목록</a></li>
								<li><a href="/admin/category/addCategory">카테고리 추가</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</aside>
			<article>