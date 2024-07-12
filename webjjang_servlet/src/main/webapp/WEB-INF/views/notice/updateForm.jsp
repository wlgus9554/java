<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글수정</title>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	
	// 날짜 입력 설정 - datepicker : 전체 날짜 입력 형태
	let now = new Date();
    let startYear = now.getFullYear();
    let yearRange = startYear +":" + (startYear + 10) ;
	$(".datepicker").datepicker({
		// 입력란의 데이터 포맷 
		dateFormat: "yy-mm-dd",
		// 월 선택 입력 추가
		changeMonth: true,
		// 년 선택 입력 추가
		changeYear: true,
		// 월 선택할 때의 이름 - 원래는 영어가 기본
		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		// 달력의 요일 표시
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		// 선택 년도의 범위 - 현재 부터 10년 이후까지 년도 검색
		yearRange: yearRange,
	});
	
	   $("#startDate").datepicker("option",
	   {
	      "minDate" : now,
	      onClose : function( selectedDate ) {
	    	  if($(this).val() != "")
	         	$( "#endDate" ).datepicker( "option", "minDate", selectedDate );
	      }
	   });
	   
		$("#endDate").datepicker("option", 
	   {
	      "minDate" : now,
	      onClose : function( selectedDate ) {
	    	  if($(this).val() != "")
	         	$( "#startDate" ).datepicker( "option", "maxDate", selectedDate );
	      }
	   });
	
}); // $(function())의 끝
</script>
</head>
<body>
<div class="container">
	<form action="update.do" method="post">
		<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<input type="hidden" name="key" value="${param.key }">
		<input type="hidden" name="word" value="${param.word }">
		<h1>공지사항 글수정</h1>
		<table class="table">
			<!-- tr : table row - 테이블 한줄 -->
			<tr>
				<th>번호</th>
				<td>
					<input id="no" name="no" readonly value="${vo.no }"
					 class="form-control">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input id="title" name="title" required 
						class="form-control" maxlength="100"
						pattern="^[^ .].{2,99}$" value="${vo.title }"
						title="맨앞에 공백문자 불가. 3~100자 입력"
						placeholder="제목 입력 : 3자 이상 100자 이내"
					>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" id="content" name="content"  required
					rows="7" placeholder="첫글자는 공백문자나 줄바꿈을 입력할 수 없습니다."
					>${vo.content }</textarea>
				</td>
			</tr>
			<tr>
			    <th>게시일</th>
			    <td>
					<input id="startDate" name="startDate" required autocomplete="off"
						class="form-control datepicker" value="${vo.startDate }"
					>
				</td>
		  	</tr>
		  	<tr>
			    <th>종료일</th>
			    <td>
					<input id="endDate" name="endDate" required autocomplete="off"
						class="form-control datepicker" value="${vo.endDate }"
					>
				</td>
		  	</tr>
			<tr>
				<td colspan="2">
					<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
					<button class="btn btn-primary">수정</button>
					<button type="reset" class="btn btn-secondary">다시입력</button>
					<button type="button" onclick="history.back();" class="btn btn-warning">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>