<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Error</title>
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