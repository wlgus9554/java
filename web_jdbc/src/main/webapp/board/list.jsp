<%@page import="com.webjjang.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.webjjang.board.service.BoardListService"%>
<%@page import="com.webjjang.util.exe.Execute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    // 데이터 가져오기
    List<BoardVO> list = (List<BoardVO>) Execute.execute(new BoardListService(), null);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_List</title>
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
	background: black; /* 배경색 - #000 */
	color: white; /* 글자색 - #fff */
}
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
button:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<table>
	<tr>
		<th colspan="5">
			<h1>게시판 리스트</h1>
		</th>
	</tr>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<% for(BoardVO vo : list){ %>
	<tr onclick="location='view.jsp?no=<%= vo.getNo() %>&inc=1';" class="dataRow">
			<!-- td : table data - 테이블 데이터 텍스트 -->
		<td><%= vo.getNo() %></td>
		<td><%= vo.getTitle() %></td>
		<td><%= vo.getWriter() %></td>
		<td><%= vo.getWriteDate() %></td>
		<td><%= vo.getHit() %></td>
	</tr>
	<% } %>
	<tr>
		<td colspan="5">
			<a href="writeForm.jsp"><button>등록</button></a>
		</td>
	</tr>
</table>
</body>
</html>