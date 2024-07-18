package com.webjjang.message.service;

import com.webjjang.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class MessageViewService implements Service {

	private BoardDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (BoardDAO) dao;
	}

	@Override
	public BoardVO service(Object obj) throws Exception {
		// 넘어오는 데이터의 구조 obj - Long[] : obj[0] - no, obj[1] - inc
		Long[] objs = (Long[]) obj; // 데이터를 넣은 때 Long[]로 저장했어야만 한다.
		Long no = objs[0];
		Long inc = objs[1];
		// DB board에서 조회수 1증가 하고 글보기 데이터 가져와서 리턴
		// 1. 조회수 1증가 : inc == 1
		if(inc == 1) dao.increase(no);
		// DB 처리는 DAO에서 처리 - BoardDAO.view()
		// BoardController - (Execute) - [BoardViewService] - BoardDAO.view()
		return dao.view(no);
	}

}
