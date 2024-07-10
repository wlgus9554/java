<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<style type="text/css">
.dataRow:hover{
	background: #e0e0e0;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	
	// 회원 한줄을 클릭하면 회원 정보보기로 이동 시키는 처리
	function dataRowClick(){
		alert("dataRow click");
	}
	
	// 이벤트처리
	$(".dataRow").on("click", function(){
		dataRowClick();
	});
	
	$(".grade, .status").parent()
	.on("mouseover", function(){
		// dataRow의 click 이벤트를 없앤다.
		$(".dataRow").off("click");
	})
	.on("mouseout", function(){
		// dataRow의 click 이벤트를 다시 설정해준다..
		$(".dataRow").on("click", function(){
			dataRowClick()
		});
	});
	
	// ".dataRow" 클래스 내의 ".grade" 또는 ".status" 클래스가 변경될 때 실행되는 이벤트 핸들러 정의
	$(".dataRow").on("change", ".grade, .status", function(){
		// 변경된 요소의 값을 가져옴
		let changeData =  $(this).val();
		// data-data 속성의 값을 가져옴
		let data = $(this).data("data"); // data-data 속성으로 넣어둔다.
		// 콘솔에 원래 데이터와 변경된 데이터를 출력
		console.log("원래 데이터=" + data + ", 바꿀 데이터=" + changeData);
		// 변경된 값이 원래 값과 같다면
		if(changeData == data)
			// 다음 형제 요소(주로 div 태그)의 자식 요소 중 버튼을 찾아 비활성화
			$(this).next().find("button").prop("disabled", true);
		// 변경된 값이 원래 값과 다르다면
		else
			// 다음 형제 요소(주로 div 태그)의 자식 요소 중 버튼을 찾아 활성화
			$(this).next().find("button").prop("disabled", false);
	});

	// 폼 제출 시 유효성 검사
	$("form[action='changeGrade.do']").on("submit", function(){
	    // 현재 폼 내에서 .grade 클래스가 있는 선택 요소를 찾음
	    let gradeSelect = $(this).find(".grade");
	    // 현재 행(dataRow)에서 .status 클래스가 있는 선택 요소를 찾음
	    let statusSelect = $(this).closest(".dataRow").find(".status");

	    // 등급 선택 요소의 값을 가져옴
	    let gradeValue = gradeSelect.val();
	    // 상태 선택 요소의 값을 가져옴
	    let statusValue = statusSelect.val();

	    // 등급이 "9"(관리자)로 변경되었고 상태가 "정상"이 아닌 경우
	    if(gradeValue == "9" && statusValue != "정상") {
	        // 폼 제출을 막음
	        event.preventDefault();
	        // 경고 메시지를 표시함
	        alert("상태가 정상인 경우에만 관리자로 변경할 수 있습니다.");
	    }
	});


});
</script>
</head>
<body>
<div class="container">
	<h2>회원 리스트</h2>
	<table class="table">
		<thead>
			<tr>
				<th>사진</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>등급</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td>
						<c:if test="${ !empty vo.photo }">
							<img src="${vo.photo }" style="width: 30px; height: 30px;">
						</c:if>
						<c:if test="${ empty vo.photo }">
							<i class="fa fa-user-circle-o" style="font-size:30px"></i>
						</c:if>
					</td>
					<td class="id">${vo.id }</td>
					<td>${vo.name }</td>
					<td>${vo.gender }</td>
					<td>${vo.birth }</td>
					<td>${vo.tel }</td>
					<td>
						<form action="changeGrade.do">
						<input name="id" value="${vo.id }" type="hidden">
							<div class="input-group mb-3">
							  <select class="form-control grade" 
							   name="gradeNo" data-data="${vo.gradeNo }">
							  	<option value="1" ${(vo.gradeNo == 1)?"selected":"" }>일반회원</option>
							  	<option value="9" ${(vo.gradeNo == 9)?"selected":"" }>관리자</option>
							  </select>
							  <div class="input-group-append">
							    <button class="btn btn-success" type="submit" disabled>변경</button>
							  </div>
							</div>
						</form>
					</td>
					<td>
						<form action="changeStatus.do">
						<input name="id" value="${vo.id }" type="hidden">
							<div class="input-group mb-3">
							  <select class="form-control status" 
							  name="status" data-data="${vo.status }">
							  	<option ${(vo.status == "정상")?"selected":"" }>정상</option>
							  	<option ${(vo.status == "탈퇴")?"selected":"" }>탈퇴</option>
							  	<option ${(vo.status == "휴면")?"selected":"" }>휴면</option>
							  	<option ${(vo.status == "강퇴")?"selected":"" }>강퇴</option>
							  </select>
							  <div class="input-group-append">
							    <button class="btn btn-success" type="submit" disabled>변경</button>
							  </div>
							</div>
						</form>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>