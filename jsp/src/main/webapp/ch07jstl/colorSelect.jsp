<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 넘어오는 데이터 검사를 해서 처리 - EL 객체의 param을 이용해서 넘어오는 데이터 받기 -->
넘어오는 데이터 : ${ "색상 : " } ${param.color }<br>
<!-- tag에는 if문이 없다. JSP 자바 - 스크립틀릿 % 사용 -> 대신 사용 JSTL if 태그 사용
	else가 없다. test="조건" 조건이 맞으면 c:if 안에 내용이 나온다. -->
<c:if test="${param.color == 1}">
	<span style="color: red;">빨강</span>
</c:if>
<c:if test="${param.color == 2}">
	<span style="color: green;">초록</span>
</c:if>
<c:if test="${param.color == 3}">
	<span style="color: blue;">파랑</span>
</c:if>
</body>
</html>