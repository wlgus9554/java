<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
<h1>request</h1>
<p>클라이언트에서 서버 쪽으로 넘어 주는 데이터가 저장되어 있다.</p>
request.getContextPath() = 
<%= "["+ request.getContextPath() + "]<br>" %>
request.getMethod() = 
<%= "["+ request.getMethod() + "]<br>" %>
request.getRequestURL() = 
<%= "["+ request.getRequestURL() + "]<br>" %>
request.getRequestURI() = 
<%= "["+ request.getRequestURI() + "]<br>" %>
request.getServerName() = 
<%= "["+ request.getServerName() + "]<br>" %>
request.getProtocol() = 
<%= "["+ request.getProtocol() + "]<br>" %>
request.getRemoteAddr() = 
<%= "["+ request.getRemoteAddr() + "]<br>" %>
request.getRemoteUser() = 
<%= "["+ request.getRemoteUser() + "]<br>" %>
request.getCookies() = 
<%= "["+ request. getCookies() + "]<br>" %>
--------- 넘어오는 데이터 확인(이전 페이지에서 세팅) --------------<br>
name = 
<%= "["+ request.getParameter("name") + "]<br>" %>
age = 
<%= "["+ request.getParameter("age") + "]<br>" %>

<%
// request에 속성으로 저장 - 처리된 데이터
request.setAttribute("title", "자바란?");
%>
--------- 속성으로 저장해 놓은 데이터 --------------<br>
title = <%= request.getAttribute("title") %> - 표현식<br>
title = ${title} - EL 객체<br>
</body>
</html>