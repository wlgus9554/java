<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
${now }<br>
<fmt:formatDate value="${now }"/></br>
date : <fmt:formatDate value="${now }" type="date" /><br>
time : <fmt:formatDate value="${now }" type="time" /><br>
both : <fmt:formatDate value="${now }" type="both" /><br>
<!-- yyyy : 년도 -> 4자리, yy : 년도 -> 2자리,
	 MM : 월 -> 2자리 채우기 6->06, M : 0은 표시하지 않는다.
	 h : 12시간, H : 24시간 -->
pattern : "yy년 M월 d일 h시 m분 s초"
 <fmt:formatDate value="${now }" pattern="yyyy년 MM월 d일 hh시 m분 s초"></fmt:formatDate>
</pre>
</body>
</html>