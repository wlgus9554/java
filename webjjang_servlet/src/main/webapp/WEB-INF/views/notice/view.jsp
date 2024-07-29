<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글보기</title>
</head>
<body>
<div class="container">
	<h1>공지사항 글보기</h1>
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
			<th>게시일</th>
			<td>${vo.startDate }</td>
		</tr>
		<tr>
			<th>종료일</th>
			<td>${vo.endDate }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${vo.updateDate }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.writeDate }</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
				<a href="updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-primary">수정</a>
				<a href="delete.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-primary">삭제</a>
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-info">리스트</a>
			</td>
		</tr>
	</table>


</div>
<!-- container의 끝 -->



</body>
</html>