<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
<div class="container">
	<h3>회원 가입</h3>
	<form action="login.do" method="post">
	  <div class="form-group">
	    <label for="id">ID</label>
	    <input type="text" class="form-control" placeholder="ID 입력"
	     id="id" name="id" autocomplete="none">
	  </div>
	  <div class="form-group">
	    <label for="pw">Password</label>
	    <input type="password" class="form-control"
	     placeholder="password 입력" id="pw" name="pw">
	  </div>
	  <button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>
</body>
</html>