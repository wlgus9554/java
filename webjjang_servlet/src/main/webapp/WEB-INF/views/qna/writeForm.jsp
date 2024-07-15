<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<input class="form-control" name="title" id="title" required>
		</div>
		<div class="form-group">
			<label for="content">내용</label>  
			<textarea class="form-control" name="content" id="content" rows="7" required ></textarea>
		</div>
		<button type="submit" class="btn btn-dark">등록</button>
		<button type="reset" class="btn btn-warning">다시입력</button>
		<button type="button" class="cancelBtn btn btn-dark">취소</button>
	</form>
</div>
</body>
</html>