package com.webjjang.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.service.BoardDeleteService;
import com.webjjang.board.service.BoardListService;
import com.webjjang.board.service.BoardUpdateService;
import com.webjjang.board.service.BoardViewService;
import com.webjjang.board.service.BoardWriteService;
import com.webjjang.boardreply.dao.BoardReplyDAO;
import com.webjjang.boardreply.service.BoardReplyDeleteService;
import com.webjjang.boardreply.service.BoardReplyListService;
import com.webjjang.boardreply.service.BoardReplyUpdateService;
import com.webjjang.boardreply.service.BoardReplyWriteService;
import com.webjjang.image.dao.ImageDAO;
import com.webjjang.image.service.ImageChangeService;
import com.webjjang.image.service.ImageDeleteService;
import com.webjjang.image.service.ImageListService;
import com.webjjang.image.service.ImageUpdateService;
import com.webjjang.image.service.ImageViewService;
import com.webjjang.image.service.ImageWriteService;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.member.dao.MemberDAO;
import com.webjjang.member.service.MemberChangeGradeService;
import com.webjjang.member.service.MemberCheckIdService;
import com.webjjang.member.service.MemberConUpdateService;
import com.webjjang.member.service.MemberListService;
import com.webjjang.member.service.MemberLoginService;
import com.webjjang.member.service.MemberWriteService;
import com.webjjang.message.dao.MessageDAO;
import com.webjjang.message.service.MessageListService;
import com.webjjang.message.service.MessageWriteService;
import com.webjjang.notice.dao.NoticeDAO;
import com.webjjang.notice.service.NoticeDeleteService;
import com.webjjang.notice.service.NoticeListService;
import com.webjjang.notice.service.NoticeUpdateService;
import com.webjjang.notice.service.NoticeViewService;
import com.webjjang.notice.service.NoticeWriteService;
import com.webjjang.qna.dao.QnaDAO;
import com.webjjang.qna.service.QnaListService;
import com.webjjang.qna.service.QnaViewService;
import com.webjjang.qna.service.QnaWriteService;

public class Init {

	// service 생성해서 저장하는 객체 - <URI, service>
	private static Map<String, Service> serviceMap = new HashMap<>();
	// dao 생성해서 저장하는 객체 - <className, dao>
	private static Map<String, DAO> daoMap = new HashMap<>();
	
