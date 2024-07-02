
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
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<!-- pre - 줄바꿈이나 공백 같은 특수 문자를 그대로 표시한다. 글 내용을 표시할 때 보통 많이 사용한다. -->
<pre>
default: <c:out value="${now}"></c:out>
Korea KST : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>

<fmt:timeZone value="GMT">
Swiss GMT : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>
</fmt:timeZone>

<fmt:timeZone value="GMT-8">
NewYork GMT-8 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"></fmt:formatDate>
</fmt:timeZone>
</pre>
</body>
</html>