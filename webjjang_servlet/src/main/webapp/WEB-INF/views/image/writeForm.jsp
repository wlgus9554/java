<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 등록</title>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 등록</h2>
	<form action="write.do" method="post" enctype="multipart/form-data">
		<input name="perPageNum" value = "${param.perPageNum }" type="hidden">
		 <div class="form-group">
		    <label for="title">제목</label>
			<input id="title" name="title" required 
				class="form-control" maxlength="100"
				pattern="^[^ .].{2,99}$"
				title="맨앞에 공백문자 불가. 3~100자 입력"
				placeholder="제목 입력 : 3자 이상 100자 이내"
			>
		  </div>
		  
		  <div class="form-group">
		    <label for="content">내용</label>
			<textarea class="form-control" id="content" name="content"  required
			rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."></textarea>
		  </div>

		 <div class="form-group">
		    <label for="imageFile">첨부 이미지</label>
			<input id="imageFile" name="imageFile" required 
				class="form-control" type="file"
			>
		  </div>
		  
		<button class="btn btn-primary">등록</button>
		<button type="reset" class="btn btn-secondary">다시입력</button>
		<button type="button" onclick="history.back();" class="btn btn-warning">취소</button>
		
	</form>
</div>
</body>
</html>