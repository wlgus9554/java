<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Q&A View</title>
</head>
<body>
<div class="container">
	<h3>Q&A View</h3>
		<div class="card">
	   	<div class="card-header"><span class="">${vo.name }</span>
	   	${vo.title }
	   	</div>
	 	<div class="card-body"><pre>${vo.content }</pre></div>
	 	<div class="card-footer">
	 	<span class="float-right">${vo.writeDate }</span>
	 	${vo.name }
	 	</div>
</div>
	 	<c:if test="${!empty login && vo.id != login.id && vo.levNo <3 }">
	 		<a href="answerForm.do?no=${vo.no }&perPageNum=${param.perPageNum}" 
	 		class="btn btn-dark">Answer</a>
	 	</c:if>
	 		<a href="list.do?${param.pageQuery}"
	 		class="btn btn-dark">List</a>
</div>
</body>
</html>