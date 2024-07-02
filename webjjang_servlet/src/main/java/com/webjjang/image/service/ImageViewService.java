package com.webjjang.image.service;

import com.webjjang.image.dao.ImageDAO;
import com.webjjang.image.vo.ImageVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class ImageViewService implements Service {

private ImageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (ImageDAO) dao;
	}
	
	
	@Override
	public ImageVO service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - ImageDAO.list()
		// ImageController - (Execute) - [ImageViewService] - ImageDAO.view()
		return dao.view((Long) obj);
	}

}
