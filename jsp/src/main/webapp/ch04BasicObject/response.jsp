<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response</title>
</head>
<body>
<%
System.out.println("response.jsp----------------------");
// 여기는 자바입니다. - 처리를 마친 후 자동으로 이동시킬때 사용.
response.sendRedirect("response_target.jsp");

%>
test
</body>
</html>