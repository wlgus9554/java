<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	// 저장 객체에 데이터 세팅
	// JSP 페이지에서만 존재하는 pageContext
	pageContext.setAttribute("name", "page man");
	// 요청 처리 다 되는 동안 존재하는 request
	request.setAttribute("name", "request man");
	// 사용자의 접속되는 동안 존재하는 session - 40분(서버에서 설정 변경 가능) 안에 서버로 접속
	// 사용자인 경우 다른 브라우저인 경우 쿠키 체계가 달라서 다른 사용자로 인식한다.
	session.setAttribute("name", "session man");
	// 서버가 시작되면 존재하는 application - 모든 사용자가 함께 사용 가능
	application.setAttribute("name", "application man");
	
	System.out.println("firstPage.jsp : ");
	System.out.println("하나의 페이지 속성 : " + pageContext.getAttribute("name"));
	System.out.println("하나의 요청 속성 : " + request.getAttribute("name"));
	System.out.println("하나의 세션 속성 : " + session.getAttribute("name"));
	System.out.println("하나의 애플리케이션 속성 : " + application.getAttribute("name"));

// 데이터 처리가 끝났다. 데이터 표시는 JSP에서
%>
<p>
저장 객체는 pageContext, request, session, application이 있다.<br>
EL에서는 pageContext -> request -> session -> application -> 없다. 순서대로 찾는다.<br>
특별한 저장객체를 사용할 때는 scope을 붙여준다. login처리인 경우 scope을 사용하면 보안성이 올라간다.
서버가 시작되면 application 객체를 만들어서 준비해 놓다가 새로운 사용(SID)가 접속하면 session을
만들어서 그안에 application을 넣는다. 사용자가 페이지를 요청하면 request가 생긴다. request안에
session을 넣는다. 처리가 다 끝나고 페이터를 표시하려고 JSP로 이동할 때 pageContext가 생긴다
그 안에 request를 넣어 둔다. pageContext, request, session, application를 JSP에 전달해 준다.
</p>
<p>
- pageContext : 변수를 화면 표시하는 JSP에서 임시로 저장할 때.<br>
- request : DB에서 데이터를 가져와서 저장할 때. 사용자의 정보도 담겨 있다.<br>
- session : 로그인 처리와 같은 사용자 정보를 담는다.
- application : 전체 사용자가 사용.
</p>
EL의 name = ${name}<br>
pageContext의 name = ${pageScope.name}<br>
request의 name = ${requestScope.name}<br>
session의 name = ${sessionScope.name}<br>
application의 name = ${applicationScope.name}<br>

<% 
	// 자바 입니다. - 앞에 있는 html은 다 무시 당한다.
	// 데이터 표시를 위해서 JSP로 이동시킨다.
	request.getRequestDispatcher("second.jsp").forward(request, response);
%>