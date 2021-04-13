<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/creator/template/header.jsp"></c:import>

<style>
	.table:not(.table-bordered) thead tr th{
		background-color: orange;
    	color: white;
    	font-weight: bold;
    	text-align: center;
    }
	.btn{
		height: 30px;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnRegister").on("click", function(){
			self.location = "/creator/registerForm"
		})
		
		$("#cntPerPage").on("change", function(){
			var sel = $("#cntPerPage option:selected").val()
			self.location = "/creator/classinfo?nowPage=1&cntPerPage="+sel;
		})
		
		$("#btnStart").on("click", function(){
			var classNo = $("#classNo")
			var classNoVal = classNo.val();
			
			self.location = "/creator/startdate?classNo=" + classNoVal;
		})
		
		$("#btnEnd").on("click", function(){
			var classNo = $("#classNo")
			var classNoVal = classNo.val();
			
			self.location = "/creator/enddate?classNo=" + + classNoVal;
		})
	});
	
	
</script>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">진행 중 강의 목록</p>
    <div class="item-wrapper">
    	<p>크리에이트번호 : ${Creator.creatorNo}</p>
      <div class="table-responsive">
      	<div>
			<button type="button" class="btn btn-outline-warning" id="btnRegister">신규강의 신청</button>      	
			<select style="float: right;" id="cntPerPage" class="btn btn-outline-primary dropdown-toggle" name="sel">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</div> <!-- 옵션선택 끝 -->
        <table class="table table-striped">
          <thead>
            <tr>
              <th>번호</th>
			  <th>강의명</th>
			  <th>시작일</th>
			  <th>종료일</th>
			  <th>리뷰</th>
			  <th>신청인원</th>
			  <th>종료일 설정</th>
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
						
						<!-- 시작일, 종료일 설정이 완료 되었다면 날짜 표시 -->
						<c:if test="${offclass.classStart ne null and offclass.classEnd ne '2099-12-31'}">
						<tr>
							<td align="center">${offclass.classNo}</td>
							<td align="left">
								<a href="/creator/read?classNo=${offclass.classNo}">
									${offclass.className}
								</a>
							</td>
							<td align="center">${offclass.classStart}</td>
							<td align="center">${offclass.classEnd}</td>
							<td align="center">리뷰링크</td>
							<td align="center">결재완료링크</td>
							<td align="center"></td>
						</tr>
						</c:if>
						
						<!-- 시작일, 종료일 설정을 하지 않았다면 설정 버튼 표시 -->
						<c:if test="${offclass.classStart eq null and offclass.classEnd eq '2099-12-31'}">
							<tr>
							<td align="center">${offclass.classNo}</td>
							<td align="left">
								<a href="/creator/read?classNo=${offclass.classNo}">
									${offclass.className}
								</a>
							</td>
							<td align="center"><button class="btn btn-warning btn-rounded"><a href="/creator/startdate?classNo=${offclass.classNo}">
									시작일 설정
								</a></button></td>
							<td align="center">${offclass.classEnd}</td>
							<td align="center">리뷰링크</td>
							<td align="center">결재완료링크</td>
							<td align="center"><button class="btn btn-info btn-rounded"><a href="/creator/enddate?classNo=${offclass.classNo}">
									종료일 설정
								</a></button></td>
						</tr>
						</c:if>
						
						<!-- 시작일만 설정을 하지 않았다면 설정 버튼 표시 -->
						<c:if test="${offclass.classStart eq null and offclass.classEnd ne '2099-12-31'}">
							<tr>
							<td align="center">${offclass.classNo}</td>
							<td align="left">
								<a href="/creator/read?classNo=${offclass.classNo}">
									${offclass.className}
								</a>
							</td>
							<td align="center"><button class="btn btn-warning btn-rounded"><a href="/creator/startdate?classNo=${offclass.classNo}">
									시작일 설정
								</a></button></td>
							<td align="center">${offclass.classEnd}</td>
							<td align="center">리뷰링크</td>
							<td align="center">결재완료링크</td>
							<td align="center"></td>
						</tr>
						</c:if>
						
						<!-- 종료일만 설정을 하지 않았다면 설정 버튼 표시 -->
						<c:if test="${offclass.classStart ne null and offclass.classEnd eq '2099-12-31'}">
							<tr>
							<td align="center">${offclass.classNo}</td>
							<td align="left">
								<a href="/creator/read?classNo=${offclass.classNo}">
									${offclass.className}
								</a>
							</td>
							<td align="center">${offclass.classStart}</td>
							<td align="center">${offclass.classEnd}</td>
							<td align="center">리뷰링크</td>
							<td align="center">결재완료링크</td>
							<td align="center"><button class="btn btn-info btn-rounded"><a href="/creator/enddate?classNo=${offclass.classNo}">
									종료일 설정
								</a></button></td>
						</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>          
          </tbody>
        </table>
      </div>
    </div>
  </div> 
 
  <div style="display: block; text-align: center;">		
	<c:if test="${paging.startPage != 1 }">
		<a href="/creator/classinfo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<b>${p }</b>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a href="/creator/classinfo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="/creator/classinfo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
	</c:if>
  </div>
</div>
  	
<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  
