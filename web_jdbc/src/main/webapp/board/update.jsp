<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.webjjang.board.service.BoardUpdateService"%>
<%@page import="com.musaic.util.exe.Execute"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%
System.out.println("update.jsp------------");

// 한글 처리
request.setCharacterEncoding("utf-8");

// 데이터 수집
String noStr = request.getParameter("no");
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String pw = request.getParameter("pw");

System.out.println("no = " + noStr);
System.out.println("title = " + title);
System.out.println("content = " + content);
System.out.println("writer = " + writer);
System.out.println("pw = " + pw);

// 데이터 유효성 검사 (필요에 따라 추가 가능)

// BoardVO 객체에 데이터 설정
BoardVO vo = new BoardVO();
vo.setNo(Long.parseLong(noStr));
vo.setTitle(title);
vo.setContent(content);
vo.setWriter(writer);
vo.setPw(pw);

// BoardUpdateService를 호출하여 데이터베이스 업데이트
Execute.execute(new BoardUpdateService(), vo);

System.out.println("수정 완료!");

// 자동으로 글보기로 이동시킨다.
response.sendRedirect("view.jsp?no=" + noStr + "&inc=0");
%>
