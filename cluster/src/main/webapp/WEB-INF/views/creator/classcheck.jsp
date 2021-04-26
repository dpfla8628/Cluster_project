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
<script type="text/javascript">
	$(document).ready(function(){
		$("#cntPerPage").on("change", function(){
			var sel = $("#cntPerPage option:selected").val()
			self.location = "/creator/classcheck?nowPage=1&cntPerPage="+sel;
		})
		
		$("#btnCancle, #btnDelete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?") == true){
				$("#del").submit;
			}
			else{
				return;
			}
		})
		
	})	
</script>

<c:import url="/WEB-INF/views/creator/template/aside.jsp"></c:import>
<div class="page-content-wrapper">
<div class="col-lg-6">
  <div class="grid">
    <p class="grid-header">검수 진행 중 강의 목록</p>
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
			  <th width="50%">강의명</th>
			  <th width="15%">신청일</th>
			  <th width="15%">진행상황</th>
			  <th width="10%">상태</th>
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
								<a href="/class_detail/detail/${offclass.classNo}">
									${offclass.className}
								</a>
							</td>
							<td align="center">${offclass.classRegdate}</td>
							<td align="center">${offclass.classCheck}</td>
							<c:if test="${offclass.classCheck eq '검수대기'}">
								<td align="center">
									<form action="/creator/delete" method="get" id="del">
					              		<input type="hidden" name="classNo" value="${offclass.classNo }"> 
					              	 	<button type="submit" class="btn btn-outline-danger btn-rounded" id="btnCancle">등록 취소</button>
					              	</form>
								</td>
							</c:if>
							<c:if test="${offclass.classCheck eq '반려'}">
								<td align="center">
									<form action="/creator/delete" method="get" id="del">
					              		<input type="hidden" name="classNo" value="${offclass.classNo }"> 
					              	 	<button type="submit" class="btn btn-danger btn-rounded" id="btnDelete">등록 삭제</button>
					              	</form>
								</td>
							</c:if>
							
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
		<a href="/creator/classcheck?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<b>${p }</b>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a href="/creator/classcheck?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="/creator/classcheck?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
	</c:if>
   </div>
</div>    	
<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  
