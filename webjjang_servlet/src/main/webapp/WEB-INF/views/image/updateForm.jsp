<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판 글수정</title>
</head>
<body>
<div class="container">
	<form action="update.do" method="post">
		<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<input type="hidden" name="key" value="${param.key }">
		<input type="hidden" name="word" value="${param.word }">
		<h1>일반 게시판 글수정</h1>
		<table class="table">
			<!-- tr : table row - 테이블 한줄 -->
			<tr>
				<th>번호</th>
				<td>
					<input id="no" name="no" readonly value="${vo.no }"
					 class="form-control">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input id="title" name="title" required 
						class="form-control" maxlength="100"
						pattern="^[^ .].{2,99}$" value="${vo.title }"
						title="맨앞에 공백문자 불가. 3~100자 입력"
						placeholder="제목 입력 : 3자 이상 100자 이내"
					>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" id="content" name="content"  required
					rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."
					>${vo.content }</textarea>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input id="writer" name="writer" required 
						class="form-control" maxlength="10"
						pattern="^[a-zA-Z가-힣]{2,10}$" value="${vo.writer }"
						title="한글과 영어만 입력. 2~10자 입력"
						placeholder="이름은 영어와 한글만 가능"
					>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pw" name="pw" required 
						class="form-control" maxlength="20"
						pattern="^.{3,20}$"
						title="3~20자 입력 가능"
						placeholder="본인 확인용 비밀번호"
					>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
					<button class="btn btn-primary">수정</button>
					<button type="reset" class="btn btn-secondary">다시입력</button>
					<button type="button" onclick="history.back();" class="btn btn-warning">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>