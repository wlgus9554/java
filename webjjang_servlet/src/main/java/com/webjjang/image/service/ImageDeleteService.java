package com.webjjang.image.service;

import com.webjjang.image.dao.ImageDAO;
import com.webjjang.image.vo.ImageVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.main.service.Service;

public class ImageDeleteService implements Service {

private ImageDAO dao;
	
	// dao setter
	public void setDAO(DAO dao) {
		this.dao = (ImageDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - ImageDAO.delete()
		// ImageController - (Execute) - [ImageDeleteService] - ImageDAO.delete()
		return dao.delete((ImageVO)obj);
	}



}
