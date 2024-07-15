package com.webjjang.boardreply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.service.BoardWriteService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.boardreply.vo.BoardReplyVO;
import com.webjjang.main.controller.Init;
import com.webjjang.util.page.PageObject;
import com.webjjang.util.page.ReplyPageObject;
import com.webjjang.util.exe.Execute;


// Board Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class BoardReplyController {

	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute() --------------------------");
		HttpSession session = request.getSession();
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		
		String jsp = null;
		
		
		// 입력 받는 데이터 선언
		Long no = 0L;
		
		try { // 정상 처리
			
			// 페이지 정보 받기 & uri에 붙이기
			ReplyPageObject pageObject
			= ReplyPageObject.getInstance(request);
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/boardreply/write.do":
				System.out.println("1.일반게시판 댓글 등록 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				String pw = request.getParameter("pw");
				
				// 변수 - vo 저장하고 Service
				BoardReplyVO vo = new BoardReplyVO();
				vo.setNo(pageObject.getNo());
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				// [BoardController] - BoardWriteService - BoardDAO.write(vo)
				Execute.execute(Init.get(uri), vo);
				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				// 
				jsp = "redirect:/board/view.do?no=" + pageObject.getNo()
					+ "&inc=0"
					// 일반게시판의 페이지 & 검색 정보 붙이기
					+ "&" + pageObject.getPageObject().getPageQuery();
					
					session.setAttribute("msg", "댓글 등록이 성공적으로 되었습니다.");
					
				
				break;
			case "/boardreply/update.do":
				System.out.println("2.일반게시판 댓글 수정 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				Long rno = Long.parseLong(request.getParameter("rno"));
				content = request.getParameter("content");
				writer = request.getParameter("writer");
				pw = request.getParameter("pw");
				
				// 변수 - vo 저장하고 Service
				vo = new BoardReplyVO();
				vo.setRno(rno);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				
				
				// DB 적용하는 처리문 작성. BoardUpdateservice
				Execute.execute(Init.get(uri), vo);
				
				// 글보기로 자동 이동 -> jsp 정보를 작성해서 넘긴다.
				jsp = "redirect:/board/view.do?no=" + pageObject.getNo() + "&inc=0"
						+ "&" + pageObject.getPageObject().getPageQuery();
				session.setAttribute("msg", "댓글 수정이 성공적으로 되었습니다.");
				break;
			case "/boardreply/delete.do":
				System.out.println("3.일반게시판 댓글 삭제");
				// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
				
				rno = Long.parseLong(request.getParameter("rno"));
				pw = request.getParameter("pw");
				
				BoardReplyVO deleteVO = new BoardReplyVO();
				deleteVO.setRno(rno);
				deleteVO.setPw(pw);
				
				// DB 처리
				Execute.execute(Init.get(uri), deleteVO);
				System.out.println();
				System.out.println("***************************");
				System.out.println("**  " + deleteVO.getNo()+ "글이 삭제되었습니다.  **");
				System.out.println("***************************");
				
				jsp = "redirect:/board/view.do?no=" + pageObject.getNo() + "&inc=0"
						// 일반 게시판의 페이지 & 검색 정보
						+ "&" + pageObject.getPageObject().getPageQuery()
						// 일반 게시판 댓글의 페이지
						+ "&" + pageObject.getPageQuery();
						
				session.setAttribute("msg", "댓글 삭제가 성공적으로 되었습니다.");
				
				break;
			case "0":
				
			default:
				System.out.println("####################################");;
				System.out.println("## 잘못된 메뉴를 선택하셨습니다.          ##");;
				System.out.println("## [0~5, 0] 중에서 입력하셔야 합니다.    ##");;
				System.out.println("####################################");;
				break;
			} // end of switch
		} catch (Exception e) {
			// TODO: handle exception
			// e.printStackTrace();
			System.out.println();
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			System.out.println("$%@ << 오류 출력 >>                         $%@");
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			System.out.println("$%@ 타입 : " + e.getClass().getSimpleName());
			System.out.println("$%@ 내용 : " + e.getMessage());
			System.out.println("$%@ 조치 : 데이터를 확인 후 다시 실행해 보세요.");
			System.out.println("$%@     : 계속 오류가 나면 전산담당자에게 연락하세요.");
			System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
		} // end of try~catch
		return jsp;
	} // end of execute()
	
} // end of class
