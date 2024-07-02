<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- JSP의 예외 처리 : errorPage 속성으로 예외 발생 시 진행되는 jsp 설정 --%>
<%@ page errorPage="02_import_error.jsp" %>
<%--
JSP 지시자(디렉티브) : <%@ 이름 설정 %>
 1. page - page 설정에 대한 정보를 저장 : 맨위에 한개는 있어야 한다.
 2. include - 다른 JSP를 코드 복사 붙여 넣기해서 포함시킨다. - 위치는 상관 없음.
 3. taglib - 사용자 태그를 만들어서 사용하게 한다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= Calendar.getInstance() %>
<%= 10 / 0 %>
</body>
</html>