<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 수정</title>
</head>
<body>
	<div class="container">
		<h1>이미지 게시판 수정</h1>
		<div class="alert alert-danger">
			이미지를 제외한 나머지 텍스트 데이터를 수정합니다. 이미지는 위쪽 이미지 안에 바꾸기 버튼을 사용하세요.
		</div>
		<form action="update.do" method="post">
			<input type="hidden" name="page" value="${param.page }"> <input
				type="hidden" name="perPageNum" value="${param.perPageNum }">
			<input type="hidden" name="key" value="${param.key }"> <input
				type="hidden" name="word" value="${param.word }"> <input
				name="perPageNum" value="${param.perPageNum }" type="hidden">

			<div class="form-group">
				<label for="no">번호</label> <input id="no" name="no"
					class="form-control" value="${vo.no }" readonly>
			</div>

			<div class="form-group">
				<label for="title">제목</label> <input id="title" name="title"
					required value="${vo.title }" class="form-control" maxlength="100"
					pattern="^[^ .].{2,99}$" title="맨앞에 공백문자 불가. 3~100자 입력"
					placeholder="제목 입력 : 3자 이상 100자 이내">
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" required
					rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다.">${vo.content }</textarea>
			</div>

			<button class="btn btn-primary">수정</button>
			<button type="reset" class="btn btn-secondary">다시입력</button>
			<button type="button" onclick="history.back();"
				class="btn btn-warning">취소</button>
		</form>
	</div>
</body>
</html>