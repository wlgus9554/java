<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바입니다. - 쿠키 처리를 합니다. -> Controller에서 처리
	// 1. 저장할 Cookie 객체 생성 - 셋팅 : JAVA
	Cookie c = new Cookie("id","pinksung");
	// 2. 시간 설정 - 1초 단위 지정
	c.setMaxAge(1*60);
	// 3. 쿠키 서버 -> 클라이언트 전송(사용자 컴퓨터에 저장)
	response.addCookie(c);
	// 4. 쿠키를 생성하여 클라이언트에 전송
	response.addCookie(new Cookie("pwd", "test1234"));
	response.addCookie(new Cookie("age", "20"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie &amp; Session</title>
</head>
<body>

<h3> 쿠키 설정 </h3>
<a href="getCookies.jsp">쿠키 확인하기</a>
</body>
</html>