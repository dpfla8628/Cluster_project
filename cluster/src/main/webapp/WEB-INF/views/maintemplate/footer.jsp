<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
</section>
		<footer>
			<div class="center">
				<span style="line-height:200%;">
				상호명 : Cluster  |  사업자등록번호 : 111-11-11111  |  대표자 : 김승운, 박경일, 박아현, 송철희, 양세훈, 이예림
				<br>
				주소 : 서울특별시 강남구 내맘대로 8282, 2층 (코딩동, 할거야빌딩)  |  통신판매업신고번호 : 제 2021-서울강남-0503 호
				<br>
				&copy; 2021 Cluster, Inc. All Rights Reserved
				</span>
				<!-- 
					로그인 관련된 정보들을 출력(공부용)
					- 세션ID : 32글자의 16진수로 구성되어 있으며, 접속 시 랜덤으로 발급되며 같으면 같은 사용자로 인식한다.
					- check : 세션에 사용자의 번호를 저장하기 위한 값이며, 모든 페이지에서 유/무를 확인하여 로그인 처리 수행
				 
				 <h5 class="center">Session ID : <%=session.getId()%></h5>
				 <h5 class="center">check : <%=session.getAttribute("check")%></h5> 
				 -->
			 </div>
		</footer>
	</main>
</body>
</html>