package com.webjjang.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.webjjang.main.controller.Init;
import com.webjjang.member.vo.LoginVO;
import com.webjjang.notice.vo.NoticeVO;
import com.webjjang.util.exe.Execute;
import com.webjjang.util.page.PageObject;

public class NoticeController {
    public String execute(HttpServletRequest request) {
        String uri = request.getRequestURI();
        String jsp = null;
        HttpSession session = request.getSession();
        int gradeNo = 0;
        LoginVO login = (LoginVO) session.getAttribute("login");
        if (login != null) {
            gradeNo = login.getGradeNo();
        }
        Object result = null;
        Long no = 0L;

        try {
            switch (uri) {
                case "/notice/list.do":
                    System.out.println("1.공지사항 리스트");
                    PageObject pageObject = PageObject.getInstance(request);
                    String period = request.getParameter("period");
                    if (gradeNo == 9) {
                        if (period == null || period.isEmpty()) {
                            pageObject.setPeriod("all");
                        } else {
                            pageObject.setPeriod(period);
                        }
                    } else {
                        pageObject.setPeriod(null);
                    }
                    result = Execute.execute(Init.get(uri), pageObject);
                    System.out.println("NoticeController.execute().pageObject = " + pageObject);
                    request.setAttribute("list", result);
                    request.setAttribute("pageObject", pageObject);
                    jsp = "notice/list";
                    break;
                case "/notice/view.do":
                    System.out.println("2.공지사항 글보기");
                    no = Long.parseLong(request.getParameter("no"));
                    result = Execute.execute(Init.get(uri), no);
                    request.setAttribute("vo", result);
                    jsp = "notice/view";
                    break;
                case "/notice/writeForm.do":
                    System.out.println("3-1.공지사항 글등록 폼");
                    jsp = "notice/writeForm";
                    break;
                case "/notice/write.do":
                    System.out.println("3-2.공지사항 글등록");
                    String title = request.getParameter("title");
                    String content = request.getParameter("content");
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    NoticeVO vo = new NoticeVO();
                    vo.setTitle(title);
                    vo.setContent(content);
                    vo.setStartDate(startDate);
                    vo.setEndDate(endDate);
                    result = Execute.execute(Init.get(uri), vo);
                    session.setAttribute("msg", "공지가 등록되었습니다.");
                    jsp = "redirect:list.do";
                    break;
                case "/notice/updateForm.do":
                    System.out.println("4-1.공지사항 글수정 폼");
                    no = Long.parseLong(request.getParameter("no"));
                    result = Execute.execute(Init.get("/notice/view.do"), no);
                    request.setAttribute("vo", result);
                    jsp = "notice/updateForm";
                    break;
                case "/notice/update.do":
                    System.out.println("4.공지사항 글수정");
                    no = Long.parseLong(request.getParameter("no"));
                    title = request.getParameter("title");
                    content = request.getParameter("content");
                    startDate = request.getParameter("startDate");
                    endDate = request.getParameter("endDate");
                    vo = new NoticeVO();
                    vo.setNo(no);
                    vo.setTitle(title);
                    vo.setContent(content);
                    vo.setStartDate(startDate);
                    vo.setEndDate(endDate);
                    result = Execute.execute(Init.get(uri), vo);
                    pageObject = PageObject.getInstance(request);
                    session.setAttribute("msg", "공지가 수정되었습니다.");
                    jsp = "redirect:list.do?no=" + no + "&" + pageObject.getPageQuery();
                    break;
                case "/notice/delete.do":
                    System.out.println("5.공지사항 글삭제");
                    no = Long.parseLong(request.getParameter("no"));
                    result = Execute.execute(Init.get(uri), no);
                    session.setAttribute("msg", "공지가 삭제되었습니다.");
                    jsp = "redirect:list.do";
                    break;
                default:
                    jsp = "error/404";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("e", e);
            jsp = "error/500";
        }
        return jsp;
    }
}
