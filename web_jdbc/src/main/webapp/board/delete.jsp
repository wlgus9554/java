<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.webjjang.board.service.BoardDeleteService"%>
<%@page import="com.webjjang.util.exe.Execute"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%
System.out.println("delete.jsp------------");

// 한글 처리
request.setCharacterEncoding("utf-8");

// 데이터 수집
String noStr = request.getParameter("no");
String pw = request.getParameter("pw");
System.out.println("no = " + noStr + ", pw = " + pw);

// BoardVO 객체에 데이터 설정
BoardVO vo = new BoardVO();
vo.setNo(Long.parseLong(noStr));
vo.setPw(pw);

// BoardDeleteService를 호출하여 데이터베이스에서 삭제
try {
    Execute.execute(new BoardDeleteService(), vo);
    System.out.println("삭제 완료!");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>");
    out.println("alert('삭제 중 오류가 발생했습니다. 다시 시도해주세요.');");
    out.println("history.back();");
    out.println("</script>");
    return;
}

// 자동으로 리스트로 이동시킨다.
response.sendRedirect("list.jsp");
%>
