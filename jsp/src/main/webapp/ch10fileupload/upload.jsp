<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/upload" method="post" enctype="multipart/form-data">
	글쓴이 : <input name="name"><br>
	제 목 : <input name="title"><br>
	파일 : <input name="uploadFile" type="file"><br>
	<button>전송</button>
</form>
</body>
</html>