package com.webjjang.boardreply.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.boardreply.dao.BoardReplyDAO;
import com.webjjang.boardreply.vo.BoardReplyVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class BoardReplyUpdateService implements Service {

private BoardReplyDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (BoardReplyDAO) dao;
	}
	
	
	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 수정 쿼리 실행해서 데이터 처리
		// BoardController - (Execute) - [BoardListService] - BoardDAO.update()
		return dao.update((BoardReplyVO)obj);
	}

}
