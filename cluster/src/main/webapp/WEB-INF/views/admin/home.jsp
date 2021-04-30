<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<jsp:include page="/WEB-INF/views/adminTemplate/header.jsp"></jsp:include>

<style>
	article{
		background-color:#000000;
	}
	.mychart1, .mychart2, .mychart3, .mychart4, .table1 {
		display: inline-block;
		font-size: 15px;
		color:#E2E2E2;
	}
	.table1 {
		width: 600px;
		height: 500px;
		font-size: 15px;
		color:#E2E2E2;
	}
	
	.outbox > .row{
		margin-left: 2rem;
	}
	.outbox{
		background-color:#000000;
		margin:0;
	}
	
	#home{
		color:#fff;
	}
	.dashboard{
		font-weight:bolder;
		font-size: 1.8em;
		margin-left:13.8rem;
	}
	
	
</style>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>




<!-- 전체 감싸는 div -->
<div class="outbox center">

	<div class="dashboard left">
		<p style="color:#E2E2E2">Dashboard</p>
	</div>
	<!-- 총 회원수 그래프 -->
	<div class="row mychart1">
	
		<canvas id="myChart1" width="600" height="500"></canvas>
		<script>
			
			var labels = [];
			var data = [];
			
			<c:forEach items="${monthList}" var="i">
				labels.push(<fmt:formatDate value="${i}" pattern="yyyyMM"/>);
			</c:forEach>
					
			
			//이번달 + 최근 6개월 각각 총 회원 수 불러와서 data에 넣기
			<c:forEach items="${memberCountList}" var="i">
				data.push(${i});
			</c:forEach>
			
			
			var ctx = document.getElementById('myChart1');
			var myChart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: labels,
					datasets: [{
						label: '총 회원 수',
						data: data,
						fill: false,
						borderColor: 'rgba(192, 75, 75, 1)',
						tension: 0.1
							
						
					}]
				},
				options: {
					title: {
						display: true,
						text: '총 회원 수',
						fontSize: 20,
						fontColor: '#E2E2E2',
						fontStyle: 'bold'
					},
					legend: {
						display: false
					},
					responsive: false,
					tooltips: {
						enabled: true
					},
					hover: {
						animationDuration: 0
					},
					animation: {
						onComplete: function () {
							var chartInstance = this.chart,
								ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(16, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
							ctx.fillStyle = '#E2E2E2';
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';
	
							this.data.datasets.forEach(function (dataset, i) {
								var meta = chartInstance.controller.getDatasetMeta(i);
								meta.data.forEach(function (bar, index) {
									var data = dataset.data[index].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");						
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								fontSize: 14,
								fontColor: '#E2E2E2'
								
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}],
						xAxes: [{
							ticks: {
								fontSize: 14,
								fontColor: '#E2E2E2'
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}]
					}
				}
				
			});	
		</script>
	</div>
	
	<!-- 일별 회원가입 수 -->
	<div class="row mychart2">
		
		<canvas id="myChart2" width="600" height="500"></canvas>
		
		<script>
		
			var labels = [];
			var data = [];
			
			<c:forEach items="${dayList}" var="i">
				labels.push(<fmt:formatDate value="${i}" pattern="yyyyMMdd"/>);
			</c:forEach>
			
			<c:forEach items="${memberJoinList}" var="i">
				data.push(${i});
			</c:forEach>
			
				
			var ctx = document.getElementById('myChart2');
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: labels,
					datasets: [{
						label: '일별 회원가입 수',
						data: data,
						backgroundColor: [
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'hsl(0, 100%, 35%)'
						],
						borderColor: [
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'hsl(0, 100%, 35%)'
						],
						borderWidth: 3
					}]
				},
				options: {
					title: {
						display: true,
						text: '일별 회원가입 수',
						fontSize: 20,
						fontColor: '#E2E2E2',
						fontStyle: 'bold'
					},
					legend: {
						display: false
					},
					responsive: false,
					tooltips: {
						enabled: true
					},
					hover: {
						animationDuration: 0
					},
					animation: {
						onComplete: function () {
							var chartInstance = this.chart,
								ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(16, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
							ctx.fillStyle = '#E2E2E2';
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';
	
							this.data.datasets.forEach(function (dataset, i) {
								var meta = chartInstance.controller.getDatasetMeta(i);
								meta.data.forEach(function (bar, index) {
									var data = dataset.data[index].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");							
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								fontSize: 14,
								fontColor: '#E2E2E2'
								
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}],
						xAxes: [{
							ticks: {
								fontSize: 14,
								fontColor: '#E2E2E2'
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}]
					}
				}
				
			});	
		</script>
	</div>
	
	
	<!-- 월매출  그래프-->
	<div class="row mychart3">
		
		<canvas id="myChart3" width="600" height="500"></canvas>
		
		<script>
			
			//labels 와 data 배열을 만든다 
			var labels = [];
			var data = [];
			
			//컨트롤러에서 받아온 ${monthList}에 있는 값을 labels 배열에 넣어준다.
			//${monthList}는 Date타입의 배열임. 그래서 fmt:formatDate ... 를 사용해서 pattern을 지정하고 labels에 넣어줌.
			
			<c:forEach items="${monthList}" var="i">
				labels.push(<fmt:formatDate value="${i}" pattern="yyyyMM"/>);
			</c:forEach>
			
			//컨트롤러에서 받은 ${monthSales}를 data배열에 넣어준다.
			<c:forEach items="${monthSales}" var="i">
				data.push(${i});
			</c:forEach>
			
			
			var ctx = document.getElementById('myChart3');
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: labels,
					datasets: [{
						label: '월매출',
						data: data,
						backgroundColor: [
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'hsl(0, 100%, 35%)'
						],
						borderColor: [
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'hsl(0, 100%, 35%)'
						],
						borderWidth: 3
					}]
				},
				options: {
					title: {
						display: true,
						text: '월매출',
						fontSize: 20,
						fontColor: '#E2E2E2',
						fontStyle: 'bold'
					},
					legend: {
						display: false
					},
					responsive: false,
					tooltips: {
						enabled: true
					},
					hover: {
						animationDuration: 0
					},
					animation: {
						onComplete: function () {
							var chartInstance = this.chart,
								ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(16, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
							ctx.fillStyle = '#E2E2E2';
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';
	
							this.data.datasets.forEach(function (dataset, i) {
								var meta = chartInstance.controller.getDatasetMeta(i);
								meta.data.forEach(function (bar, index) {
									var data = '￦'+ dataset.data[index].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");							
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								fontSize: 14,
								fontColor: '#E2E2E2'
								
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}],
						xAxes: [{
							ticks: {
								fontSize: 14,
								fontColor: '#E2E2E2'
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}]
					}
				}
				
			});	
		</script>
	</div>
	
	<!-- 일매출 그래프 -->
	
	<div class="row mychart4">
		
		<canvas id="myChart4" width="600" height="500"></canvas>
		
		<script>
			
			//위에 ${monthList}랑 동일한 방식
			var labels = [];
			var data = [];
			
			<c:forEach items="${dayList}" var="i">
				labels.push(<fmt:formatDate value="${i}" pattern="yyyyMMdd"/>);
			</c:forEach>
			
			<c:forEach items="${daySales}" var="i">
				data.push(${i});
			</c:forEach>
			
			
		
			var ctx = document.getElementById('myChart4');
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: labels,
					datasets: [{
						label: '일매출',
						data: data,
						backgroundColor: [
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'hsl(0, 100%, 35%)'
						],
						borderColor: [
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'#1F618D',
							'hsl(0, 100%, 35%)'
						],
						borderWidth: 3
					}]
				},
				options: {
					title: {
						display: true,
						text: '일매출',
						fontSize: 20,
						fontColor: '#E2E2E2',
						fontStyle: 'bold'
					},
					legend: {
						display: false
					},
					responsive: false,
					tooltips: {
						enabled: true
					},
					hover: {
						animationDuration: 0
					},
					animation: {
						onComplete: function () {
							var chartInstance = this.chart,
								ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(16, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
							ctx.fillStyle = '#E2E2E2';
							ctx.textAlign = 'center';
							ctx.textBaseline = 'bottom';
	
							this.data.datasets.forEach(function (dataset, i) {
								var meta = chartInstance.controller.getDatasetMeta(i);
								meta.data.forEach(function (bar, index) {
									var data = '￦'+ dataset.data[index].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");					
									ctx.fillText(data, bar._model.x, bar._model.y - 5);
								});
							});
						}
					},
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								fontSize: 14,
								fontColor: '#E2E2E2'
								
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}],
						xAxes: [{
							ticks: {
								fontSize: 14,
								fontColor: '#E2E2E2'
							},
							gridLines: {
								color:'rgba(255, 255, 255, 0.5)'
							}
						}]
					}
				}
				
			});	
		</script>
	</div>
	
	
	
	<!-- 매출액 기준 TOP10 클래스-->
	
	<div class="row table1">
		<h3>총 매출액 기준 Top10 클래스</h3>
		<span>${serverTime} 기준</span>
		<table class="swTable">
				<tr>
					<th width="15%">순위</th>
					<th width="35%">크리에이터</th>
					<th>클래스</th>
					<th>총 매출액</th>
				</tr>
				<c:choose>
					<c:when test="${empty listForTop10Sales}">
						<tr>
							<td colspan="4">결과가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listForTop10Sales}" var="adminTopSalesVO">
							<tr>
								<td>${adminTopSalesVO.rank}</td>
								<td>${adminTopSalesVO.memberNick}</td>
								<td>${adminTopSalesVO.className}</td>
								<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${adminTopSalesVO.sales}" /></td>
							</tr>
						</c:forEach>	
					</c:otherwise>		
				</c:choose>
			</table>
	</div>
	
	
	<!-- 판매수 기준 TOP10 클래스-->
	
	<div class="row table1">
		<h3>판매 수 기준 Top10 클래스</h3>
		<span>${serverTime} 기준</span>
		<table class="swTable">
				<tr>
					<th width="15%">순위</th>
					<th width="35%">크리에이터</th>
					<th>클래스</th>
					<th>판매수</th>
				</tr>
				<c:choose>
					<c:when test="${empty listForTop10Class}">
						<tr>
							<td colspan="4">결과가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listForTop10Class}" var="adminTopClassVO">
							<tr>
								<td>${adminTopClassVO.rank}</td>
								<td>${adminTopClassVO.creator}</td>
								<td>${adminTopClassVO.className}</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${adminTopClassVO.count}"/>건</td>
							</tr>
						</c:forEach>	
					</c:otherwise>		
				</c:choose>
			</table>
	</div>
	
	
</div>



<jsp:include page="/WEB-INF/views/adminTemplate/footer.jsp"></jsp:include>