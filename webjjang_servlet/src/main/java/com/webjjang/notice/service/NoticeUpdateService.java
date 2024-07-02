package com.webjjang.notice.service;

import com.webjjang.notice.dao.NoticeDAO;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.main.service.Service;

public class NoticeUpdateService implements Service {

	@Override
	public Integer service(Object obj) throws Exception {
		// DB notice에서 수정 쿼리 실행해서 데이터 처리
		// NoticeController - (Execute) - [NoticeListService] - NoticeDAO.update()
		return new NoticeDAO().update((NoticeVO)obj);
	}

}
