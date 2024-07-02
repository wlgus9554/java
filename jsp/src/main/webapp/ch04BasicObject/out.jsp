<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체(=기본객체)</title>
</head>
<body>
<h1>내장 객체(=기본객체)</h1>
- 생성하지 않지만 기본적으로 생성이 이미 되어져 있어서 사용 가능한 객체(변수명으로 사용)<br>
<%
	// 표현식으로 사용 가능
	out.print(10+20 + "<br>");
%>
<%= 10+20 + "<br>" %>
</body>
</html>