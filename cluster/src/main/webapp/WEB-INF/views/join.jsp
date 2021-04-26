<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<body class="header-fixed">
	
	<nav class="t-header">
      <div class="t-header-brand-wrapper">
        <a href="/">
          <h1 style="color: orange;">Cluster</h1>
        </a>
      </div>
      <div class="t-header-content-wrapper">
        <div class="t-header-content">
       		<c:choose>
       			<c:when test="${member.memberAuth == '강사'}">
       				<div class="top_btn gohome"><i class="mdi mdi-account-circle"></i>
		       			<a href="/creator/home">크리에이터 홈으로</a>
		       		</div>
       			</c:when>
       			<c:when test="${member.memberAuth == '일반'}">
       				<div class="top_btn gojoin"><i class="mdi mdi-account-circle"></i>
		       			<a href="/joinForm">크리에이터 신청하기</a>
		       		</div>
       			</c:when>
       			<c:otherwise>
       				<div class="top_btn gojoin"><i class="mdi mdi-account-circle"></i>
		       			<a href="/">홈으로</a>
		       		</div>
       			</c:otherwise>
       		</c:choose>
       		
        </div>
      </div>
    </nav>
	
	<div class="page-body">
		<div class="sidebar"></div>
	
		<div class="page-content-wrapper">
			<div class="page-content-wrapper-inner">    
		       <div class="content-viewport">  
		         
		         	<div class="row">
                       <div class="col-6 equel-grid">
                           <div class="grid d-flex flex-column align-items-center justify-content-center">
                             	<img src="../resources/image/craft.PNG" width="100%" alt="craft image">
                           </div>
                       </div>
                       <div class="col-6 equel-grid">
                           <div class="grid d-flex flex-column align-items-center justify-content-center">
                               	<img src="../resources/image/cook.PNG" width="100%" alt="craft image">
                           </div>
                       </div>
                   </div>
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
		                           </div>
		                           <div class="d-flex">
		                               <p class="d-none d-xl-block"><br><br>2020년 경쟁 A사 대비 크리에이터 평균 수익률 비교</p>
		                               <div class="ml-auto">
		                                   <h2 class="font-weight-medium text-gray"><br><br><i class="mdi mdi-menu-up text-success"></i><span class="animated-count">32.04</span>%</h2>
		                               </div>
		                           </div>
		                       </div><canvas class="mt-4 chartjs-render-monitor" id="salesChart" height="255" style="display: block; width: 406px; height: 255px;" width="406"></canvas>
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
		                                   <div class="profile-img img-rounded bg-inverse-primary no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-view-carousel mdi-2x"></i></div>
		                                   <h2 class="font-weight-medium"><span class="animated-count">21</span> 만 개</h2><small class="text-gray d-block mt-3">총 강의 개수</small>
		                               </div>
		                           </div>
		                       </div>
		                       <div class="col-6 equel-grid">
		                           <div class="grid d-flex flex-column align-items-center justify-content-center">
		                               <div class="grid-body text-center">
		                                   <div class="profile-img img-rounded bg-inverse-danger no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-emoticon-happy mdi-2x"></i></div>
		                                   <h2 class="font-weight-medium"><span class="animated-count">85</span> 만 명</h2><small class="text-gray d-block mt-3">크리에이터 수</small>
		                               </div>
		                           </div>
		                       </div>
		                   </div>
		                   <div class="row">
		                       <div class="col-6 equel-grid">
		                           <div class="grid d-flex flex-column align-items-center justify-content-center">
		                               <div class="grid-body text-center">
		                                   <div class="profile-img img-rounded bg-inverse-warning no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-account-group mdi-2x"></i></div>
		                                   <h2 class="font-weight-medium animated-count"><span class="animated-count">830</span> 만 명</h2><small class="text-gray d-block mt-3">현재 가입자 수</small>
		                               </div>
		                           </div>
		                       </div>
		                       <div class="col-6 equel-grid">
		                           <div class="grid d-flex flex-column align-items-center justify-content-center">
		                               <div class="grid-body text-center">
		                                   <div class="profile-img img-rounded bg-inverse-success no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-lan-connect mdi-2x"></i></div>
		                                   <h2 class="font-weight-medium"><span class="animated-count">12</span> 만 명</h2><small class="text-gray d-block mt-3">1일 평균 접속자</small>
		                               </div>
		                           </div>
		                       </div>
		                   </div>
		                   <div class="row">
		                       <div class="col-6 equel-grid">
		                           <div class="grid d-flex flex-column align-items-center justify-content-center">
		                               <div class="grid-body text-center">
		                                   <div class="profile-img img-rounded bg-inverse-warning no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-keyboard mdi-2x"></i></div>
		                                   <h2 class="font-weight-medium animated-count"><span class="animated-count">2,300</span> 만 회</h2><small class="text-gray d-block mt-3">총 리뷰</small>
		                               </div>
		                           </div>
		                       </div>
		                       <div class="col-6 equel-grid">
		                           <div class="grid d-flex flex-column align-items-center justify-content-center">
		                               <div class="grid-body text-center">
		                                   <div class="profile-img img-rounded bg-inverse-success no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-heart mdi-2x"></i></div>
		                                   <h2 class="font-weight-medium"><span class="animated-count">3,400</span> 만 회</h2><small class="text-gray d-block mt-3">총 좋아요 수</small>
		                               </div>
		                           </div>
		                       </div>
		                   </div>
		               </div>
		           </div>
		           <!-- 이미지 부분 -->
	          		
                   <div class="row">
                       <div class="col-6 equel-grid">
                           <div class="grid d-flex flex-column align-items-center justify-content-center">
                           		<img src="../resources/image/draw.PNG" width="100%" alt="craft image">
                           </div>
                       </div>
                       <div class="col-6 equel-grid">
                           <div class="grid d-flex flex-column align-items-center justify-content-center">
                           		<img src="../resources/image/exercise.PNG" width="100%" alt="craft image">
                           </div>
                       </div>
                   </div>
                   <div class="row">
                       <div class="col-6 equel-grid">
                           <div class="grid d-flex flex-column align-items-center justify-content-center">
                           		<img src="../resources/image/music.PNG" width="100%" alt="craft image">
                           </div>
                       </div>
                       <div class="col-6 equel-grid">
                           <div class="grid d-flex flex-column align-items-center justify-content-center">
                           		<img src="../resources/image/study.PNG" width="100%" alt="craft image">
                           </div>
                       </div>
                   </div>
			</div>
		</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script type="text/javascript">
	new Chart(document.getElementById("salesChart"), {
		type : 'line', //pie, line, doughnut, palarArea
		data : {
			labels : [ '공예', '운동', '드로잉', '음악', '요리', '스터디'],
			datasets : [ {
				label : 'Cluster',
					data : [ 15, 23, 26, 19, 21, 27],
				borderColor: "orange",
				backgroundColor : "white",
				fill : false,
				lineTension: 0
			},
			{
				label : '경쟁 A사',
					data : [ 13, 18, 20, 16, 14, 21],
				borderColor: "#cf76CA",
				backgroundColor : "white",
				fill : false,
				lineTension: 0	
			
			} ]
		},
		options: {
			title: {
				display:true,
				text: '2020년 평균 월 수익 (단위 : 만원)'
			}
		}
	})
</script>

<jsp:include page="/WEB-INF/views/creator/template/footer.jsp"></jsp:include>