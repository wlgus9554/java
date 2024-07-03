<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 글보기</title>
</head>
<body>
	<div class="container">
		<h1>이미지 글보기</h1>
		<div class="card">
			<div class="card-header">
				<b>${vo.no }. ${vo.title } </b>
			</div>
			<div class="card-body">
				<div class="card" style="width: 100%">
					<img class="card-img-top" src="${vo.fileName }" alt="image">
					<div class="card-img-overlay">
						<c:if test="${login.id == vo.id }">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#changeImageModal">이미지 변경</button>
						</c:if>
						<a href="${vo.fileName }" class="btn btn-success" download>다운로드</a>
					</div>

					<div class="card-body">
						<p class="card-text">
						<pre>${vo.content }</pre>
						</p>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<span class="float-right">${vo.writeDate }</span> ${vo.name }(${vo.id })
			</div>
		</div>
		<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
		<a
			href="updateForm.do?no=${param.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
			class="btn btn-primary">수정</a>
		<button type="button" class="btn btn-danger" data-toggle="modal"
			data-target="#myModal">삭제</button>
		<a
			href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
			class="btn btn-info">리스트</a>

	</div>
	<!-- container의 끝 -->

	<!-- The Modal -->
	<div class="modal" id="changeImageModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">바꿀 이미지 선택하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="changeImage.do" method="post"
					enctype="multipart/form-data">
					<!-- 숨겨서 넘겨야할 데이터 - 이미지 번호, 현재 파일이름(삭제) -->
					<input name="no" value="${vo.no }" type="hidden"> <input
						name="deleteFileName" value="${vo.fileName }" type="hidden">
						<!-- 페이지 정보도 넘긴다. -->
						<input name="page" value="${param.page }" type="hidden">
						<input name="perPageNum" value="${param.perPageNum }" type="hidden">
						<input name="key" value="${param.key }" type="hidden">
						<input name="word" value="${param.word }" type="hidden">
					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							<label for="imageFile">첨부 이미지</label> <input id="imageFile"
								name="imageFile" required class="form-control" type="file">
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
					<button class="btn btn-primary">바꾸기</button>
						<button type="button" class="btn btn-danger" 
						data-dismiss="modal">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>