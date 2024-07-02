<%@page import="com.webjjang.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("login.jsp -------------------");
	// DB에서 가져오기를 해야 한다.(DAO) -> 하드코딩 중.
	LoginVO vo = new LoginVO();
	vo.setId("test");
	vo.setName("홍길동");
	vo.setPhoto("/upload/member/test.jsp");
	vo.setGradeNo(1);
	vo.setGradeName("일반회원");
	vo.setNewMsgCnt(5L);
	// 로그인 처리 - 가져온 정보를 세션에 담는다.
	// 정해진 공간에 데이터 존재하면 로그인, 존재하지 않으면 로그아웃
	session.setAttribute("login", vo);
	
	// main으로 자동 이동
	response.sendRedirect("main.jsp");
%>
