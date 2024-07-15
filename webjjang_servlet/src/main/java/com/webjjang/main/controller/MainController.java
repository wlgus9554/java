package com.webjjang.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webjjang.member.vo.LoginVO;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.exe.Execute;

// Main Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class MainController {

	public String execute(HttpServletRequest request) {
		System.out.println("MainController.execute() --------------------------");
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		
		String jsp = null;
		
		HttpSession session = request.getSession();
		
		int gradeNo = 0;
		
		LoginVO login = (LoginVO) session.getAttribute("login");
		
		if(login != null) {
			gradeNo = login.getGradeNo();
		}
				
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/main/main.do":
				System.out.println("1. 메인처리");
				// 페이지 처리를 위한 객체
				// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
				PageObject pageObject = new PageObject();
				
				if(gradeNo == 9) {
					pageObject.setPeriod("all");
				} else {
					pageObject.setPeriod("pre");
				}
				// 메인에 표시할 데이터 - 공지사항 / 일반 게시판 / 이미지
				// DB에서 데이터 가져오기 
				// 공지사항
				pageObject.setPerPageNum(7);
				// [MainController] - (Execute) - NoticeListService - NoticeDAO.list()
				result = Execute.execute(Init.get("/notice/list.do"), pageObject);
				request.setAttribute("noticeList", result);
				
				// 메인에 표시할 데이터 - 일반 게시판 / 이미지
				// DB에서 데이터 가져오기 
				// 일반 게시판
				pageObject.setPerPageNum(7);
				// [MainController] - (Execute) - BoardListService - BoardDAO.list()
				result = Execute.execute(Init.get("/board/list.do"), pageObject);
				request.setAttribute("boardList", result);
				
				// 이미지 게시판
				pageObject.setPerPageNum(6);
				// [MainController] - (Execute) - ImageListService - ImageDAO.list()
				result = Execute.execute(Init.get("/image/list.do"), pageObject);
				request.setAttribute("imageList", result);
				
				// /WEB-INF/views/ + board/list + .jsp
				jsp = "main/main";
				break;
				
			default:
				jsp = "error/404";
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			
			// 예외객체를 jsp에서 사용하기 위해 request에 담는다.
			request.setAttribute("e", e);
			
			jsp = "error/500";
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
