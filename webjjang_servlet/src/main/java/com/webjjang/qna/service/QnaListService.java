package com.webjjang.qna.service;

import java.util.List;

import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;
import com.webjjang.qna.dao.QnaDAO;
import com.webjjang.qna.vo.QnaVO;
import com.webjjang.util.page.PageObject;

public class QnaListService implements Service {

	private QnaDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (QnaDAO) dao;
	}
	
	@Override
	public List<QnaVO> service(Object obj) throws Exception {
		
		PageObject pageObject = (PageObject) obj;
		// DB board에서 리스트 쿼리 실행해서 데이터 가져오기 - 리턴
		// 전체 데이터의 개수 - JSP의 페이지 네이션과 데이터 가져오기  갯수 셋팅
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		// DB 처리는 DAO에서 처리 - BoardDAO.list()
		// QnaController - (Execute) - [QnaListService] - QnaDAO.list()
		return dao.list(pageObject);
	}

}
