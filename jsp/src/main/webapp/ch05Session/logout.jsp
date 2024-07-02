<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("logout.jsp ----------------------");
// session을 지우다. - 로그아웃
// 1. session 지우지 않고 session안에 login만 지운다.
// session.setAttribute("login", null);
session.removeAttribute("login");
// 2. session 지운다. 아래 쪽에서는 session 사용 불가. 
// - 페이지 이동이 되면 새로운 session 을 받는다.
// session.invalidate();

	// main으로 자동 이동
	response.sendRedirect("main.jsp");

%>