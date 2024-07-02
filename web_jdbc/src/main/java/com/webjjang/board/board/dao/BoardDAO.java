package com.webjjang.board.board.dao;

import java.util.ArrayList;
import java.util.List;

import com.webjjang.board.vo.BoardVO;
import com.webjjang.main.dao.DAO;
import com.webjjang.util.db.DB;

public class BoardDAO extends DAO {

	// 필요한 객체 선언 - 상속
	// 접속 정보 - DB 사용 - connection을 가져오게 하는 메서드만 이용
	
	// 1. 리스트 처리
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public List<BoardVO> list() throws Exception {
		
		// 결과를 저장할 수 있는 변수 선언.
		List<BoardVO> list = null;
		
		try {
			// 1. 드라이버 확인 -DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(LIST);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			if(rs != null) {
				while (rs.next()) {
					// rs -> vo -> list
					// list가 null이면 생성해서 저장할 수 있게 해줘야 한다.
					if(list == null) list = new ArrayList<BoardVO>();
					// rs - vo
					BoardVO vo = new BoardVO();
					vo.setNo(rs.getLong("no"));
					vo.setTitle(rs.getString("title"));
					vo.setWriter(rs.getString("Writer"));
					vo.setWriteDate(rs.getString("WriteDate"));
					vo.setHit(rs.getLong("Hit"));
					
					// vo -> list
					list.add(vo);
				} // end of while
			} // end of if
		} catch (Exception e) {
			e.printStackTrace();
			throw e; // 오류 난것을 던진다.
		} finally {
			try {
				System.out.println("닫기");
				// 7. 닫기
				DB.close(con, pstmt, rs);
			} catch (Exception e) {
				DB.close(con, pstmt);
			}// end of try ~catch
		} // end of finally
		
