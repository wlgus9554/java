<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_Write</title>
<style type="text/css">
table {
	margin: 0 auto;
	width: 800px;
}
th, td {
	border: 1px solid #888;
	padding: 5px;
}
th {
	background: black;
	color: white;
}
input, select, textarea, button {
	padding: 5px;
}
.textInput {
	width: 98%;
}
input, select, textarea{
	background: #ddd;
}
input:focus, select:focus, textarea:focus{
 	background: white;
}
</style>
</head>
<body>
<form action="write.jsp"method="post">
	<table>
		<tr>
			<th colspan="2">
				<h1>게시판 글등록</h1>
			</th>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			<input id = "title" name = "title" required 
					class="textInput" maxlength="100"
					pattern="^[^ .].{2,99}$"
					title="맨앞에 공백문자 불가. 3~100자 입력"
					placeholder="제목입력. 3~100자 이내 입력">
			</td>
		</tr>
		<tr>
			<th>내용</th>
				<td>
				<textarea class="textInput" id = "content" name = "content" required
				rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."></textarea>
				</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
			<input id = "writer" name = "writer" required 
					class="textInput" maxlength="10"
					pattern="^[a-zA-Z가-힣].{2,10}$"
					title="한글과 영어만 입력. 2~10자 입력"
					placeholder="이름은 영어와 한글만 가능"
					>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="pw" name="pw" required
				class="textInput" maxlength="100"
				pattern="^.{3,20}$"
					title="3~20자 입력"
					placeholder="비밀번호를 입력하세요">
			</td>
		</tr>
		<tr>
			<th>비밀번호 재입력</th>
			<td>
				<input type="password" id="pw2" name="pw2" required
				class="textInput" maxlength="100"
				pattern="^.{3,20}$"
					title="3~20자 입력"
					placeholder="비밀번호를 재입력하세요">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">등록</button>
				<button type="reset">재입력</button>
				<button type="button" onclick="history.back();">취소</button>
			</td>
		</tr>
	</table>
</body>
</html>