	// static 변수에 데이터를 초기화 시키는 1번만 실행되는 블록 -> 클래스가 불려지만 자동실행
	static {
		// ---- [일반 게시판 객체 생성과 조립 ] -----------------------
		// dao 생성
		daoMap.put("boardDAO", new BoardDAO());
		// service 생성
		serviceMap.put("/board/list.do", new BoardListService());
		serviceMap.put("/board/view.do", new BoardViewService());
		serviceMap.put("/board/write.do", new BoardWriteService());
		serviceMap.put("/board/update.do", new BoardUpdateService());
		serviceMap.put("/board/delete.do", new BoardDeleteService());
		// 조립 dao->service
		serviceMap.get("/board/list.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/view.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/write.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/update.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/delete.do").setDAO(daoMap.get("boardDAO"));
		
		// ---- [일반 게시판 댓글 객체 생성과 조립 ] -----------------------
		daoMap.put("replyBoardDAO", new BoardReplyDAO());
		
		serviceMap.put("/boardreply/list.do", new BoardReplyListService());
		serviceMap.put("/boardreply/write.do", new BoardReplyWriteService());
		serviceMap.put("/boardreply/update.do", new BoardReplyUpdateService());
		serviceMap.put("/boardreply/delete.do", new BoardReplyDeleteService());
		
		serviceMap.get("/boardreply/list.do").setDAO(daoMap.get("replyBoardDAO"));
		serviceMap.get("/boardreply/write.do").setDAO(daoMap.get("replyBoardDAO"));
		serviceMap.get("/boardreply/update.do").setDAO(daoMap.get("replyBoardDAO"));
		serviceMap.get("/boardreply/delete.do").setDAO(daoMap.get("replyBoardDAO"));

		// ---- [회원관리 객체 생성과 조립 ] -----------------------
		daoMap.put("memberDAO", new MemberDAO());
		
		serviceMap.put("/member/login.do", new MemberLoginService());
		serviceMap.put("/member/list.do", new MemberListService());
		serviceMap.put("/member/write.do", new MemberWriteService());
		serviceMap.put("/member/changeGrade.do", new MemberChangeGradeService());
		// MemberController에서 들어오지 않고 필터(UpdateConDateFilter)에서 들어온다.
		serviceMap.put("/member/updateConDate.do", new MemberConUpdateService());
		serviceMap.put("/ajax/checkId.do", new MemberCheckIdService());

		serviceMap.get("/member/login.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/list.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/write.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/changeGrade.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/updateConDate.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/ajax/checkId.do").setDAO(daoMap.get("memberDAO"));

		// ---- [이미지 게시판 객체 생성과 조립 ] -----------------------
		// dao 생성
		daoMap.put("imageDAO", new ImageDAO());
		// service 생성
		serviceMap.put("/image/list.do", new ImageListService());
		serviceMap.put("/image/view.do", new ImageViewService());
		serviceMap.put("/image/write.do", new ImageWriteService());
		serviceMap.put("/image/update.do", new ImageUpdateService());
		serviceMap.put("/image/delete.do", new ImageDeleteService());
		serviceMap.put("/image/changeImage.do", new ImageChangeService());
		// 조립 dao->service
		serviceMap.get("/image/list.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/view.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/write.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/update.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/delete.do").setDAO(daoMap.get("imageDAO"));
		serviceMap.get("/image/changeImage.do").setDAO(daoMap.get("imageDAO"));
		

		// ---- [공지사항 객체 생성과 조립 ] -----------------------
		daoMap.put("noticeDAO", new NoticeDAO());
		// 서비스생성 
		serviceMap.put("/notice/list.do", new NoticeListService());
		serviceMap.put("/notice/view.do", new NoticeViewService());
		serviceMap.put("/notice/write.do", new NoticeWriteService());
		serviceMap.put("/notice/update.do", new NoticeUpdateService());
		serviceMap.put("/notice/delete.do", new NoticeDeleteService());
		// 조립 dao->service
		serviceMap.get("/notice/list.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/view.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/write.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/update.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/delete.do").setDAO(daoMap.get("noticeDAO"));
		
		// ---- [질문답변 객체 생성과 조립 ] -----------------------
		daoMap.put("qnaDAO", new QnaDAO());
		// 서비스생성 
		serviceMap.put("/qna/list.do", new QnaListService());
		serviceMap.put("/qna/view.do", new QnaViewService());
		serviceMap.put("/qna/write.do", new QnaWriteService());
		serviceMap.put("/notice/update.do", new NoticeUpdateService());
		serviceMap.put("/notice/delete.do", new NoticeDeleteService());
		// 조립 dao->service
		serviceMap.get("/qna/list.do").setDAO(daoMap.get("qnaDAO"));
		serviceMap.get("/qna/view.do").setDAO(daoMap.get("qnaDAO"));
		serviceMap.get("/qna/write.do").setDAO(daoMap.get("qnaDAO"));
		serviceMap.get("/notice/update.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/delete.do").setDAO(daoMap.get("noticeDAO"));
		
		// ---- [메시지 객체 생성과 조립 ] -----------------------
		daoMap.put("messageDAO", new MessageDAO());
		// 서비스생성 
		serviceMap.put("/message/list.do", new MessageListService());
		serviceMap.put("/qna/view.do", new QnaViewService());
		serviceMap.put("/message/write.do", new MessageWriteService());
		serviceMap.put("/notice/update.do", new NoticeUpdateService());
		serviceMap.put("/notice/delete.do", new NoticeDeleteService());
		// 조립 dao->service
		serviceMap.get("/message/list.do").setDAO(daoMap.get("messageDAO"));
		serviceMap.get("/qna/view.do").setDAO(daoMap.get("qnaDAO"));
		serviceMap.get("/message/write.do").setDAO(daoMap.get("messageDAO"));
		serviceMap.get("/notice/update.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/delete.do").setDAO(daoMap.get("noticeDAO"));
		
		
		System.out.println("Init.static 초기화 블록 ----- 객체 생성과 로딩 ------");
	}
	
	public static Service get(String uri) {
		return serviceMap.get(uri);
	}
	
}
