<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello HSP</h1>
<%
// 여기는 자바입니다. = 스크립틀릿 - 출력 위치 : 바로 출력
	// 변수 선언 초기값
	int num1 = 20;
	int num2 = 10;
	int add = num1 + num2;
	// jsp의 기본 객체(생성하지 않고 사용 가능 객체) out을 사용하면 출력 가능
	// out : 서버에서 클리이언 방향으로 데이터 전송을 한다.
	out.print(num1 + " + " + num2 + " = " + add + "<br>");
%>
<!-- HTML의 주석 : xm로 끝나는 파일들의 주석 -->
<%-- JSP 주석 : 표현식을 이용한 출력 --%>
<%--EL 객체 : ${num1} - 변수 아님 - JSP 저장객체 4가지 중에서 찾는다. --%>
<%= num1 %> + <%= num2 %> = <%= add %><br>
<%= num1 + " + " + num2 + " = " + add + "<br>" %>
</body>
</html>