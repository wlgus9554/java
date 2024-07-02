<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- isErrorPage = "true" : JSP의 예외처리한 JSP입니다. --%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
예외가 발생 되었습니다.<br>
<%= exception.getMessage() %>
</body>
</html>