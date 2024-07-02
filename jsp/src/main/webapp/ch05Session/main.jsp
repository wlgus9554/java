<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
</head>
<body>
<h1>Main Page</h1>
<c:if test="${ empty login }">
	<!-- 로그인 하지 않은 메뉴 -->
	세션ID : <%= session.getId() %><br>
	<a href="loginForm.jsp">로그인</a>
</c:if>
<c:if test="${ !empty login }">
	<!-- 로그인한 메뉴 -->
	세션ID : <%= session.getId() %><br>
	아이디 : ${login.id }<br>
	<a href="logout.jsp">로그아웃</a>
	<c:if test="${login.gradeNo == 9 }">
	<!-- 관리자 메뉴 -->
	</c:if>
</c:if>
</body>
</html>