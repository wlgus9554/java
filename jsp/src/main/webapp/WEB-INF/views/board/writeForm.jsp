<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글등록</title>
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

<script type="text/javascript">
$(function(){ // == $(document).ready(function(){~});
	
	// 1. click 이벤트 - writeBtn
// 	$("#writeBtn").click(function(){
	// 2. submit 이벤트 - writeForm
	$("#writeForm").submit(function(){
		
		// alert("writeForm submit");
		
		// 필수 항목 체크
		// 제목 체크 - 제목란의 값을 가져와서 좌우 공백을 제거한다.
		let title = $("#title").val().trim();
		// 공백을 제거한 데이터를 제목 입력란에 다시 넣는다.
		$("#title").val(title);
		if(title == "") {
			alert("제목은 반드시 입력하셔야 합니다."); // 경고
			$("#title").focus(); // 커서 위치
			return false; // 페이지 이동을 막는다.
		} // 제목 체크 끝
		
		// 내용 필수 항목 체크
		if(isEmpty("#content", "내용", 1)) return false;
		// 작성 필수 항목 체크
		if(isEmpty("#writer", "작성자", 1)) return false;
		// 비밀번호 필수 항목 체크 - $("#pw").val() == ""
		if(isEmpty("#pw", "비밀번호", 0)) return false;
		// 내용 필수 항목 체크
		if(isEmpty("#pw2", "비밀번호 확인", 0)) return false;
		
		// 길이 제한 체크
		if(lengthCheck("#title","제목", 3, 100, 1)) return false;
		if(lengthCheck("#content","내용", 3, 800, 1)) return false;
		if(lengthCheck("#writer","작성자", 2, 10, 1)) return false;
		if(lengthCheck("#pw","비밀번호", 4, 20, 0)) return false;
		if(lengthCheck("#pw2","비밀번호 확인", 4, 20, 0)) return false;
		
		// 비밀번호와 비밀번호 확인
		let pw = $("#pw").val();
		let pw2 = $("#pw2").val();
		if(pw != pw2){
			alert("비밀번호와 비밀번호 확인이 같지 않습니다. 다시 입력해 주세요.");
			// 비밀번호와 비밀번호 확인의 데이터를 지운다.
			$("#pw,#pw2").val("");
			$("#pw").focus();
			return false;
		}
		
		// 페이지 이동 시키지 않는다. - 최초 이벤트 처리되는 함수에 작성한다
		// return false;
		
	});
	
});
</script>
</head>
<body>
<div class="container">
	<h3><i class="fa fa-file-text-o"></i> 일반 게시판 글등록</h3>
	<form action="write.jsp" method="post" id="writeForm">
	  <div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" class="form-control"
	     placeholder="제목 입력" id="title" name="title">
	  </div>
		<div class="form-group">
		  <label for="content">내용</label>
		  <textarea class="form-control" rows="7" id="content"
		   name="content" placeholder="내용 입력"></textarea>
		</div>	  
	  <div class="form-group">
	    <label for="writer">작성자</label>
	    <input type="text" class="form-control"
	     placeholder="작성자 입력" id="writer" name="writer">
	  </div>
	  <div class="form-group">
	    <label for="pw">비밀번호</label>
	    <input type="password" class="form-control" 
	     placeholder="비밀번호 입력" id="pw" name="pw">
	  </div>
	  <div class="form-group">
	    <label for="pw2">비밀번호 확인</label>
	    <input type="password" class="form-control" 
	     placeholder="비밀번호 확인 입력" id="pw2">
	  </div>
	  	<!-- 등록 버튼을 클릭하면 1. click-btn. 2. submit-form 이벤트로 처리 가능하다. -->
		<button type="submit" class="btn btn-primary"
			id="writeBtn">등록</button>
		<button type="reset" class="btn btn-secondary">새로입력</button>
		<button type="button" class="btn btn-success">취소</button>
	</form>
</div>
</body>
</html>