package com.webjjang.ajax.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.service.BoardWriteService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.controller.Init;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.io.BoardPrint;
import com.webjjang.util.io.In;

// Member Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class AjaxController {

	public String execute(HttpServletRequest request) {
		System.out.println("MemberController.execute() --------------------------");
		
		// login된 정보 중에서 id를 많이 사용한다.
		String id = null;

		// uri
		String uri = request.getRequestURI();
		
		String jsp = null;
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/ajax/checkId.do":
				System.out.println("1. 아이디 중복 체크 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				id = request.getParameter("id");
				
				// [MemberController] 
				// - MemberCheckIdService - MemberDAO.checkId(id)
				id = (String) Execute.execute(Init.get(uri), id);
				
				request.setAttribute("id", id);
				
				// jsp 정보 
				jsp = "member/checkId";
				
				break;

			default:
				jsp="error/noModule_404";
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			request.setAttribute("e", e);
			
			jsp="error/noModule_500";
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
