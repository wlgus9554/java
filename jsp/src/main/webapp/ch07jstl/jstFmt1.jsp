<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
pageContext.setAttribute("now", new Date()); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- pre - 줄바꿈이나 공백 같은 특수 문자를 그대로 표시한다. 글 내용을 표시할 때 보통 많이 사용한다. -->
<pre>
톰캣 서버의 기본 로케일(지역 표준 시간) : <%= response.getLocale() %>

<fmt:setLocale value="ko_kr"></fmt:setLocale>
로케일을 한국어로 설정후 로케일 확인 : <%= response.getLocale() %>
통화(돈의 표시) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
날짜 : <fmt:formatDate value="${now}"></fmt:formatDate>

<fmt:setLocale value="ja_JP"></fmt:setLocale>
로케일을 일본어로 설정후 로케일 확인 : <%= response.getLocale() %>
통화(돈의 표시) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
날짜 : <fmt:formatDate value="${now}"></fmt:formatDate>

<fmt:setLocale value="en_US"></fmt:setLocale>
로케일을 영어로 설정후 로케일 확인 : <%= response.getLocale() %>
통화(돈의 표시) : <fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
날짜 : <fmt:formatDate value="${now}"></fmt:formatDate>

숫자 표시(패턴) : <fmt:formatNumber value="12345.67" pattern="000,000.0" />

</pre>
</body>
</html>