<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글보기</title>
</head>
<body>
<div class="container">
	<h1>일반 게시판 글보기</h1>
	<table class="table">
		<!-- tr : table row - 테이블 한줄 -->
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<td>${vo.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${vo.content }</pre></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.writeDate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.hit }</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
				<a href="updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-primary">수정</a>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
				    삭제
				  </button>
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-info">리스트</a>
			</td>
		</tr>
	</table>

	<!-- 댓글 처리 시작 -->
	<jsp:include page="reply.jsp"/>
	<!-- 댓글 처리 끝 -->
</div>
<!-- container의 끝 -->

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      <form action="delete.do" method="post">
      	<input type="hidden" name="perPageNum" value="${param.perPageNum }">
      	<input type="hidden" name="no" value="${param.no }">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">글삭제 비밀번호 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <input  type="password" class="form-control" placeholder="비밀번호 입력" name="pw">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<button class="btn btn-danger">삭제</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </form>
        
      </div>
    </div>
  </div>
  


</body>
</html>