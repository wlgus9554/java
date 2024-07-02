package com.webjjang.board.service;

import com.webjjang.board.board.dao.BoardDAO;
import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.service.Service;

public class BoardViewService implements Service {

	@Override
	public BoardVO service(Object obj) throws Exception {
		// 넘어오는 데이터의 구조 obj - Long[] : obj[0] - no, obj[1] - inc
		Long[] objs = (Long[]) obj; // 데이터를 넣을 때 Long[]로 저장했어야만 한다.
		Long no = objs[0];
		Long inc = objs[1];
		// DB board에서 조회수 1증가 하고 글보기 데이터 가져와서 리턴
		BoardDAO dao = new BoardDAO();
		// 1. 조회수 1증가 : inc == 1
		if(inc == 1) dao.increase(no);
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
		return dao.view(no);
		
	}

}
