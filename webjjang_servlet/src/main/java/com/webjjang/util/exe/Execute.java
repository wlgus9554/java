package com.webjjang.util.exe;

import java.util.Arrays;

import com.webjjang.main.controller.Main;
import com.webjjang.main.service.Service;
import com.webjjang.member.service.MemberConUpdateService;

import com.webjjang.util.auth.Authority;

public class Execute {
   
   // 서비스를 실행시키고 로그를 출력하는 메서드 작성
   public static Object execute(Service service, Object obj) throws Exception {
      // 권한 처리 -  AuthorityFilter 사용
      // Authority.checkAuth(service);
      
      // 처리된 결과를 저장하는 변수 => 리턴함 
      Object result = null;
      
      System.out.println();
      System.out.println("<<<---- 실행 로그 출력 ---->>>");
      System.out.println("<<<---------------------->>>");
      
      // 시작 시간 저장
      Long start = System.nanoTime();
      // 실행 객체 정보를 출력
      // service 객체를 글래스로 바꾸자 - service.getClass()
      // 클래스의 이름을 패키지와 함께 가져오자 - getName()
      System.out.println("실행객체 이름 : " + service.getClass().getName());
      // 넘어오는 데이터
      // 배열인지 물어보자 : obj instanceof Object[]
      // 배열이면 배열 데이터를 출력하는 Arrays.toString
      // 아니면 obj 그냥 출력
      System.out.println("넘어가는 데이터 : "
            + ((obj instanceof Object[]) ? Arrays.toString((Object[])obj) : obj));
      
      // service 를 실행한다 
      result = service.service(obj);
      
      // 결과 데이터 출력
      System.out.println("결과 데이터 : " + result);
      
      // 끝나는 시간 저장
      Long end = System.nanoTime();
      // 실행 시간 출력 (끝나는 시간 - 시작시간)
      System.out.println("실행 시간(ns) : " + (end - start));
      System.out.println("---------------------------------------");
      
      // 최근 접속일 출력 - 반드시 로그인이 되어져있는 경우만
      if(Main.login != null) {
         new MemberConUpdateService().service(Main.login.getId());
      }
      
      // 처리된 결과를 리턴한다 
      return result;
   }
}
