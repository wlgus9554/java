<%@page import="com.webjjang.board.service.BoardViewService"%>
<%@page import="com.musaic.util.exe.Execute"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
System.out.println("updateForm.jsp------------");

// 'no' 파라미터를 요청에서 수집
String noStr = request.getParameter("no");
System.out.println("no = " + noStr);

// 'no'를 Long 타입으로 변환
Long no = Long.parseLong(noStr);
System.out.println("no = " + noStr);

// BoardViewService를 통해 해당 글 번호의 게시글 데이터를 가져옴. 
// 조회수는 증가하지 않도록 설정 (0L)
BoardVO vo = (BoardVO) Execute.execute(new BoardViewService(), new Long[]{no, 0L});
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_Update</title>
<style type="text/css">

/* 테이블 스타일 */
table {
 	margin: 0 auto;
 	width: 800px; /* 너비 지정 */
}

/* 테이블 헤더와 데이터 셀 스타일 */
th, td {
 	border: 1px solid #888; /* 테두리 */
 	padding: 5px; /* 테두리와 데이터의 공백 */
}

/* 테이블 헤더 스타일 */
th {
 	background: black; /* 배경색 - 검정 */
 	color: white; /* 글자색 - 흰색 */
}

/* 입력 필드, 선택 상자, 텍스트 영역, 버튼 스타일 */
input, select, textarea, button {
 	padding: 5px;
}

/* 텍스트 입력 필드 스타일 */
.textInput {
 	width: 98%;
}

/* 입력 필드, 선택 상자, 텍스트 영역 기본 배경색 */
input, select, textarea {
 	background: #ddd;
}

/* 입력 필드, 선택 상자, 텍스트 영역에 포커스가 있을 때 배경색 */
input:focus, select:focus, textarea:focus {
 	background: white;
}

</style>
</head>
<body>

<!-- 글수정을 위한 폼 -->
<form action="update.jsp" method="post">
	<table>
		<tr>
			<th colspan="2">
				<h1>일반 게시판 글수정</h1>
			</th>
		</tr>
		<tr>
			<th>번호</th>
			<td>
				<!-- 글 번호는 읽기 전용으로 설정 -->
				<input id="no" name="no" readonly value="<%= vo.getNo() %>">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<!-- 제목 입력 필드 -->
				<input id="title" name="title" required 
					class="textInput" maxlength="100"
					pattern="^[^ .].{2,99}$" value="<%= vo.getTitle() %>"
					title="맨앞에 공백문자 불가. 3~100자 입력"
					placeholder="제목 입력 : 3자 이상 100자 이내"
				>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<!-- 내용 입력 필드 -->
				<textarea class="textInput" id="content" name="content" required
				rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."
				><%= vo.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<!-- 작성자 입력 필드 -->
				<input id="writer" name="writer" required 
					class="textInput" maxlength="10"
					pattern="^[a-zA-Z가-힣]{2,10}$" value="<%= vo.getWriter() %>"
					title="한글과 영어만 입력. 2~10자 입력"
					placeholder="이름은 영어와 한글만 가능"
				>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<!-- 비밀번호 입력 필드 -->
				<input type="password" id="pw" name="pw" required 
					class="textInput" maxlength="20"
					pattern="^.{3,20}$"
					title="3~20자 입력 가능"
					placeholder="본인 확인용 비밀번호"
				>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- 수정, 재입력, 취소 버튼 -->
				<button>수정</button>
				<button type="reset">다시입력</button>
				<button type="button" onclick="history.back();">취소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
