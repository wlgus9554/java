package com.webjjang.boardreply.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.boardreply.dao.BoardReplyDAO;
import com.webjjang.boardreply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class BoardReplyDeleteService implements Service {

private BoardReplyDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (BoardReplyDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// DB 처리는 DAO에서 처리 - BoardDAO.delete()
		// BoardController - (Execute) - [BoardListService] - BoardDAO.delete()
		return dao.delete((BoardReplyVO)obj);
	}



}
