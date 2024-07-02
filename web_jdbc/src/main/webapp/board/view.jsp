<%@page import="com.webjjang.board.vo.BoardVO"%>
<%@page import="com.webjjang.util.io.In"%>
<%@page import="com.webjjang.board.service.BoardViewService"%>
<%@page import="com.webjjang.util.exe.Execute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바 입니다.
System.out.println("view.jsp--------------------");
// 넘어오는 데이터 받기 출력
String noStr = request.getParameter("no");

String incStr = request.getParameter("inc");

System.out.println("no="+ noStr + ", inc=" + incStr);

BoardVO vo = (BoardVO)Execute.execute(new BoardViewService(), new Long[]{Long.parseLong(noStr), 1L});

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_View</title>
<style type="text/css">
table {
	margin: 0 auto;
	width: 800px;
}
th,td {
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
input, select, textarea {
	background: #ddd;
}
input:focus, select:focus, textarea:focus{
	background: white;
}
</style>
</head>
<body>
글번호 : ${param.no }, 조회수 증가 : ${param.inc } <br>
	<table>
		<tr>
			<th colspan="2">
				<h1>게시판 상세보기</h1>
			</th>
		</tr>
		<tr>
			<th>번호</th>
			<td><%= vo.getNo() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%= vo.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%= vo.getContent() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= vo.getWriter() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%= vo.getWriteDate() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= vo.getHit() %></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="updateForm.jsp?no=${param.no }"><button>수정</button></a>
				<a href="delete.jsp?no=${param.no }"><button>삭제</button></a>
				<a href="list.jsp"><button>리스트</button></a>
				<form action="delete.jsp" method="post">
				<input type="hidden" name="no" value=${param.no }>
				<input name="pw" required maxlength="100"
				pattern="^.{3,20}$"
					title="3~20자 입력"
					placeholder="본인 확인용 비밀번호">
				<button>삭제진행</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>