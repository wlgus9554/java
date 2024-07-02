package com.saeyan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
// upload.do로 uri 패턴을 작성하면 JSPServlet과 충돌
@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UploadServlet.dopost()");
		
		// 설정
		// 1. 입력 텍스트 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 2. 출력되는 한글 설정 -> jsp page tag에서 설정
		response.setContentType("text/html; charset=UTF-8");
		
		// 3. 출력 객체 - JSP에서는 기본 객체 : server -> client 데이터 전송
		// - HTML 태그를 문자열로 만들어서 보낸다.
		PrintWriter out = response.getWriter();
		
		// 4. 저장 위치 지정
	      String savePath = "upload";
	      // - 실제적으로 저장되어 지는 위치 - 드라이브:/폴더/.../파일명
	      // - upload - 서버 기준으로한 위치 - 현재 위치에 upload 라는 폴더 - 없으면 오류
	      // - 
	      ServletContext context = getServletContext();
	      String uploadFilePath = context.getRealPath(savePath);
	      // controller에서 application을 꺼내서 실제 파일 위치 알아내는 코드
	      // request.getServletContext().getRealPath(uploadFilePath);
	      System.out.println("서버상 실제 디렉토리 : " + uploadFilePath);
	      File saveFolder = new File(uploadFilePath);
	      System.out.println("폴더 존재 여부 출력 : " + saveFolder.exists());
		
	      if(!saveFolder.exists()) {
	    	  saveFolder.mkdirs(); // 없는 폴더 생성
	    	  System.out.println("없는 폴더 생성()--------------");
	      }
	      
	      // 5. 파일의 최대 크기 100MB -> 100 * 1024 * 1024
	      int uploadFileSizeLimit = 100 * 1024 * 1024;
	      //  6. HttpServletRequest -> MultipartReqest : 데이터 이동 - 한글 처리 필요
	      String encType = "UTF-8";
	      
		try {
			// new MultipartRequest(request, 저장위치, 사이즈제한, encoding, 중복)
			// 1. request의 데이터는 사라진다. -> multi.getParamerter() 사용
			// 2. 중복처리 -> 파일명1.확장명 > 파일명2.확장명
			// 3. 저장위치에 파일이 업로드 된 상태가 된다.
			// - multi.getFilesystemName("name"); // 서버에 올라간 이름
			// - multi.getOriginalFileName("name"); // 클라이언트의 파일 이름
			
			MultipartRequest multi = new MultipartRequest(request, 
					uploadFilePath, 
					uploadFileSizeLimit, 
					encType,
					// 파일명이 중복 처리 객체 - 뒤에 1증가 번호 붙여 준다.
					new DefaultFileRenamePolicy()); 
			String fileName = multi.getFilesystemName("uploadFile");
			System.out.println("서버에 올라간 파일명 = " + fileName);
			String originalFileName = multi.getOriginalFileName("uploadFile");
			System.out.println("사용자가 올린 파일명 = " + originalFileName);
			// response.setHeader("Content-Disposition"),
			// "attachment;filename=" + fileName + ";"); // 다운로드 시 이름 변경
			
			// 파일이 선택되지 않은 경우.
			if (fileName == null) {
				System.out.println("파일 업로드 되지 않았음");
				// 파일이 선택된 경우
			} else {
				out.println("<html>");
				out.println("<head>");
				out.println("</head>");
				out.println("<body>");
				// 글쓴이, 제목, 파일명, / 다운로드 연결
				out.println("글쓴이 : " + multi.getParameter("name") + "<br>");
				out.println("제목 : " + multi.getParameter("title") + "<br>");
				out.println("파일 : " + fileName + "<br>");
				// 첨부된 파일을 다운로드 시킬 때 a tag 안에 속성으로 download를 넣어 준다.
				out.println("<a href='/"+ savePath + "/" + fileName + " ' " 
				+ "download >" + fileName + "</a>" + "<br>");
				out.println("</body>");
				out.println("</html>");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외 발생 : " + e);
		}
	}
	

}
