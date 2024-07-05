<!-- isErrorPage="true" : 현재 jsp가 에러 처리 페이지 지정 - exception이 파라메터로 넘어온다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%
	// 넘어온 예외 객체인 exception을 request e 속성에 담아둔다.
	request.setAttribute("e", exception);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Error</title>
 <!-- Bootstrap 4 + jquery 라이브러리 등록 - CDN 방식 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- icon 라이브러리 등록 - Font Awesome 4 / google -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
	#errorDiv>div{
		padding: 10px;
		border-bottom: 1px dotted #aaa;
	}
	#errorDiv {
	padding: 
	}
</style>
</head>
<body>
<div class="container">
<div class="card">
  <div class="card-header"><h3>처리 프로세스 오류(500)</h3></div>
  <div class="card-body" id="errorDiv">
  <div class="text-center">
  	<i class="material-icons" style="font-size:80px;color:red">error</i>
  </div>
  <div class="row">
  <div class="col-md-3">오류 객체</div>
  <div class="col-md-9">${e.getClass().simpleName }</div>
</div>
  <div class="row">
  <div class="col-md-3">오류 메세지</div>
  <div class="col-md-9">${e.message }</div>
</div>
  <div class="row">
  <div class="col-md-3">조치 사항</div>
  <div class="col-md-9">오류로 인해서 불편을 드려 죄송합니다.<p>
  						오류가 계속 발생이되면 전산 담당자에게 연락 주세요.
  						</div>
</div>
  </div>
  <div class="card-footer"><a href="/board/list.do" class="btn btn-dark">일반 게시판으로 가기</a></div>
	
</div>
</div>
</body>
</html>