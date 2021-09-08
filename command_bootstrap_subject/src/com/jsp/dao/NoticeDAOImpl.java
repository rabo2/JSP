package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.NoticeVO;
import com.jsp.request.SearchCriteria;

public class NoticeDAOImpl implements NoticeDAO{

	@Override
	public List<NoticeVO> selectSearchNoticeList(SqlSession session, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<NoticeVO> noticeList = session.selectList("Notice-Mapper.selectSearchNoticeList", cri, rowBounds);
		
		
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListCount(SqlSession session, SearchCriteria cri) throws SQLException {
		int count = 0;
		count = session.selectOne("Notice-Mapper.selectSearchNoticeListCount", cri);
		
		return count;
	}

	@Override
	public NoticeVO selectNoticeByNno(SqlSession session, String nno) throws SQLException {
		NoticeVO notice = session.selectOne("Notice-Mapper.selectNoticeByNno", nno);
		return notice;
	}

	@Override
	public void insertNotice(SqlSession session, NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.insertNotice", notice);
	}

	@Override
	public void updateNotice(SqlSession session, NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice", notice);
		
	}

	@Override
	public void updateEndDateOver(SqlSession session) throws SQLException {
		session.update("Notice-Mapper.updateEndDateOver");
	}

	@Override
	public void deleteNoticeById(SqlSession session, String nno) throws SQLException {
		session.update("Notice-Mapper.deleteNoticeById", nno);
	}

	@Override
	public void updateNoticeViewcnt(SqlSession session, String nno) throws SQLException {
		session.update("Notice-Mapper.updateNoticeViewcnt", nno);
	}

}
