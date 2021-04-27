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
			self.location = "/creator/inquiry?nowPage=1&cntPerPage="+sel;
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
			  <th width="45%">강의명</th>
			  <th width="15%">질문자</th>
			  <th width="15%">진행상황</th>
			  <th colspan="2">설정</th>
            </tr>
          </thead>
          <tbody>
          	<c:choose>
				<c:when test="${empty classQnA}">
					<tr>
						<td align="center" colspan="5">
							받은 강의에 대한 질문이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${classQnA}" var="classQnAVO">
						<tr>
							<td align="left">${classQnAVO.className}</td>
							<td align="center">${classQnAVO.memberNick}</td>
							<td align="center">
								<c:if test="${empty classQnAVO.classA}">
									<label class="badge badge-warning">답변 대기중</label>
								</c:if>
								<c:if test="${!empty classQnAVO.classA}">
									<label class="badge badge-success">답변 완료</label>
								</c:if>
							</td>
							<td align="center">
								<a href="#r${classQnAVO.classqNo}" data-toggle="collapse" aria-expanded="false">
									<i class="mdi mdi-arrow-bottom-left">내용 보기</i>
				  				</a>
							</td>
							<td align="center">
								<c:if test="${empty classQnAVO.classA}">
									<button class="btn btn-info btn-rounded"><a href="/creator/answer?classqNo=${classQnAVO.classqNo}">
										답변하기
									</a></button>
								</c:if>
								<c:if test="${!empty classQnAVO.classA}">
									<button class="btn btn-success btn-rounded"><a href="/creator/answer?classqNo=${classQnAVO.classqNo}">
										수정하기
									</a></button>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="collapse navigation-submenu" id="r${classQnAVO.classqNo}">
									<p>${classQnAVO.classQ}
										<c:if test="${!empty classQnAVO.classA }">
											<hr>
											<i class="mdi mdi-message-reply-text">작성한 답변  : ${classQnAVO.classA}</i>
										</c:if>
									</p>
								</div>
							<td>
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
		<a href="/creator/inquiry?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<b>${p }</b>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a href="/creator/inquiry?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="/creator/inquiry?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
	</c:if>
   </div>
</div>    	
	
	
<c:import url="/WEB-INF/views/creator/template/footer.jsp"></c:import>  