package com.webjjang.notice.service;

import com.webjjang.notice.dao.NoticeDAO;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.main.service.Service;

public class NoticeWriteService implements Service {

	@Override
	public Integer service(Object obj) throws Exception {
		// DB notice에서 글등록 쿼리 실행해서 데이터 저장
		// DB 처리는 DAO에서 처리 - NoticeDAO.write()
		// NoticeController - (Execute) - [NoticeListService] - NoticeDAO.write()
		return new NoticeDAO().write((NoticeVO)obj);
	}

}
