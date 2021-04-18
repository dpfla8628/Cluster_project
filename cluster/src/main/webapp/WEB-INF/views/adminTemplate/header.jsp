<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자단 헤더</title>
<link rel="stylesheet" type="text/css" href="/css/sw.css">
<style>
	
	/* 전체 화면의 폭은 1024px 로 한다 */
	main {
		width:1200px;
		margin:auto;
	}
	
	/* 각각의 레이아웃 영역에 여백을 설정한다 */
	header, footer, nav, section {
		padding:1rem;
	}
	
	header {
		border-bottom: 1px solid black;
	}
	
	/* 본문에 내용이 없어도 최소높이를 설정하여 일정 크기만큼 표시되도록 한다 */
	section {
		min-height:650px;
	}
	
	aside {
		float:left;
		width:15%;
		min-height:450px;
		border-right: 1px solid black;
	}
	
	article {
		float:left;
		width:85%;
		min-height:450px;
		
	}
	
	.sideMenu > li {
		padding:0.5rem;
	}
	.sideMenu, 
	.sideMenu ul {
		margin:0;
		padding:0;
		list-style:none;
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
</style>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function(){
		$(".sideMenu").find("a").click(function(){
			
			$(this).next("ul").slideToggle();
		})
		
	});
		
</script> 

</head>
<body>
	<main>
		<header>
			<div class="right">
				<a href="/">나가기</a>		
			</div>
			<div class="title">
				<a href="/admin/home">클러스터</a>
				<div>admin님 안녕하세요.</div>
				<div>Cluster 관리자 페이지입니다.</div>
			</div>
		</header>
		
		<section>
			<aside>
				<ul class="sideMenu">
					<li>
						<a href="/admin/home">대시보드</a>
					</li>
					<li>
						<a id="creatorMenu" href="#">크리에이터 관리</a>
						<ul>
							<li><a href="/admin/creator/creatorList">크리에이터 명단</a></li>
							<li><a href="/admin/creator/income">크리에이터 정산</a></li>
						</ul>
					</li>
					<li>
						<a id="classMenu" href="#">클래스 관리</a>
						<ul>
							<li><a href="/admin/class/checkClassOpen">클래스 오픈 검수</a></li>
							<li><a href="/admin/class/openClass">진행중인 클래스</a></li>
							<li><a href="/admin/class/comingSoonClass">오픈 예정 클래스</a></li>
							<li><a href="/admin/class/closedClass">종료된 클래스</a></li>
						</ul>
					</li>
					<li>
						<a id="memberMenu" href="#">회원 관리</a>
						<ul>
							<li><a href="/admin/member/memberList">전체 회원목록</a></li>
							<li><a href="/admin/member/memberOrder">주문한 회원목록</a></li>
						</ul>
					</li>
					<li>
						<a id="salesMenu" href="#">매출 현황</a>
						<ul>
							<li><a href="/admin/sales/total">전체 매출현황</a></li>
							<li><a href="/admin/sales/particular">클래스별 매출현황</a></li>
						</ul>
					</li>
					<li>
						<a id="eventMenu" href="#">이벤트 관리</a>
						<ul>
							<li><a href="/admin/event/eventList">이벤트 목록</a></li>
							<li><a href="/admin/event/registerEvent">이벤트 등록</a></li>
						</ul>
					</li>
					<li>
						<a id="categoryMenu" href="#">카테고리 관리</a>
						<ul>
							<li><a href="/admin/category/categoryList">카테고리 목록</a></li>
							<li><a href="/admin/category/addCategory">카테고리 추가</a></li>
						</ul>
					</li>
				</ul>
			</aside>
			<article>