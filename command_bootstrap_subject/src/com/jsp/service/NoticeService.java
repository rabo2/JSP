package com.jsp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.jsp.dto.NoticeVO;
import com.jsp.request.SearchCriteria;

public interface NoticeService {
	Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException;

	NoticeVO getNoticeByNno(String nno) throws SQLException;

	void registNotice(NoticeVO notice) throws SQLException;

	void modifyNotice(NoticeVO notice) throws SQLException;

	void endDateOver() throws SQLException;

	void deleteNotice(String nno) throws SQLException;
	
	void increaseViewcnt(String nno)throws SQLException;

}
