package com.jsp.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.dao.NoticeDAO;
import com.jsp.dto.NoticeVO;
import com.jsp.request.PageMaker;
import com.jsp.request.SearchCriteria;

public class NoticeServiceImpl implements NoticeService {
	private SqlSessionFactory sqlSessionFactory;
	private NoticeDAO noticeDAO;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();

		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			List<NoticeVO> noticeList = noticeDAO.selectSearchNoticeList(session, cri);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(noticeDAO.selectSearchNoticeListCount(session, cri));

			dataMap.put("noticeList", noticeList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
		} finally {
			session.close();
		}
	}

	@Override
	public NoticeVO getNoticeByNno(String nno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			NoticeVO notice = noticeDAO.selectNoticeByNno(session, nno);
			return notice;
		} finally {
			session.close();
		}

	}

	@Override
	public void registNotice(NoticeVO notice) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();

		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();

		if(notice.getStartdate().before(today)) {
			notice.setDist("Y");
		}else {
			notice.setDist("N");
		}
		
		if (notice.getEnddate() != null) {
			if (notice.getEnddate().before(today)) {
				notice.setDist("N");
			}
		}

		try {
			noticeDAO.insertNotice(session, notice);
		} finally {
			session.close();
		}

	}

	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		
		if(notice.getStartdate().before(today)) {
			notice.setDist("Y");
		}else {
			notice.setDist("N");
		}
		
		if (notice.getEnddate() != null) {
			if (notice.getEnddate().before(today)) {
				notice.setDist("N");
			}
		}
		
		try {
			noticeDAO.updateNotice(session, notice);
		} finally {
			session.close();
		}

	}

	@Override
	public void endDateOver() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			noticeDAO.updateEndDateOver(session);
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteNotice(String nno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			noticeDAO.deleteNoticeById(session, nno);
		} finally {
			session.close();
		}

	}

	@Override
	public void increaseViewcnt(String nno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			noticeDAO.updateNoticeViewcnt(session, nno);
		} finally {
			session.close();
		}

	}

}
