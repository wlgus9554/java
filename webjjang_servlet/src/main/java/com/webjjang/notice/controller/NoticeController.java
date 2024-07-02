package com.webjjang.notice.controller;

import java.util.List;

import com.webjjang.main.controller.Main;
import com.webjjang.notice.service.NoticeDeleteService;
import com.webjjang.notice.service.NoticeListService;
import com.webjjang.notice.service.NoticeUpdateService;
import com.webjjang.notice.service.NoticeViewService;
import com.webjjang.notice.service.NoticeWriteService;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.io.NoticePrint;
import com.webjjang.util.io.In;

// Notice Module 에 맞는 메뉴 선택 , 데이터 수집(기능별), 예외 처리
public class NoticeController {

	public void execute() {
		// 게시판 기능 무한 반복
		while(true) {
			// 로그인 정보 출력
			Main.loginInfo();
			// 모듈 이름 출력
			System.out.println();
			System.out.println("<<---- 공지사항 ---->");
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
					// [NoticeController] - (Execute) - NoticeListService - NoticeDAO.list()
					System.out.println("1.공지사항 리스트");
					// DB에서 데이터 가져오기 - 가져온 데이터는 List<NoticeVO>
					result = Execute.execute(new NoticeListService(), null);
					// 가져온 데이터 출력하기
					new NoticePrint().print((List<NoticeVO>) result);
					break;
				case "2":
					System.out.println("2.공지사항 글보기");
					// 1. 조회수 1증가(글보기), 2. 공지사항 글보기 데이터 가져오기 : 글보기, 글수정
					// 사용자가 보고 싶은 글번호를 입력한다.
					no = In.getLong("글번호");
					// 전달 데이터 - 글번호, 조회수 증가 여부(1:증가, 0:증가 안함) : 배열 또는 Map
					result = Execute.execute(new NoticeViewService(), no);
					// 게시판 글보기 출력 : NoticePrint
					new NoticePrint().print((NoticeVO)result);
					break;
				case "3":
					System.out.println("3.공지사항 글등록");
					
					// 데이터 수집 - 사용자 : 제목, 내용, 작성자, 비밀번호
					String title = In.getStr("제목");
					String content = In.getStr("내용");
					String startDate = In.getStr("시작일(YYYY-MM-DD)");
					String endDate = In.getStr("종료일(YYYY-MM-DD)");
					
					// 변수 - vo 저장하고 Service
					NoticeVO vo = new NoticeVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					
					// [NoticeController] - NoticeWriteService - NoticeDAO.write(vo)
					Execute.execute(new NoticeWriteService(), vo);
					
					break;
				case "4":
					System.out.println("4.공지사항 글수정");
					
					// 수정할 글번호를 받는다. - 데이터 수집
					no = In.getLong("글번호");
					
					// 수정할 데이터 가져오기 - 글보기 - NoticeViewService
					NoticeVO updateVO 
					= (NoticeVO) Execute.execute(new NoticeViewService(), no);
					
					// 가져온 데이터 수정하기 - 데이터 수집
					// while문의 라벨
					whileLoop:
					while(true) {
						new NoticePrint().print(updateVO);
						System.out.println();
						System.out.println("----------------------------------------------");
						System.out.println(" 1. 제목 2. 내용  3. 시작일  4. 종료일");
						System.out.println(" 9. 수정 취소 0. 수정 완료");
						System.out.println("----------------------------------------------");
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
							updateVO.setStartDate(In.getStr("시작일(YYYY-MM-DD)"));
							break;
						}
						case "4": {
							updateVO.setEndDate(In.getStr("종료일(YYYY-MM-DD)"));
							break;
						}
						case "9": {
							System.out.println();
							System.out.println("*** 수정의 취소 되었습니다. ****");
							break whileLoop;
						}
						case "0": {
							// DB 적용하는 처리문 작성. NoticeUpdateservice
							Execute.execute(new NoticeUpdateService(), updateVO);
							break whileLoop;
						}
						default:
							System.out.println("**********************************");;
							System.out.println("** 잘못된 항목 번호를 선택하셨습니다.    **");;
							System.out.println("** [1~3, 9, 0] 번호를 선택하셔야 합니다.*");;
							System.out.println("**********************************");;
						}
					}// end ofwhile
					// DB 에 데이터 수정하기 - NoticeUpdateService
					
					break;
				case "5":
					System.out.println("5.공지사항 글삭제");
					// 데이터 수집 - DB에서 실행에 필요한 데이터 - 글번호
					no = In.getLong("삭제할 글번호 입력");
					
					// DB 처리
					Execute.execute(new NoticeDeleteService(), no);
					System.out.println();
					System.out.println("***************************");
					System.out.println("**  " + no + " 글이 삭제되었습니다.  **");
					System.out.println("***************************");
					
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
