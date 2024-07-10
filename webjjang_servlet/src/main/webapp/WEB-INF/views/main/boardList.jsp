<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

   <h3>일반 게시판 리스트</h3>
   <table class="table">
      <!-- tr : table row - 테이블 한줄 -->
      <!-- 게시판 데이터의 제목 -->
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
      </tr>
      <!-- 실제적인 데이터 표시 : 데이터가 있는 만큼 줄(tr)이 생긴다. -->
      <!-- JS로 글보기로 페이지 이동
         onclick : click 이벤트 핸들러 속성 -->
      <c:forEach items="${boardList }" var="vo">
         <tr class="dataRow">
            <!-- td : table data - 테이블 데이터 텍스트 -->
            <td class="no">${vo.no}</td>
            <td>${vo.title}</td>
            <td>${vo.writer }</td>
            <td>${vo.writeDate}</td>
         </tr>
      </c:forEach>
	</table>