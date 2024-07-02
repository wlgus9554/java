package com.webjjang.util.io;

import java.util.Scanner;

public class In {

	// 키보드로 입력 받는 객체 선언 초기화 시킴.
	private static Scanner scanner = new Scanner(System.in);
	
	// 문자열 입력 받는 프로그램 작성.
	public static String getStr() {
		return scanner.nextLine();
	}
	
	// 문자열 입력 받는 프로그램 작성.
	public static String getStr(String msg) {
		System.out.print(msg + " : ");
		return getStr();
	}
	
	// Long 타입의 데이터를 입력 받게하는 메서드
	public static Long getLong(String msg) {
		// 숫자가 입력 될때까지 무한 반복처리
		while(true) {
			try {
				// 입력 받은 문자열을 Long 타입 데이터 변환 시 정상 처리되면 데이터를 리턴
				// Long 타입의 데이터가 아니면(Long 타입 변환 시 예외 발생) 예외 처리한다.
				return Long.parseLong(getStr(msg));
			} catch (Exception e) {
				System.out.println("&%$ 숫자만 입력하셔야 합니다. 다시 입력해 주세요.");
			} // end of try ~ catch
		} // end of while
	} // end of getLong()
}// end of class
