package com.service.review;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.review.ReviewDAO;
import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

public class ReviewServiceImpl implements ReviewService {

	@Override
	public ReviewPageDTO selectAllPages(int curPage) throws Exception {
		ReviewPageDTO pageDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			ReviewDAO dao = new ReviewDAO();
			pageDTO = dao.selectAllPages(session, curPage);
		} finally {
			session.close();
		}
		return pageDTO;
	}

	@Override
	public int addReview(ReviewDTO dto) throws Exception {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			ReviewDAO dao = new ReviewDAO();
			n = dao.addReview(session, dto);
			session.commit();
		} finally {
			// TODO: handle finally clause
			session.close();
		}
		return n;
	}

}
