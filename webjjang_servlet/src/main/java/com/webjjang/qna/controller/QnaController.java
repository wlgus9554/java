package com.webjjang.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.controller.Init;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.qna.vo.QnaVO;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
import com.webjjang.util.exe.Execute;


// Board Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class QnaController {

	public String execute(HttpServletRequest request) {
		System.out.println("QnaController.execute() --------------------------");
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		
		String jsp = null;
		
		HttpSession session = request.getSession();
		
		LoginVO login = (LoginVO) session.getAttribute("login");
		
		String id = null;
		
		if(login != null) id = login.getId();
		
		// 입력 받는 데이터 선언
		Long no = 0L;
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/qna/list.do":
				// [QnaController] - (Execute) - QnaListService - QnaDAO.list()
				System.out.println("1.질문답변 리스트");
				// 페이지 처리를 위한 객체
				// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
				PageObject pageObject = PageObject.getInstance(request);
				// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
				result = Execute.execute(Init.get(uri), pageObject);
				
				// pageObject 데이터 확인
				System.out.println("QnaController.execute().pageObject = " + pageObject);
				// 가져온 데이터 request에 저장 -> jsp까지 전달된다.
				request.setAttribute("list", result);
				// pageObject 담기
				request.setAttribute("pageObject", pageObject);
				// /WEB-INF/views/ + Qna/list + .jsp
				jsp = "qna/list";
				break;
			case "/board/view.do":
				System.out.println("2.일반게시판 글보기");
				// 1. 조회수 1증가(글보기), 2. 일반게시판 글보기 데이터 가져오기 : 글보기, 글수정
				// 넘어오는 글번호와 조회수 1증가를 수집한다.(request에 들어 있다.)
				String strNo = request.getParameter("no");
				no = Long.parseLong(strNo);
				String strInc = request.getParameter("inc");
				Long inc = Long.parseLong(strInc);
				// 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map
				result = Execute.execute(Init.get(uri),
						new Long[]{no, inc});
				// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
				request.setAttribute("vo", result);
				
				// 댓글 페이지 객체
				// 데이터 전달 - page / perPageNum / no / replyPage / replyPerPageNum 
				ReplyPageObject replyPageObject 
					= ReplyPageObject.getInstance(request);
				// 가져온 댓글 데이터 request에 담기
				request.setAttribute("replyList",
						Execute.execute(Init.get("/boardreply/list.do"),replyPageObject));
				// 댓글 페이지 객체 담기
				request.setAttribute("replyPageObject", replyPageObject);
				
				jsp = "board/view";
				break;
			case "/qna/questionForm.do":
				System.out.println("3-1.질문하기 등록 폼");
				
				request.setAttribute("headTitle", "질문하기 폼");
				
				jsp="qna/writeForm";
				break;
				
			case "/qna/answerForm.do":
				System.out.println("3-2.답변하기 등록 폼");
				
				request.setAttribute("headTitle", "답변하기 폼");
				
				// 넘어온 글번호에 따른 데이터를 가져와서 request에 저장한다.
				
				jsp="qna/writeForm";
				break;
				
			case "/qna/write.do":
				System.out.println("3-3. 질문답변 등록 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String strRefNo = request.getParameter("refNo");
				Long ordNo = Long.parseLong(request.getParameter("ordNo"));
				Long levNo = Long.parseLong(request.getParameter("levNo"));
				String strParentNo = request.getParameter("parentNo");
				
				// 변수 - vo 저장하고 Service
				QnaVO vo = new QnaVO();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setId(id);
				vo.setOrdNo(ordNo);
				vo.setLevNo(levNo);
				// 답변인 경우의 처리
				if(strRefNo != null && !strRefNo.equals("")) {
					vo.setRefNo(Long.parseLong(strRefNo));
					vo.setQuestion(false); // 답변
				} else {
					vo.setQuestion(true); // 질문이다.
				}
				// 넘길 때 no를 parentNo로 넘김.
				if(strParentNo != null && !strParentNo.equals(""))
					vo.setParentNo(Long.parseLong(strParentNo));
				
				// [QnaController] - QnaWriteService - QnaDAO.write(vo)
				Execute.execute(Init.get(uri), vo);
				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				jsp = "redirect:list.do?perPageNum=" 
						+ request.getParameter("perPageNum");
				
				break;
			case "/board/updateForm.do":
				System.out.println("4-1.일반게시판 글수정 폼");
				
				// 사 -> 서버 : 글번호
				no = Long.parseLong(request.getParameter("no"));
				
				// no맞는 데이터 DB에서 가져온다. BoardViewService
				result = Execute.execute(Init.get("/board/view.do"),
						new Long[]{no, 0L});
				// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
				request.setAttribute("vo", result);
				
				// jsp 정보
				jsp = "board/updateForm";
				
				break;
			case "/board/update.do":
				System.out.println("4-2.일반게시판 글수정 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				no = Long.parseLong(request.getParameter("no"));
				title = request.getParameter("title");
				content = request.getParameter("content");
				
//				// 변수 - vo 저장하고 Service
//				BoardVO vo = new BoardVO();
//				vo.setNo(no);
//				vo.setTitle(title);
//				vo.setContent(content);
//				vo.setWriter(writer);
//				vo.setPw(pw);
				
				// DB 적용하는 처리문 작성. BoardUpdateservice
//				Execute.execute(Init.get(uri), vo);
				
				// 페이지 정보 받기 & uri에 붙이기
				pageObject = PageObject.getInstance(request);
				// 글보기로 자동 이동 -> jsp 정보를 작성해서 넘긴다.
				jsp = "redirect:view.do?no=" + no + "&inc=0"
						+ "&" + pageObject.getPageQuery();
				break;
			case "/board/delete.do":
				System.out.println("5.일반게시판 글삭제");
				// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
				
				no = Long.parseLong(request.getParameter("no"));
				
				BoardVO deleteVO = new BoardVO();
				deleteVO.setNo(no);
				
				// DB 처리
				Execute.execute(Init.get(uri), deleteVO);
				System.out.println();
				System.out.println("***************************");
				System.out.println("**  " + deleteVO.getNo()+ "글이 삭제되었습니다.  **");
				System.out.println("***************************");
				
				jsp = "redirect:list.do?perPageNum=" 
						+ request.getParameter("perPageNum");
				
				break;
				
		    default:
	            jsp = "error/404";
	            break;
	         } // end of switch
	      } catch (Exception e) {
	         // e.printStackTrace();
	         // 예외 객체를 jsp에서 사용하기 위해 request에 담는다.
	         request.setAttribute("e", e);
	         jsp = "error/500";
	      } // end of try~catch
	      return jsp;
	} // end of execute()
	
} // end of class
