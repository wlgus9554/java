package com.webjjang.message.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class MessageUpdateService implements Service {

	private BoardDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (BoardDAO) dao;
	}

	@Override
	public Integer service(Object obj) throws Exception {
		// DB board에서 수정 쿼리 실행해서 데이터 처리
		// BoardController - (Execute) - [BoardUpdateService] - BoardDAO.update()
		return dao.update((BoardVO)obj);
	}

}
