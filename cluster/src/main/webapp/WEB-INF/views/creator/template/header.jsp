<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>크리에이터 관리 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../resources/vendors/iconfonts/mdi/css/materialdesignicons.css">
    <link rel="stylesheet" href="../resources/css/shared/style.css">
    <link rel="stylesheet" href="../resources/css/demo_1/style.css">
</head>
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
<body class="header-fixed">
    
    <nav class="t-header">
      <div class="t-header-brand-wrapper">
        <a href="/creator/home">
          <h1 style="color: orange;">Cluster</h1>
        </a>
      </div>
      <div class="t-header-content-wrapper">
        <div class="t-header-content">
        	<div class="top_btn goedit"><i class="mdi mdi-border-color"></i>
       			<a href="/creator/edit?creatorNo=${Creator.creatorNo}">정보수정</a>
       		</div>
       		<div class="top_btn gomain"><i class="mdi mdi-home"></i>
       			<a href="/">메인페이지</a>
       		</div>
       		<div class="top_btn gomypage"><i class="mdi mdi-account-circle"></i>
       			<a href="/mypage/index">마이페이지</a>
       		</div>
        </div>
      </div>
    </nav>
