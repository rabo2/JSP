package com.jsp.action.notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.NoticeService;

public class NoticeDeleteAction implements Action{
	private NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		
		String nno = request.getParameter("nno");
		noticeService.deleteNotice(nno);
			
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("window.close(); window.opener.location.href='list.do';");
		out.print("</script>");
		
		return url;
	}
}
