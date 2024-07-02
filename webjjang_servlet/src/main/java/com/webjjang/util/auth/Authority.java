package com.webjjang.util.auth;

import java.util.HashMap;
import java.util.Map;

import com.webjjang.main.controller.Main;
import com.webjjang.main.service.Service;

public class Authority {

	// Service에 따른 권한 저장 Map
	private static Map<String, Integer> authMap = new HashMap<String, Integer>();
	
	static {
		// 회원관리
		//    - 관리자 : 리스트, 회원 등급변경, 회원 상태 변경
		//    - 회원(로그인) : 내정보보기, 내정보 수정, 회원 탈퇴
		authMap.put("MemberListService", 9);
		authMap.put("MemberViewService", 1);
	}
	
	public static void checkAuth(Service service) throws Exception{
		Integer level = authMap.get(service.getClass().getSimpleName());
		// 로그인이 필요한 처리
		if(level != null) {
			// 로그인을 안한 경우 처리.
			if(Main.login == null) 
				throw new Exception("예외 발생 : 로그인을 하셔야 합니다.");
			// 로그인한 권한이 낮은 경우 처리.
			if(level > Main.login.getGradeNo())
				throw new Exception("예외 발생 : 처리할 권한이 없습니다.");
		}
	}
	
}
