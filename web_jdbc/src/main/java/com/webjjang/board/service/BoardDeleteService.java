package com.webjjang.board.service;

import com.webjjang.board.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.service.Service;

public class BoardDeleteService implements Service {

	@Override
	public Integer service(Object obj) throws Exception {

		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
		return new BoardDAO().delete((BoardVO)obj);
	}

}
