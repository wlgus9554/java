<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 보기</title>
</head>
<body>
	<div class="container">
	<c:if test="${param.accept==1 }">
		<h3>받은 메세지 보기</h3>
		<div class="card">
			<div class="card-header">
				<div class="media border p-3">
					<img src="${vo.senderPhoto }"
						class="mr-3 mt-3 rounded-circle" style="width: 60px;">
					<div class="media-body">
							${vo.senderName } <small><i>(${vo.senderId })</i></small>
						<p>보낸 날짜 : ${vo.sendDate } / 받은 날짜 : ${vo.acceptDate }</p>
					</div>
				</div>
			</div>
			<div class="card-body"><pre>${vo.content }</pre></div>
			<div class="card-footer">
				<a href="/message/writeForm.do" class="btn btn-dark">답장</a>
				<a href="/message/delete.do" class="btn btn-danger">삭제</a>
				<a href="/message/list.do?${pageObject.pageQuery }&mode=${param.mode}" 
				class="btn btn-dark">리스트</a>
				
			</div>
		</div>
		</c:if>
	<c:if test="${param.accept!=1 }">
		<h3>보낸 메세지 보기</h3>
		<div class="card">
			<div class="card-header">
				<div class="media border p-3">
					<img src="${vo.accepterPhoto }"
						class="mr-3 mt-3 rounded-circle" style="width: 60px;">
					<div class="media-body">
							${vo.accepterName } <small><i>(${vo.accepterId })</i></small>
						<p>받은 날짜 : ${(empty vo.acceptDate)?"읽지않음":vo.acceptDate } / 보낸 날짜 : ${vo.sendDate }</p>
					</div>
				</div>
			</div>
			<div class="card-body"><pre>${vo.content }</pre></div>
			<div class="card-footer">
				<c:if test="${empty vo.acceptDate }">
				<!-- 메세지를 상대방이 읽지 않은 경우에만 삭제가 가능하다. -->
					<a href="/message/delete.do" class="btn btn-danger">삭제</a>
				</c:if>
				<a href="/message/list.do?${pageObject.pageQuery }&mode=${param.mode}"
				 class="btn btn-dark">리스트</a>
			</div>
		</div>
		</c:if>
	</div>
</body>
</html>