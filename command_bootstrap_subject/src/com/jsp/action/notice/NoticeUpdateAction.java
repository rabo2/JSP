package com.jsp.action.notice;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

public class NoticeUpdateAction implements Action{
	private NoticeService noticeService;

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "notice/regist_success";
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Date endDate = date.parse(request.getParameter("enddate"));
		Date starDate = date.parse(request.getParameter("startdate"));
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO notice = new NoticeVO();
		
		notice.setTitle(title);
		notice.setContent(content);
		notice.setEnddate(endDate);
		notice.setNno(nno);
		notice.setStartdate(starDate);
		
		noticeService.modifyNotice(notice);
		
		PrintWriter out = response.getWriter();
		
		return url;
	}
}
