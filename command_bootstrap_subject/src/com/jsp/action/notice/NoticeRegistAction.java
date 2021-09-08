package com.jsp.action.notice;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.action.Action;
import com.jsp.dto.MemberVO;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

public class NoticeRegistAction implements Action{
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "notice/regist_success";
	
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String startDate =request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String writer = member.getId();
		
		NoticeVO notice = new NoticeVO();

		Date parseStartDate = date.parse(startDate);
		
		notice.setTitle(title);
		notice.setWriter(writer);
		notice.setContent(content);
		notice.setStartdate(parseStartDate);
		
		Date parseEndDate = null;
		
		if(!endDate.equals("")) {
			parseEndDate = date.parse(endDate);
		}
		
		notice.setEnddate(parseEndDate);
		
		noticeService.registNotice(notice);
		
		return url;
	}
}
