package com.webjjang.main.controller;

import com.webjjang.board.controller.BoardController;
import com.webjjang.member.controller.MemberController;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.notice.controller.NoticeController;
import com.webjjang.util.io.In;

public class Main {

	// login 변수 안에 데이터 있으면(null이 아니면) 로그인 한 상태
	// login 변수 안에 데이터 없으면(null이면) 로그인 안한 상태
	public static LoginVO login = null;
	
	public static void loginInfo() {
		System.out.println();
		System.out.println("<<<---- Login Infomation ---->>>");
		System.out.println("//////////////////////////////////////////////////////");
		if(login == null) { // 로그인이 안된 경우
			System.out.println("//  로그인이 되어 있지 않습니다.");
			System.out.println("//  로그인을 하려면 5. 회원관리에서 1. 로그인 메뉴를 선택하세요.");
		} else { // 로그인이 된 경우
			System.out.println("//  " + login.getName() + "(" + login.getId()
			+ ")님은");
			System.out.println("//  " + login.getGradeName() + "(으)로 로그인 되었습니다.");
			System.out.println("//  당신에게 온 새로운 메시지는 " 
			+ login.getNewMsgCnt() + "개 입니다.");			
		}
		System.out.println("//////////////////////////////////////////////////////");
	}
	
	// 프로젝트의 시작되는 지점.
	public static void main(String[] args) throws ClassNotFoundException {
		// 인사
		System.out.println("===============================================");
		System.out.println("== 웹짱 닷컴에 오신 것을 환영 합니다. 좋은 시간 보내세요. ==");
		System.out.println("===============================================");
		
		// 드라이버 확인 -> DB 관련 static 프로그램이 로딩된다. 
		Class.forName("com.webjjang.util.db.DB");
		
		// 무한 반복 - 메뉴
		while(true) {
			Main.loginInfo();
			System.out.println();
			System.out.println("<<<-----[ Main Menu ]----->");
			// 메뉴 출력 - 공지사항, 쇼핑몰, 일반 게시판, 사진 게시판, 회원관리
			System.out.println("*************************************");
			System.out.println("** 1. 공지사항, 2. 쇼핑몰, 3. 일반 게시판 **");
			System.out.println("** 4. 사진 게시판, 5. 회원관리, 0. 종료   **");
			System.out.println("*************************************");
			// 메뉴 선택 입력
			String menu = In.getStr("메뉴");
			// 메뉴 처리 -> BoardController 로 이동. execute() 호출
			// - 0을 입력하면 종료 인사 -> 종료
			switch (menu) {
			case "1": 
				System.out.println("1. 공지사항");
				// 생성하고 호출한다.
				new NoticeController().execute();
				break;
			case "2": 
				System.out.println("2. 쇼핑몰");
				break;
			case "3": 
				System.out.println("3. 일반 게시판");
				// 생성하고 호출한다. - 1번만 실행한다. : 변수 사용하지 않아도 된다. new하고 바로 실행
//				new BoardController().execute();
				break;
			case "4": 
				System.out.println("4. 사진 게시판");
				break;
			case "5": 
				System.out.println("5. 회원관리");
				new MemberController().execute();
				break;
			case "0": 
				System.out.println("0. 종료");
				// 종료 인사.
				System.out.println("===================================================");
				System.out.println("== 좋은 시간 되셨나요. 불편사항이 있으면 게시판에 등록해 주세요. ==");
				System.out.println("== 시스템을 종료합니다. Bye~! Bye~!                    ==");
				System.out.println("====================================================");
				System.exit(0);
			default:
				System.out.println("####################################");;
				System.out.println("## 잘못된 메뉴를 선택하셨습니다.          ##");;
				System.out.println("## [0~5, 0] 중에서 입력하셔야 합니다.    ##");;
				System.out.println("####################################");;
			}
		}
	}
	
}
