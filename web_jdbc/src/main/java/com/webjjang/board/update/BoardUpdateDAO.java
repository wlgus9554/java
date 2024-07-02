package com.webjjang.board.update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class BoardUpdateDAO {
	
	public static void main(String[] args) {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String no = "1";
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String name = "java";
		String pw = "java";
		
		String title = "자바";
		String content = "졸려";
		String writer = "박지현";
		String userpw = "1111";
		
		try {
			Class.forName(driver);
			System.out.println("드라이버 확인");
			
			con = DriverManager.getConnection(url, name, pw);
			System.out.println("연동 확인");
			
			String sql = "update board set title = ?, content = ?, writer = ? "
					+ " where no = ? and pw = ? ";
			System.out.println("sql -" + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setString(4, no);
			pstmt.setString(5, userpw);
			
			System.out.println("값 설정 완료");
			
			int result = pstmt.executeUpdate();
			System.out.println("등록성공" + result);
			
			if(result > 0) {
				System.out.println("게시물 업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(con != null)con.close();
				if(pstmt != null)pstmt.close();
				System.out.println("닫기 성공");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("객체 닫기 실패");
			}
		}
	}

}
