package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.NoticeVO;
import com.jsp.request.SearchCriteria;

public interface NoticeDAO {
	List<NoticeVO> selectSearchNoticeList(SqlSession session, SearchCriteria cri) throws SQLException;
	
	int selectSearchNoticeListCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNno(SqlSession session, String nno) throws SQLException;
	
	void insertNotice (SqlSession session, NoticeVO notice) throws SQLException;
	
	void updateNotice (SqlSession session, NoticeVO notice) throws SQLException;
	
	void updateEndDateOver(SqlSession session) throws SQLException;
	
	void deleteNoticeById(SqlSession session, String nno) throws SQLException;
	
	void updateNoticeViewcnt(SqlSession session, String nno) throws SQLException;
	
}
