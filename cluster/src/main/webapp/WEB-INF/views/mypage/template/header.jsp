<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>Mypage</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../resources/vendors/iconfonts/mdi/css/materialdesignicons.css">
    <link rel="stylesheet" href="../resources/css/shared/style.css">
    <link rel="stylesheet" href="../resources/css/demo_1/style.css">
     
</head>
  
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
	.t-header-content-wrapper{
		margin-left:auto;
		width: auto !important;
	}
	.table-responsive{
		width:auto;
	}
	.col-lg-6{
		max-width:90%
	}
	.top_btn{
		margin:5px;
	}
	a{
		color:black;
	}
	a:hover{
		font-weight:bold;
		color:orange;
	}
</style>

</head>
  <body class="header-fixed">
    <!-- partial:partials/_header.html -->
    <nav class="t-header">
      <div class="t-header-brand-wrapper">
        <a href="/">
          <h1 style="color: orange;">Cluster</h1>
        </a>
      </div>
      <div class="t-header-content-wrapper">
        <div class="t-header-content">
       		<div class="top_btn goshop"><i class="mdi mdi-cart-outline"></i>
       			<a href="#">장바구니</a>
       		</div>
       		<div class="top_btn gomypage"><i class="mdi mdi-account-circle"></i>
       			<a href="/mypage/index">마이페이지</a>
       		</div>
        </div>
      </div>
    </nav>