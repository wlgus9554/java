<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.webjjang.board.service.BoardWriteService"%>
<%@page import="com.musaic.util.exe.Execute"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%
System.out.println("write.jsp------------");

// 한글 처리
request.setCharacterEncoding("utf-8");

// 데이터 수집
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String pw = request.getParameter("pw");
String pw2 = request.getParameter("pw2");

// 비밀번호 일치 여부 확인
if (!pw.equals(pw2)) {
    // 비밀번호 불일치 시 에러 메시지 출력 및 이전 페이지로 이동
    out.println("<script>");
    out.println("alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');");
    out.println("history.back();");
    out.println("</script>");
    return;
}

System.out.println("title = " + title);
System.out.println("content = " + content);
System.out.println("writer = " + writer);
System.out.println("pw = " + pw);

// BoardVO 객체에 데이터 설정
BoardVO vo = new BoardVO();
vo.setTitle(title);
vo.setContent(content);
vo.setWriter(writer);
vo.setPw(pw);

// BoardWriteService를 호출하여 데이터베이스에 저장
Execute.execute(new BoardWriteService(), vo);

System.out.println("글 등록 완료!");

// 글 목록 페이지로 이동
response.sendRedirect("list.jsp");
%>