		// 결과 데이터를 리턴해 준다.
		return list;
	} // end of public List<BoardVO>
	
	// 2-1. 글보기 조회수 1증가 처리
	// BoardController - (Execute) - BoardListService - [BoardDAO.list()]
	public int increase(Long no) throws Exception {
		
		// 결과를 저장할 수 있는 변수 선언.
		int result = 0;
		
		try {
			// 1. 드라이버 확인 -DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(INCREASE);
			pstmt.setLong(1, no);
			// 5. 실행 - update : executeUpdate -> int 결과가 나옴.
			result = pstmt.executeUpdate();
			// 6. 표시 또는 담기
			if(result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
				throw new Exception("예외 발생 : 글번호가 존재하지 않습니다. 글번호를 확인해 주세요.");
				}			
		} catch (Exception e) {
			e.printStackTrace();
			// 특별한 예외는 그냥 전달한다.
			if(e.getMessage().indexOf("예외 발생") >= 0) throw e;
			// 그 외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			else throw new Exception("예외 발생 : 게시판 글보기 조회수 DB처리 중 예외가 발생했습니다.");
		} finally {
			// 7. 닫기
			DB.close(con, pstmt);
		}
		
		// 결과 데이터를 리턴해 준다.
		return result;
	} // end of increase()

	// 2-2. 글보기 처리
	// BoardController - (Execute) - BoardViewService - [BoardDAO.list()]
	public BoardVO view(Long no) throws Exception {		
		// 결과를 저장할 수 있는 변수 선언.
		BoardVO vo = null;
		
		try {
			// 1. 드라이버 확인 -DB
			// 2. 연결
			con = DB.getConnection();
			// 3. sql - 아래 LIST
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(VIEW);
			pstmt.setLong(1, no);
			// 6. 표시 또는 담기
			rs = pstmt.executeQuery();
			
			if(rs != null && rs.next()) {
					// rs -> vo
				vo = new BoardVO();
				vo.setNo(rs.getLong("no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setHit(rs.getLong("hit"));
				} // end of if
		} catch (Exception e) {
			e.printStackTrace();
			throw e; // 오류 난것을 던진다.
		} finally {
				DB.close(con, pstmt, rs);
		} // end of try ~ catch ~ finally 
		
		// 결과 데이터를 리턴해 준다.
		return vo;
	} // end of view()
	
	// 3. 글등록 처리
		// BoardController - (Execute) - BoardInsertService - [BoardDAO.list()]
		public int write(BoardVO vo) throws Exception {
			
			// 결과를 저장할 수 있는 변수 선언.
			int result = 0;
			
			try {
				// 1. 드라이버 확인 -DB
				// 2. 연결
				con = DB.getConnection();
				// 3. sql - 아래 LIST
				System.out.println("Sql : " + WRITE);
				// 4. 실행 객체 & 데이터 세팅
				pstmt = con.prepareStatement(WRITE);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getWriter());
				pstmt.setString(4, vo.getPw());
				System.out.println("데이터 세팅 완료");
				// 5. 실행 - update : executeUpdate -> int 결과가 나옴.
				result = pstmt.executeUpdate();
				
				System.out.println();
				
				// 6. 표시 또는 담기
				System.out.println("글등록이 완료 되었습니다.");
				
			} catch (Exception e) {
				e.printStackTrace();
				// 특별한 예외는 그냥 전달한다.
				throw new Exception("예외 발생 : 게시판 글등록 DB처리 중 예외가 발생했습니다.");
				// 그 외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
			} finally {
				// 7. 닫기
				DB.close(con, pstmt);
			}
			
			// 결과 데이터를 리턴해 준다.
			return result;
		} // end of increase()

		// 4. 글수정 처리
		// BoardController - (Execute) - BoardUpdateService - [BoardDAO.list()]
		public int update(BoardVO vo) throws Exception {
			
			// 결과를 저장할 수 있는 변수 선언.
			int result = 0;
			
			try {
				// 1. 드라이버 확인 -DB
				// 2. 연결
				con = DB.getConnection();
				// 3. sql - 아래 UPDATE
				// 4. 실행 객체 & 데이터 세팅
				pstmt = con.prepareStatement(UPDATE);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getWriter());
				pstmt.setLong(4, vo.getNo());
				pstmt.setString(5, vo.getPw());
				// 5. 실행 - update : executeUpdate -> int 결과가 나옴.
				result = pstmt.executeUpdate();
				// 6. 표시 또는 담기
				if(result == 0) { // 글번호가 존재하지 않는다. -> 예외로 처리한다.
					throw new Exception("예외 발생 : 글번호나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요.");
					}			
			} catch (Exception e) {
				e.printStackTrace();
				// 특별한 예외는 그냥 전달한다.
				if(e.getMessage().indexOf("예외 발생") >= 0) throw e;
				// 그 외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
				else throw new Exception("예외 발생 : 게시판 글등록 DB처리 중 예외가 발생했습니다.");
			} finally {
				// 7. 닫기
				DB.close(con, pstmt);
			}
			
			// 결과 데이터를 리턴해 준다.
			return result;
		} // end of Update

		// 5. 글삭제 처리
		// BoardController - (Execute) - BoardDeleteService - [BoardDAO.list()]
		public int delete(BoardVO vo) throws Exception {
			
			// 결과를 저장할 수 있는 변수 선언.
			int result = 0;
			
			try {
				// 1. 드라이버 확인 -DB
				// 2. 연결
				con = DB.getConnection();
				// 3. sql - 아래 UPDATE
				
				// 4. 실행 객체 & 데이터 세팅				
				pstmt = con.prepareStatement(DELETE);
				pstmt.setLong(1, vo.getNo());
				pstmt.setString(2, vo.getPw());
				
				// 5. 실행 - update : executeUpdate -> int 결과가 나옴.
				result = pstmt.executeUpdate();
				
				// 6. 표시 또는 담기
				if(result == 0) { // 글번호가 존재하지 않거나 비번 틀림 -> 예외로 처리한다.
					throw new Exception("예외 발생 : 글번호나 비밀번호가 맞지 않습니다. 정보를 확인해 주세요.");
					}			
			} catch (Exception e) {
				e.printStackTrace();
				// 특별한 예외는 그냥 전달한다.
				if(e.getMessage().indexOf("예외 발생") >= 0) throw e;
				// 그 외 처리 중 나타나는 오류에 대해서 사용자가 볼 수 있는 예외로 만들어 전달한다.
				else throw new Exception("예외 발생 : 게시판 글등록 DB처리 중 예외가 발생했습니다.");
			} finally {
				// 7. 닫기
				DB.close(con, pstmt);
			}
			
			// 결과 데이터를 리턴해 준다.
			return result;
		} // end of DELETE

	// 실행할 쿼리를 정의해 놓은 변수 선언.
	final String LIST  = " select no, title, writer, writeDate, "  
	         + " to_char(writeDate, 'yyyy-mm-dd') writeDate, hit "
	         + " from board "
	         + " order by no desc ";  
	
	final String INCREASE = "update board set hit = hit + 1 "
	         + " where no = ? " ;
	
	final String VIEW = " select no, title, content, writer, writeDate, "
	         + " to_char(writeDate, 'yyyy-mm-dd') writeDate, hit "
	         + " from board "
	         + " where no = ? ";
	
	final String WRITE = "insert into board"
	         + " ( no, title, content, writer, pw) " 
			 + " values(board_seq.nextval, ?, ?, ?, ?) ";
	
	final String UPDATE = "update board "
	         + " set title = ?, content = ?, writer = ? "
	         + " where no = ? and pw = ? ";
	
	final String DELETE = " delete from board "
	         + " where no = ?  and pw = ? ";

	
} // end of class
