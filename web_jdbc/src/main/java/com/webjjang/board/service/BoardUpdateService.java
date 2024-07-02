package com.webjjang.board.service;


import com.webjjang.board.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.service.Service;

public class BoardUpdateService implements Service {

	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 수정 쿼리 실행해서 데이터 처리
		// BoardController - (Execute) - BoardListService - [BoardDAO.update()]
		return new BoardDAO().update((BoardVO)obj);
	}

}
