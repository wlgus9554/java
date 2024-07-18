<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${headTitle }</title>
</head>
<body>
<div class="container">
	<h3>${headTitle }</h3>
	<form action="write.do" method="post">
		<!-- 페이지 정보 넘기기 -->
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<!-- 질문답변 운영 정보 -->
		<input type="hidden" name="refNo" value="${vo.refNo }">
		<input type="hidden" name="ordNo" value="${(empty vo)?1:vo.ordNo + 1 }">
		<input type="hidden" name="levNo" value="${(empty vo)?0:vo.levNo + 1 }">
		<input type="hidden" name="parentNo" value="${vo.no }">
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" name="title" id="title" required
			 value="${(empty vo)?'':('[답변]' += vo.title) }">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<c:if test="${empty vo }">
				<textarea class="form-control" name="content" rows="7"
				 id="content" required></textarea>
			</c:if>
			<c:if test="${!empty vo }">
				<textarea class="form-control" name="content" rows="7"
				 id="content" required>


----------------[질문 원본]----------------------
${vo.content }
</textarea>
			</c:if>
		</div>
		<button class="btn btn-primary">등록</button>
		<button type="reset"  class="btn btn-warning">다시입력</button>
		<button type="button" class="cancelBtn btn btn-success">취소</button>
	</form>
</div>
</body>
</html>