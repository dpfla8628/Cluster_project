<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>크리에이터 신청 페이지</title>
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
<body>
	<nav class="t-header">
      <div class="t-header-brand-wrapper">
        <a href="/">
          <h1 style="color: orange;">Cluster</h1>
        </a>
      </div>
      <div class="t-header-content-wrapper">
        <div class="t-header-content">
       		<div class="top_btn gojoin"><i class="mdi mdi-account-circle"></i>
       			<a href="/creator/joinForm">크리에이터 신청하기</a>
       		</div>
        </div>
      </div>
    </nav>

	<div class="page-content-wrapper-inner">    
	       <div class="content-viewport">  
	         <h3>번호 : ${no}</h3>
             <h3>id : ${id}</h3>
			 <h3>권한 : ${auth}</h3>	
	           <div class="row">
	               <div class="col-md-7 equel-grid order-md-2">
	                   <div class="grid d-flex flex-column justify-content-between overflow-hidden">
	                       <div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
	                           <div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
	                               <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
	                           </div>
	                           <div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
	                               <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
	                           </div>
	                       </div>
	                       <div class="grid-body">
	                           <div class="d-flex justify-content-between">
	                               <p class="card-title">매출 분석</p>
	                               <div class="chartjs-legend" id="sales-revenue-chart-legend">
	                                   <ul class="0-legend">
	                                       <li><span style="background-color:#1A76CA"></span>Sales</li>
	                                       <li><span style="background-color:#2d92fe"></span>Marketing</li>
	                                   </ul>
	                               </div>
	                           </div>
	                           <div class="d-flex">
	                               <p class="d-none d-xl-block">12.5% Growth compared to the last week</p>
	                               <div class="ml-auto">
	                                   <h2 class="font-weight-medium text-gray"><i class="mdi mdi-menu-up text-success"></i><span class="animated-count">25.04</span>%</h2>
	                               </div>
	                           </div>
	                       </div><canvas class="mt-4 chartjs-render-monitor" id="myChartOne" height="255" style="display: block; width: 406px; height: 255px;" width="406"></canvas>
	                   </div>
	               </div>
	               <div class="col-md-5 order-md-0">
	               	<div class="grid d-flex flex-column justify-content-between overflow-hidden">
	                       <div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
	                           <div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
	                               <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
	                           </div>
	                           <div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
	                               <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
	                           </div>
	                       </div>
	               		<div class="grid-body">
	               			<div class="d-flex justify-content-between">
	               				<p class="card-title">강의 분석</p>
	               			</div>
	               		</div>
	               	</div>
	                   <div class="row">
	                       <div class="col-6 equel-grid">
	                           <div class="grid d-flex flex-column align-items-center justify-content-center">
	                               <div class="grid-body text-center">
	                                   <div class="profile-img img-rounded bg-inverse-primary no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-account-group mdi-2x"></i></div>
	                                   <h2 class="font-weight-medium"><span class="animated-count">21</span>개</h2><small class="text-gray d-block mt-3">총 강의 개수</small>
	                               </div>
	                           </div>
	                       </div>
	                       <div class="col-6 equel-grid">
	                           <div class="grid d-flex flex-column align-items-center justify-content-center">
	                               <div class="grid-body text-center">
	                                   <div class="profile-img img-rounded bg-inverse-danger no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-emoticon-happy mdi-2x"></i></div>
	                                   <h2 class="font-weight-medium"><span class="animated-count">100</span>명</h2><small class="text-gray d-block mt-3">강의 참가자</small>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	                   <div class="row">
	                       <div class="col-6 equel-grid">
	                           <div class="grid d-flex flex-column align-items-center justify-content-center">
	                               <div class="grid-body text-center">
	                                   <div class="profile-img img-rounded bg-inverse-warning no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-view-carousel mdi-2x"></i></div>
	                                   <h2 class="font-weight-medium animated-count"><span class="animated-count">12</span>개</h2><small class="text-gray d-block mt-3">현재 진행 강의 수</small>
	                               </div>
	                           </div>
	                       </div>
	                       <div class="col-6 equel-grid">
	                           <div class="grid d-flex flex-column align-items-center justify-content-center">
	                               <div class="grid-body text-center">
	                                   <div class="profile-img img-rounded bg-inverse-success no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-heart mdi-2x"></i></div>
	                                   <h2 class="font-weight-medium"><span class="animated-count">100</span>회</h2><small class="text-gray d-block mt-3">총 좋아요</small>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	                   <div class="row">
	                       <div class="col-6 equel-grid">
	                           <div class="grid d-flex flex-column align-items-center justify-content-center">
	                               <div class="grid-body text-center">
	                                   <div class="profile-img img-rounded bg-inverse-warning no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-keyboard mdi-2x"></i></div>
	                                   <h2 class="font-weight-medium animated-count"><span class="animated-count">100</span>회</h2><small class="text-gray d-block mt-3">총 리뷰</small>
	                               </div>
	                           </div>
	                       </div>
	                       <div class="col-6 equel-grid">
	                           <div class="grid d-flex flex-column align-items-center justify-content-center">
	                               <div class="grid-body text-center">
	                                   <div class="profile-img img-rounded bg-inverse-success no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-lan-connect mdi-2x"></i></div>
	                                   <h2 class="font-weight-medium"><span class="animated-count">60</span>회</h2><small class="text-gray d-block mt-3">총 답변</small>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
		</div>
	</div>
</body>





<jsp:include page="/WEB-INF/views/maintemplate/footer.jsp"></jsp:include>