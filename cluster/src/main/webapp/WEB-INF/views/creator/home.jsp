<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/creator/template/header.jsp"></c:import>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="page-content-wrapper">
    <div class="grid">
   		<p class="grid-header">크리에이터 데이터</p>
 	</div>
    <div class="page-content-wrapper-inner">
        <div class="viewport-header">
            <p>memberNo = ${member.memberNo}</p>
            <p>creatorNo = ${Creator.creatorNo}</p>
        </div>
        <div class="content-viewport">
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
                                    <div class="profile-img img-rounded bg-inverse-warning no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-emoticon-happy mdi-2x"></i></div>
                                    <h2 class="font-weight-medium"><span class="animated-count">100</span>명</h2><small class="text-gray d-block mt-3">강의 참가자</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 equel-grid">
                            <div class="grid d-flex flex-column align-items-center justify-content-center">
                                <div class="grid-body text-center">
                                    <div class="profile-img img-rounded bg-inverse-success no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-view-carousel mdi-2x"></i></div>
                                    <h2 class="font-weight-medium animated-count"><span class="animated-count">12</span>개</h2><small class="text-gray d-block mt-3">현재 진행 강의 수</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 equel-grid">
                            <div class="grid d-flex flex-column align-items-center justify-content-center">
                                <div class="grid-body text-center">
                                    <div class="profile-img img-rounded bg-inverse-danger no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-heart mdi-2x"></i></div>
                                    <h2 class="font-weight-medium"><span class="animated-count">100</span>회</h2><small class="text-gray d-block mt-3">총 좋아요</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 equel-grid">
                            <div class="grid d-flex flex-column align-items-center justify-content-center">
                                <div class="grid-body text-center">
                                    <div class="profile-img img-rounded bg-inverse-info no-avatar component-flat mx-auto mb-4"><i class="mdi mdi-keyboard mdi-2x"></i></div>
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
		
		<div class="col-lg-6">
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
                				<p class="card-title">매출 Top 10</p>
                			</div>
                		</div>
                	</div>
    		<div class="item-wrapper">
      			<div class="table-responsive">
      	
			        <table class="table table-striped">
			          <thead>
			            <tr>
			              <th>번호</th>
						  <th>강의명</th>
						  <th>진행상황</th>
						  <th>매출액</th>
			            </tr>
			          </thead>
			          <tbody>
			          	<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td align="center" colspan="7">
										진행중인 강의가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="offclass">
									<tr>
										<td align="center">${offclass.classNo}</td>
										<td align="left">
											<a href="/creator/read?classNo=${offclass.classNo}">
												${offclass.className}
											</a>
										</td>
										<td align="center">${offclass.classRegdate}</td>
										<td align="center">${offclass.classCheck}</td>
																				
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>          
			          </tbody>
			        </table>
      			</div>
    		</div>
  		</div>
		
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script>
		let myChartOne = document.getElementById('myChartOne').getContext('2d');

		let barChart = new Chart(myChartOne, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 11, 20, 23, 15, 18, 24, 29, 40, 20, 12, 35, 12 ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
						'#990000', 'blue', 'darkgreen', 'black', 'grey', 'green',
						'yellow', 'pink', 'darkgrey', 'skyblue', ]
				} ]
			}
		})
</script>

<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  