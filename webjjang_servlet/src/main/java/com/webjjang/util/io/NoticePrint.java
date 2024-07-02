package com.webjjang.util.io;

import java.util.List;

import com.webjjang.notice.vo.NoticeVO;

public class NoticePrint {

	// 게시판 리스트 출력 메서드
	public void print(List<NoticeVO> list) {
		System.out.println();
		System.out.println("<<<---- 공지사항 리스트 ---->>>");
		System.out.println("+-----------------------------------------------+");
		System.out.println(" 글번호 /      제목     /  시작일  /  종료일  / 수정일 ");
		System.out.println("+-----------------------------------------------+");
		if(list == null) { // 데이터가 없으면 null 이 된다.
			System.out.println("*** 데이터가 존재하지 않습니다.   ***");
		} else {
			for(NoticeVO vo : list) {
				System.out.print(" " + vo.getNo());
				System.out.print(" / " + vo.getTitle());
				System.out.print(" / " + vo.getStartDate());
				System.out.print(" / " + vo.getEndDate());
				System.out.print(" / " + vo.getUpdateDate());
				System.out.println();
			}
		}
		System.out.println("+-----------------------------------------------+");
	}
	
	// 게시판 글보기 출력 메서드
	public void print(NoticeVO vo) {
		System.out.println();
		System.out.println("<<<---- 공지사항 글보기 ---->>>");
		System.out.println("+-----------------------------------------------+");
		System.out.println("+ 글번호 : " + vo.getNo());
		System.out.println("+ 제목 : " + vo.getTitle());
		System.out.println("+ 내용 : " + vo.getContent());
		System.out.println("+ 시작일 : " + vo.getStartDate());
		System.out.println("+ 종료일 : " + vo.getEndDate());
		System.out.println("+ 수정일 : " + vo.getUpdateDate());
		System.out.println("+ 작성일 : " + vo.getWriteDate());
		System.out.println("+-----------------------------------------------+");
		
	}
	
}
