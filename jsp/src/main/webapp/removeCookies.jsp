<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키 삭제 방법은 시간을 0으로 세팅해서 다시 굽는다. - 항목별로 처리
	// 1. 저장할 쿠키 객체를 생성 - 셋팅 : JAVA
	Cookie idc = new Cookie("id","");
	// 2. 시간 설정 - 0 // 유효시간이 자난 것으로 처리
	idc.setMaxAge(0);
	// 3. 쿠키 서버 -> 클라이언트 전송(사용자 컴퓨터에 저장)
	response.addCookie(idc);
	// 1. 저장할 쿠키 객체를 생성 - 셋팅 : JAVA
	Cookie pwdc = new Cookie("pwd","");
	// 2. 시간 설정 - 0 // 유효시간이 자난 것으로 처리
	pwdc.setMaxAge(0);
	// 3. 쿠키 서버 -> 클라이언트 전송(사용자 컴퓨터에 저장)
	response.addCookie(pwdc);
	// 1. 저장할 쿠키 객체를 생성 - 셋팅 : JAVA
	Cookie agec = new Cookie("age","");
	// 2. 시간 설정 - 0 // 유효시간이 자난 것으로 처리
	agec.setMaxAge(0);
	// 3. 쿠키 서버 -> 클라이언트 전송(사용자 컴퓨터에 저장)
	response.addCookie(agec);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies &amp; Session</title>
</head>
<body>
<h3> id 쿠키가 삭제되었습니다.</h3>
<a href="getCookies.jsp">쿠키 삭제를 확인하려면 클릭하세요.</a>
</body>
</html>