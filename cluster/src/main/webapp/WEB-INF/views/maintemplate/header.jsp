<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<style>
/* 	html, body{
	    margin: 0;
	    padding: 0;
	} */
	main, header, nav, section, 
	aside, article, footer, div,
	label, span, p, a, button {
		font-family: '나눔고딕', 'Malgun Gothic', sans-serif;
	}
	.left{
		text-align: left !important;
	}
	.center{
	    text-align: center !important;
	}
	.right{
	    text-align: right !important;
	}
	.menu,
    .menu ul {
        list-style: none;
        padding: 2rem;
        height:68px;
        margin-top: 10px;
        font-weight: 600;
        font-size: 18px;
    }
    .menu>li,
    .menu>li>a {
        width: 100px;
        display: inline-block;
        position: relative;
        color: black;
        margin-left: 2rem;
        margin-right: 2rem;
    }
    
    .menu>li>a:hover {
    	color: #ffc107;
    	font-weight: 900;
    	font-size:19px;
    	text-decoration: underline;
    }
    a{
	    text-decoration: none;
	    color: black;
    }
    .top{
    	margin-top: 2rem;
    }
</style>

<title>Insert title here</title>
</head>
<body>
	<main>
		<header>
			<div class="container" style="margin-top: 2rem">
				<div class="row">
					<div class="col">
						<a href="${pageContext.request.contextPath}" class="logo">
					<%-- <img class="logo" alt="Cluster" src="${pageContext.request.contextPath}/images/logo.png"> --%>
							Cluster
					    </a>
					</div>
					<div class="col">
						<form class="form-inline" action="#" method="post">
							<div class="form-group right">    
								<input type="text" name="keyword" placeholder="검색어 입력" class="form-control">
							    <input type="submit" value="검색" class="btn btn-info" style="margin-left: 1rem">
							</div>
						</form>
					</div>
					<div class="col right">
						<button type="button" class="btn btn-secondary">로그인</button>
						<button type="button" class="btn btn-info" style="margin-left: 0.5rem">무료회원가입</button>
						<button type="button" class="btn btn-secondary" style="margin-left: 0.5rem">고객센터</button>
					</div>
				</div>
			</div>
			
			<nav>
				<ul class="menu center" style="margin-top: 2rem">
					<li><a href="${pageContext.request.contextPath}/crafts">공예</a></li>
					<li><a href="${pageContext.request.contextPath}">운동</a></li>
					<li><a href="${pageContext.request.contextPath}">드로잉</a></li>
					<li><a href="${pageContext.request.contextPath}">음악</a></li>
					<li><a href="${pageContext.request.contextPath}">요리</a></li>
					<li><a href="${pageContext.request.contextPath}">스터디</a></li>
					<li><a href="${pageContext.request.contextPath}">이벤트</a></li>
				</ul>
			</nav>
			
		</header>