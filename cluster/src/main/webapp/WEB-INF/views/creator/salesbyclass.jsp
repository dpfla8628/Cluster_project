<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/WEB-INF/views/creator/template/header.jsp"></c:import>
<style>
	.table:not(.table-bordered) thead tr th{
		background-color: orange;
    	color: white;
    	font-weight: bold;
    	text-align: center;
    }
	img{
		width: 100px;
   		height: 80px;
	}
	.btn{
		height: 30px;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cntPerPage").on("change", function(){
			var sel = $("#cntPerPage option:selected").val()
			self.location = "/creator/salesbyclass?nowPage=1&cntPerPage="+sel;
		})
	})	
</script>
<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="page-content-wrapper">
<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">강의 별 매출</p>
    <div class="item-wrapper">
      <div class="table-responsive">
      	<div style="float: right;">
				<select id="cntPerPage" class="btn btn-outline-primary dropdown-toggle" name="sel">
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
              <th width="10%">번호</th>
              <th width="40%">강의 명</th>
              <th width="10%">진행 상황</th>
              <th width="10%">누적 인원</th>
              <th width="10%">강의 가격</th>
              <th width="20%">총매출</th>
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
					<c:forEach items="${list}" var="OffclassInfoVO">
						<tr>
							<td align="center">${OffclassInfoVO.classNo}</td>
							<td align="left">
								<a href="/creator/read?classNo=${OffclassInfoVO.classNo}">
									${OffclassInfoVO.className}
								</a>
							</td>
							<td align="center">${OffclassInfoVO.classEndCheck}</td>
							<td align="center">${OffclassInfoVO.classOrder.size()}명</td>
							<td align="center">${OffclassInfoVO.classPrice}원</td>
							<td align="center">${OffclassInfoVO.classOrder.size() * OffclassInfoVO.classPrice}원</td>
						</tr>
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
			<a href="/creator/salesbyclass?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/creator/salesbyclass?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/creator/salesbyclass?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>	
	
<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  