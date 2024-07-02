package com.webjjang.board.service;

import java.util.List;

import com.webjjang.board.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.service.Service;

public class BoardListService implements Service {

	@Override
	public List <BoardVO> service(Object obj) throws Exception {
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
		return new BoardDAO().list();
		
	}

}
