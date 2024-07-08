package com.webjjang.member.controller;

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
public class MemberController {

	public String execute(HttpServletRequest request) {
		System.out.println("MemberController.execute() --------------------------");
		
		// 로그인 처리를 session으로 한다.
		HttpSession session = request.getSession();
		
		// login된 정보 중에서 id를 많이 사용한다.
		String id = null;
		LoginVO login = (LoginVO) session.getAttribute("login");
		// login이 되어 있는 경우만 id를 꺼내 온다.
		if(login != null) id = login.getId();
		
		// uri
		String uri = request.getRequestURI();
		
		Object result = null;
		
		String jsp = null;
		
		// 입력 받는 데이터 선언
		Long no = 0L;
		
		try { // 정상 처리
		
			// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
			switch (uri) {
			case "/member/loginForm.do":
				System.out.println("a. 로그인 폼");
				jsp="member/loginForm";
				break;
			case "/member/login.do":
				System.out.println("a-1. 로그인 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				id = request.getParameter("id");
				String pw = request.getParameter("pw");
				
				// 변수 - vo 저장하고 Service
				LoginVO loginVO = new LoginVO();
				loginVO.setId(id);
				loginVO.setPw(pw);
				
				// [MemberController] - MemberLoginService - MemberDAO.login(vo)
				// session에 데이터를 담아서 로그인 처리한다.
				session.setAttribute("login", 
						Execute.execute(Init.get(uri), loginVO));
				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				// 원래는 main이나 진행하려고 했던 uri로 이동시킨다.
				// 그러나 완성이 안되어 있어서 완성되어진 게시판 리스트로 보낸다.
				jsp = "redirect:/board/list.do";
				
				// 로그인 완료 메시지 처리
				session.setAttribute("msg", "로그인 처리가 되었습니다.");
				
				break;
			case "/member/list.do":
				// [BoardController] - (Execute) - BoardListService - BoardDAO.list()
				System.out.println("1.일반게시판 리스트");
				// 페이지 처리를 위한 객체
				// getInstance - 기본 값이 있고 넘어오는 페이지와 검색 정보를 세팅 처리
				PageObject pageObject = PageObject.getInstance(request);
				// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
				result = Execute.execute(Init.get(uri), pageObject);
				
				// pageObject 데이터 확인
				System.out.println("BoardController.execute().pageObject = " + pageObject);
				// 가져온 데이터 request에 저장 -> jsp까지 전달된다.
				request.setAttribute("list", result);
				// pageObject 담기
				request.setAttribute("pageObject", pageObject);
				// /WEB-INF/views/ + board/list + .jsp
				jsp = "board/list";
				break;
			case "/member/view.do":
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
						Execute.execute(Init.get("/memberreply/list.do"),replyPageObject));
				// 댓글 페이지 객체 담기
				request.setAttribute("replyPageObject", replyPageObject);
				
				jsp = "board/view";
				break;
			case "/member/writeForm.do":
				System.out.println("3-1.회원 가입 폼");
				jsp="member/writeForm";
				break;
			case "/member/write.do":
				System.out.println("3. 회원 가입 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				pw = request.getParameter("pw");
				
				// 변수 - vo 저장하고 Service
				BoardVO vo = new BoardVO();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				// [BoardController] - BoardWriteService - BoardDAO.write(vo)
				Execute.execute(Init.get(uri), vo);
				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				jsp = "redirect:list.do?perPageNum=" 
						+ request.getParameter("perPageNum");
				
				break;
				
			case "/member/checkId.do":
				System.out.println("3-3. 아이디 중복 체크 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				id = request.getParameter("id"); // 사용자가 입력한 아이디.
				
				// [MemberController] - MemberCheckIdService - MemberDAO.chechId(id)
				id = (String) Execute.execute(Init.get(uri), id); // 서버에서 가져온 아이디.
				
				request.setAttribute("id", id);
				
				// jsp 정보 앞에 "redirect:"가 붙어 있어 redirect를
				// 아니면 jsp로 forward로 시킨다.
				jsp = "member/chechId";
				
				break;
				
			case "/member/updateForm.do":
				System.out.println("4-1.일반게시판 글수정 폼");
				
				// 사 -> 서버 : 글번호
				no = Long.parseLong(request.getParameter("no"));
				
				// no맞는 데이터 DB에서 가져온다. BoardViewService
				result = Execute.execute(Init.get("/member/view.do"),
						new Long[]{no, 0L});
				// 가져온 데이터를 JSP로 보내기 위해서 request에 담는다.
				request.setAttribute("vo", result);
				
				// jsp 정보
				jsp = "board/updateForm";
				
				break;
			case "/member/update.do":
				System.out.println("4-2.일반게시판 글수정 처리");
				
				// 데이터 수집(사용자->서버 : form - input - name)
				no = Long.parseLong(request.getParameter("no"));
				title = request.getParameter("title");
				content = request.getParameter("content");
				writer = request.getParameter("writer");
				pw = request.getParameter("pw");
				
				// 변수 - vo 저장하고 Service
				vo = new BoardVO();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setPw(pw);
				
				// DB 적용하는 처리문 작성. BoardUpdateservice
				Execute.execute(Init.get(uri), vo);
				
				// 페이지 정보 받기 & uri에 붙이기
				pageObject = PageObject.getInstance(request);
				// 글보기로 자동 이동 -> jsp 정보를 작성해서 넘긴다.
				jsp = "redirect:view.do?no=" + no + "&inc=0"
						+ "&" + pageObject.getPageQuery();
				break;
			case "/member/delete.do":
				System.out.println("5.일반게시판 글삭제");
				// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
				
				no = Long.parseLong(request.getParameter("no"));
				pw = request.getParameter("pw");
				
				BoardVO deleteVO = new BoardVO();
				deleteVO.setNo(no);
				deleteVO.setPw(pw);
				
				// DB 처리
				Execute.execute(Init.get(uri), deleteVO);
				System.out.println();
				System.out.println("***************************");
				System.out.println("**  " + deleteVO.getNo()+ "글이 삭제되었습니다.  **");
				System.out.println("***************************");
				
				jsp = "redirect:list.do?perPageNum=" 
						+ request.getParameter("perPageNum");
				
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
