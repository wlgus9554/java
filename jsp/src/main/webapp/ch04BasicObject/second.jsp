<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장 객체 확인</title>
</head>
<body>
EL의 name = ${name}<br>
pageContext의 name = ${pageScope.name}<br>
request의 name = ${requestScope.name}<br>
session의 name = ${sessionScope.name}<br>
application의 name = ${applicationScope.name}<br>

<p>
<a href="third.jsp">third.jsp로 이동</a>
</p>
</body>
</html>