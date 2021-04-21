<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/creator/template/header.jsp"></c:import>

<style>
	.mb-0{
		float: right;	
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		$(".mb-0").on("change",function(){
			
			if($("#option1").prop("checked")){
				$("#show1").attr("hidden",false)
				$("#show2").attr("hidden",true)
				$("#show3").attr("hidden",true)
			}	
			else if($("#option2").prop("checked")){
				$("#show2").attr("hidden",false)
				$("#show3").attr("hidden",true)
				$("#show1").attr("hidden",true)
			}
			else{
				$("#show3").attr("hidden",false)
				$("#show2").attr("hidden",true)
				$("#show1").attr("hidden",true)
			}
		
		})
	})
   
	
	
</script>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="page-content-wrapper">
<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">기간 별 매출</p>
    <div class="item-wrapper">
        <div class="btn-group mb-0"  data-toggle="buttons">
           <label class="btn btn-outline-info active">
             <input type="radio" name="options" id="option1" checked="checked">
             	요일별
           </label>
           <label class="btn btn-outline-info">
           	<input type="radio" name="options" id="option2">
             	월별
           </label>
           <label class="btn btn-outline-info">
           	<input type="radio" name="options" id="option3">
             	년도별
           </label>
        </div>
             
         	<div class="content-viewport" id="show1">
	            <div class=row>	
			         <div class="grid-body">
			              <div class="d-flex justify-content-between">
			                 <p class="card-title">요일 별 매출</p>
			              </div>
				     </div><canvas class="mt-4 chartjs-render-monitor" id="weeklyChart" height="250" style="display: block; width: 450px; height: 450px;" width="450"></canvas>
			    </div>	 		 
        	 </div>   
          
	         <div class="content-viewport" id="show2" hidden="true">
        	 	<div class=row>
	        	 	<div class="grid-body">
			              <div class="d-flex justify-content-between">
			                 <p class="card-title">월 별 매출</p>
			              </div>
		          	</div><canvas class="mt-4 chartjs-render-monitor" id="monthChart"  height="250" style="display: block; width: 450px; height: 450px;" width="450"></canvas>
		 		</div>	 
	         </div>
          
	         <div class="content-viewport" id="show3" hidden="true">
	         	  <div class=row>
		         	  	<div class="grid-body" >
				              <div class="d-flex justify-content-between">
				                 <p class="card-title">년도 별 매출</p>
				              </div>
				        </div><canvas class="mt-4 chartjs-render-monitor" id="yearChart" height="250" style="display: block; width: 450px; height: 450px;" width="450"></canvas>
			 	   </div>	 
       		</div>   
   		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script>
	$(document).ready(function(){
		$(".mb-0").on("change",function(){		
			if($("#option3").prop("checked")){
				let yearChart = document.getElementById('yearChart').getContext('2d');
				let barChart = new Chart(yearChart, {
					type : 'doughnut', //pie, line, doughnut, palarArea
					data : {
						labels : [ '2018', '2019', '2020'],
						datasets : [ {
							label : '2018년 ~ 2020년 (단위 : 만원)',
							data : [ 11, 20, 23],
							backgroundColor : [ 'yellow', 'blue', 'green']
						} ]
					}
				})
			}
	
			else if($("#option2").prop("checked")){
				let monthChart = document.getElementById('monthChart').getContext('2d');
				let barChart = new Chart(monthChart, {
					type : 'line', //pie, line, doughnut, palarArea
					data : {
						labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
								'9월', '10월', '11월', '12월' ],
						datasets : [ {
							label : '2020년 (단위 : 만원)',
								data : [ 11, 20, 23, 15, 18, 24, 29, 40, 20, 12, 35, 12 ],
							backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
								'#990000', 'blue', 'darkgreen', 'black', 'grey', 'green',
								'yellow', 'pink', 'darkgrey', 'skyblue', ],
							fill : false	
						} ]
					}
				})
			}	
	
			else {
				let weeklyChart = document.getElementById('weeklyChart').getContext('2d');
				let barChart = new Chart(weeklyChart, {
					type : 'bar', //pie, line, doughnut, palarArea
					data : {
						labels : [ '일', '월', '화', '수', '목', '금', '토'],
						datasets : [ {
							label : '2020년 (단위 : 만원)',
							data : [ 11, 20, 35, 15, 24, 29, 4],
							backgroundColor : [ 'red', 'blue', 'darkgreen', 'black', 'grey', 'yellow', 'pink']
						} ]
					}
				})
			}
			
		})
	})
	
	 $( window ).on( "load", function() {
		let weeklyChart = document.getElementById('weeklyChart').getContext('2d');
		let barChart = new Chart(weeklyChart, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '일', '월', '화', '수', '목', '금', '토'],
				datasets : [ {
					label : '2020년 (단위 : 만원)',
					data : [ 11, 20, 35, 15, 24, 29, 4],
					backgroundColor : [ 'red', 'blue', 'darkgreen', 'black', 'grey', 'yellow', 'pink']
				} ]
			}
		})
    });
	
</script>

<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  