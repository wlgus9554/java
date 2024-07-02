package com.webjjang;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSPSevlet
 */
// urlPatterns - 위치기반 / 확장자 기반 - 2개를 혼용해서 사용할 수 없다.
// loadOnStartup - 서버가 실행될 때 실행해 준다. 생성하고 init()를 딱 한번 실행 준다.
@WebServlet(urlPatterns = "*.do", loadOnStartup = 1)
public class JSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JSPServlet() {
        super();
        // TODO Auto-generated constructor stub
        System.out.println("JSPServlet 생성자() ...............");
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("JSPServlet.init() ...............");
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("JSPServlet.service() ...............");
		System.out.println("mothod = " + request.getMethod());
		System.out.println("URI = " + request.getRequestURI());
		
		String uri = request.getRequestURI();
		
		/*
		if(request.getMethod().equals("GET"))
			request.getRequestDispatcher("/WEB-INF/views/JSPServlet_get.jsp")
			.forward(request, response);
		else
			System.out.println("post");
		*/
		
		switch (uri) {
		case "/board/list.do": {
			request.getRequestDispatcher("/WEB-INF/views/board/list.jsp")
			.forward(request, response);
			break;
		}
		case "/board/view.do": {
			request.getRequestDispatcher("/WEB-INF/views/board/view.jsp")
			.forward(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + uri);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		System.out.println("JSPServlet.doGet() ...............");
//		
//		request.getRequestDispatcher("/WEB-INF/views/JSPServlet_get.jsp")
//		.forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		System.out.println("JSPServlet.doPost() ...............");
//	}

}
