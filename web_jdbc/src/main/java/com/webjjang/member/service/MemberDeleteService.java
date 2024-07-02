package com.webjjang.member.service;

import com.webjjang.member.dao.MemberDAO;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.member.vo.MemberVO;

import java.util.List;

import javax.swing.text.View;

import com.webjjang.main.service.Service;

public class MemberDeleteService implements Service {

	@Override
	public Integer service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - MemberDAO.login() : obj == vo
		// MemberController - (Execute) - [MemberWriteService] - [MemberDAO.write()]
		return new MemberDAO().delete((MemberVO) obj);
		
	}

}
