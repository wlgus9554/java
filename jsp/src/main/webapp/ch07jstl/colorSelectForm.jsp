<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL과 JSP</title>
</head>
<body>
<form action="colorSelect.jsp" method="get">
	<label for="color">색상</label><br>
	<select id="color" name="color">
		<option value="1">빨강</option>
		<option value="2">초록</option>
		<option value="3">파랑</option>
	</select>
	<input type="submit" value="전송">
</form>
</body>
</html>