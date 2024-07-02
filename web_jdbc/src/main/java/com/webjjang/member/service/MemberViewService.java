package com.webjjang.member.service;

import com.webjjang.member.dao.MemberDAO;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.member.vo.MemberVO;

import java.util.List;

import javax.swing.text.View;

import com.webjjang.main.service.Service;

public class MemberViewService implements Service {

	@Override
	public MemberVO service(Object obj) throws Exception {
		// DB 처리는 DAO에서 처리 - MemberDAO.login() : obj == LoginVO
		// MemberController - (Execute) - MemberListService - [MemberDAO.login()]
		return new MemberDAO().view((String) obj);
		
	}

}