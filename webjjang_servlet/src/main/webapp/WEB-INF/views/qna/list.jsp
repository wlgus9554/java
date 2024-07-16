<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A List</title>
<style type="text/css">
.dataRow:hover{
	background: #e0e0e0;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	// 이벤트 처리
	$(".dataRow").click(function(){
	// 한줄 데이터를 클릭하면 질문답변보기로 이동 - 번호 필요.
	let no = $(this).find(".no").text();
	location = "view.do?no=" + no + "&${pageObject.pageQuery}"
	});
});
</script>
</head>
<body>
<div class="container">
	<h3>Q&A List</h3>
	<table class="table">
		<tr>
			<th>no</th>
			<th>title</th>
			<th>name</th>
			<th>writeDate</th>
		</tr>
		<c:forEach items="${list }" var="vo">
		<tr class="dataRow">
			<td class="no">${vo.no }</td>
			<td>
				<c:if test="${ vo.levNo != 0 }">
					<c:forEach begin="1" end="${vo.levNo * 3 }">
						&nbsp;
					</c:forEach>
					<i class="material-icons">subdirectory_arrow_right</i>
				</c:if>
				${vo.title }
			</td>
			<td>${vo.name }</td>
			<td>${vo.writeDate }</td>
		</tr>
		</c:forEach>
	</table>
	<c:if test="${!empty login }">
		<a href="questionForm.do?perPageNum=${pageObject.perPageNum }"
		 class="btn btn-dark">질문하기</a>
	</c:if>
</div>
</body>
</html>