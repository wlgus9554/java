<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>
<!-- 라이브러리 등록 -->
<!-- 라이브러리 필요하다. 웹라이브러리(js 라이브러리)
	1. 다운로드 : jquery.com : 내 서버에 파일을 둔다.
	2. CDN(Content Delivery Network) - 배달 받는 방식 사용.(*) -->
<!-- Boostrap(디자인의 표준화) : jquery(동작의 표준화) 포함. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript" src="/js/boardInputUtil.js"></script>

<style type="text/css">
#deleteDiv {
	display: none; /* 처음에 안보이게 */
	margin: 10px 0;
}
</style>

<script type="text/javascript">
$(function(){ // 문서가 준비되면 실행
	
	// 이벤트 처리
	
	// 메인 삭제 버튼 클릭
	$("#deleteBtn").click(function(){
// 		$(this).attr("disabled",true);
// 		$("#deleteDiv").show();
		// 비밀번호 지우기
		$("#pw").val("");
		// 모달을 보이게하자.
		$("#deleteModal").modal("show");
	});
	
	// deleteDiv의 삭제 버튼 처리
	$("#deleteForm").submit(function(){
		console.log("writeForm submit Event - -----------------");
		// 필수 입력 체크
		if(isEmpty("#pw", "비밀번호", 0)) return false;
		// 길이 체크
		if(lengthCheck("#pw", "비밀번호", 3, 20, 0)) return false;
	});
	
	// deleteDiv의 취소 버튼 처리
	$("#deleteCancelBtn").click(function(){
		console.log("writeForm 취소버튼 click Event - -----------------");
		$("#pw").val("");
// 		$("#deleteDiv").hide();
		// deleteModal을 보이지 않게하자.
		$("#deleteModal").modal("hide");
		// deleteModal을 보이게하자.
		// $("#deleteModal").modal("show");
		$("#deleteBtn").attr("disabled", false);
	});
});
</script>
</head>
<body>
<div class="container">
	<table class="table">
		<!-- tr : table row - 테이블 한줄 -->
		<tr>
			<!-- th : table head - 테이블 제목 텍스트 -->
			<th colspan="2">
				<h1><i class="fa fa-book"></i> 일반 게시판 글보기</h1>
			</th>
		</tr>
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<td>10</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>자바란?</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>프로그래밍 언어입니다.</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>홍길동</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>2024-05-15</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>15</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
				<a href="updateForm.jsp" class="btn btn-primary">수정</a>
<!-- 				<button class="btn btn-danger" id="deleteBtn">삭제</button> -->
<!-- 				<button type="button" class="btn btn-danger" id="deleteBtn" -->
<!-- 				 data-toggle="modal" data-target="#deleteModal"> -->
<!-- 				    삭제 -->
<!-- 				</button> -->
				<button type="button" class="btn btn-danger" id="deleteBtn">
				    삭제
				</button>
				<a href="list.jsp" class="btn btn-success">리스트</a>
<!-- 				<div id="deleteDiv"> -->
<!-- 					<form action="delete.jsp" method="post" id="deleteForm"> -->
<!-- 						<input type="hidden" name="no" value="10"> -->
<!-- 						<input name="pw" maxlength="20" -->
<!-- 							pattern="^.{3,20}$" id="pw" -->
<!-- 							title="3~20자 입력 가능" type="password" -->
<!-- 							placeholder="본인 확인용 비밀번호" -->
<!-- 						> -->
<!-- 						<button class="btn btn-danger">삭제</button> -->
<!-- 						<button type="button" class="btn btn-success" -->
<!-- 						 id="deleteCancelBtn">취소</button> -->
<!-- 					</form> -->
<!-- 				</div> -->
			</td>
		</tr>
	</table>
</div>

  <!-- The Modal -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">삭제를 위한 비밀번호 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			<form action="delete.jsp" method="post" id="deleteForm">
				<input type="hidden" name="no" value="10">
				<input name="pw" maxlength="20"
					pattern="^.{3,20}$" id="pw"
					title="3~20자 입력 가능" type="password"
					placeholder="본인 확인용 비밀번호"
				>
				<button class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-success"
				 id="deleteCancelBtn">취소</button>
			</form>
        </div>
        
        <!-- Modal footer -->
<!--         <div class="modal-footer"> -->
<!--           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         </div> -->
        
      </div>
    </div>
  </div>
  

</body>
</html>