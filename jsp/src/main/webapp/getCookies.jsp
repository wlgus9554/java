<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// Cookies 가져오기 - 클라이언트 -> 서버 : request에서 꺼낸다. - 쿠키 전체를 꺼낸다. 
	Cookie[] cookies = request.getCookies();
// 받아야 할 쿠키 저장 변수.
String id = null;
String pwd = null;
String age = null;

if(cookies != null)
for(Cookie c : cookies) {
	if(c.getName().equals("id")) id = c.getValue();
	else if(c.getName().equals("pwd")) pwd = c.getValue();
	else if(c.getName().equals("age")) age = c.getValue();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie &amp; Session</title>
</head>
<body>
<h3>클라이언트로부터 얻어온 Cookie(id/pwd/age)</h3>
아이디 : <%= id %><br>
비밀번호 : <%= pwd %><br>
나이 : <%= age %><br>
<h3>클라이언트로부터 얻어온 전체 Cookie</h3>
<%
for(Cookie c : cookies) {
	out.println(c.getName() + " = " + c.getValue() +"<br>");
}
%>
<a href="removeCookies.jsp">쿠키 지우러 가기</a>
</body>
</html>