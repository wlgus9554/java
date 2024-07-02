package com.webjjang.board.controller;

import java.util.List;

import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.service.BoardWriteService;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.io.BoardPrint;
import com.webjjang.util.io.In;

// Board Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class BoardController {

	public void execute() {
		// 게시판 기능 무한 반복
		while(true) { // 반복문
			// 모듈 이름 출력
			System.out.println();
			System.out.println("<<---- 일반 게시판 ---->");
			// 메뉴 출력
			// 메뉴 출력 - 리스트, 글보기, 글등록, 글수정, 글삭제
			System.out.println("*************************************");
			System.out.println("** 1. 리스트, 2. 글보기, 3. 글등록     **");
			System.out.println("** 4. 글수정, 5. 글삭제, 0. 이전 메뉴   **");
			System.out.println("*************************************");

			// 메뉴 입력
			String menu = In.getStr("메뉴");
			
			Object result = null;
			
			// 입력 받는 데이터 선언
			Long no = 0L;
			
			try { // 정상 처리
			
				// 메뉴 처리 : CRUD DB 처리 - Controller - Service - DAO
				switch (menu) {
				case "1":
					// [BoardController] - (Execute) - BoardListService - BoardDAO.list()
					System.out.println("1.일반게시판 리스트");
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<BoardVO>
					result = Execute.execute(new BoardListService(), null);
					// 가져온 데이터 출력하기
					new BoardPrint().print((List<BoardVO>) result);
					break;
				case "2":
					System.out.println("2.일반게시판 글보기");
					// 1. 조회수 1증가(글보기), 2. 일반게시판 글보기 데이터 가져오기 : 글보기, 글수정
					// 사용자가 보고 싶은 글번호를 입력한다.
					no = In.getLong("글번호");
					System.out.println(no);
					// 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map
					result = Execute.execute(new BoardViewService(),
							new Long[]{no, 1L}); // no 가 0번쨰 1L이 1번째
					// 게시판 글보기 출력 : BoardPrint
					new BoardPrint().print((BoardVO)result);
					break;
				case "3":
					System.out.println("3.일반게시판 글등록");
					
					// 데이터 수집 - 사용자 : 제목 / 내용 / 작성자 /비밀번호
					String title = In.getStr("제목");
					String content = In.getStr("내용");
					String writer = In.getStr("작성자");
					String pw = In.getStr("비밀번호");
					
					// 변수 - vo 저장하고 Service
					BoardVO vo = new BoardVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setWriter(writer);
					vo.setPw(pw);
					
					// [BoardController] - BoardWriterService - BoardDAO.wrtie(vo)
					Execute.execute(new BoardWriteService(),vo);										
					break;
				case "4":
					System.out.println("4.일반게시판 글수정");
					
					// 수정할 글번호를 받는다. - 데이터 수집
					no = In.getLong("글번호");
					// 수정할 데이터 가져오기 - 글보기 - BoardViewService
					BoardVO updateVO 
					= (BoardVO) Execute.execute(new BoardViewService(),new Long[]{no, 0L});
					// 가져온 데이터 수정하기 - 데이터 수집
					// while문의 라벨
					whileLoop:
					while(true) {
						new BoardPrint().print(updateVO);
						System.out.println();
						System.out.println("------------------------------------------------");
						System.out.println("1. 제목 2. 내용 3. 작성자 9. 수정 취소 0. 수정 완료");
						System.out.println("------------------------------------------------");
						String item = In.getStr("수정 항목 선택");
						switch (item) {
						case "1": {
							updateVO.setTitle(In.getStr("제목"));
							break;
						}
						case "2": {
							updateVO.setContent(In.getStr("내용"));
							break;
						}
						case "3": {
							updateVO.setWriter(In.getStr("작성자"));
							break;
						}
						case "9": {
							System.out.println();
							System.out.println("*** 수정이 취소 되었습니다. ***");
							break whileLoop;
						}
						case "0": {
							// 비밀번호 입력
							updateVO.setPw(In.getStr("수정을 위한 비밀번호 입력"));
							// DB 적용하는 처리문 작성. BoardUpdateservice
							Execute.execute(new BoardUpdateService(), updateVO);
							break whileLoop;
						}
						
						default:
							System.out.println("**************************************");
							System.out.println("******잘못된 항목 번호를 선택하셨습니다.******");
							System.out.println("****[1~3, 9, 0] 번호를 선택하셔야 합니다****");
							System.out.println("**************************************");
						}
					} // end of while
					// DB에 데이터 수정하기 - BoardUpdateService
					
					break;
				case "5":
					System.out.println("5.일반게시판 글삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호, 비밀번호 - BoardVO
					BoardVO deleteVO = new BoardVO();
					deleteVO.setNo(In.getLong("삭제할 번호 입력"));
					deleteVO.setPw(In.getStr("본인확인용 비밀번호"));

					// DB처리
					Execute.execute(new BoardDeleteService(), deleteVO);
					System.out.println();
					System.out.println("***********************************************");
					System.out.println("****" + deleteVO.getNo() + "글이 삭제 되었습니다. *****");
					System.out.println("***********************************************");
					break;
				case "0":
					
					return;
	
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
		} // end of while
	} // end of main()
	
} // end of class
