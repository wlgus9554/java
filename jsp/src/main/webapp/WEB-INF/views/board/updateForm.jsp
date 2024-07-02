<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글수정</title>
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
$(function(){
	
	//2. jquery 확인
	console.log("jquery loading .... -------------");
	
	// 5. 이벤트 처리
	$("#writeForm").submit(function(){
		console.log("data check 진행 ..... ---");
		
		//6. 데이터 유효성 검사
		//   - 필수 항목 검사. - 제목, 내용, 작성자, 비밀번호
		if(isEmpty("#title", "제목", 1)) return false;
		if(isEmpty("#content", "내용", 1)) return false;
		if(isEmpty("#writer", "작성자", 1)) return false;
		if(isEmpty("#pw", "비밀번호", 0)) return false;
		
		//   - 길이 체크 - 제목, 내용, 작성자, 비밀번호
		if(lengthCheck("#title", "제목", 3, 100, 1)) return false;
		if(lengthCheck("#content", "내용", 3, 800, 1)) return false;
		if(lengthCheck("#writer", "작성자", 2, 10, 1)) return false;
		if(lengthCheck("#pw", "비밀번호", 3, 20, 0)) return false;
		
		// return false;
	})
	
});
</script>

</head>
<body>
<div class="container">
  <h2><i class="fa fa-edit"></i> 일반게시판 글수정</h2>
  <form action="update.jsp" method="post" id="writeForm">
    <div class="form-group">
      <label for="no">번호</label>
      <input type="text" class="form-control" id="no" value="10" name="no"
       readonly>
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title" value="부트스트랩"
       placeholder="제목 입력" name="title">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea name="content" id="content" placeholder="내용 입력" rows="7"
       class="form-control">디자인 표준화</textarea>
    </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="writer" value="이영환"
       placeholder="작성자 입력" name="writer">
    </div>
    <div class="form-group">
      <label for="pw">비밀번호</label>
      <input type="password" class="form-control" id="pw"
       placeholder="비밀번호 입력(본인 확인용)" name="pw">
    </div>
   <button type="submit" class="btn btn-primary">수정</button>
   <button type="reset" class="btn btn-secondary">다시입력</button>
   <button type="button" class="btn btn-success cancelBtn">취소</button>
  </form>
</div>

</body>
</html>