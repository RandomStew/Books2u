package com.service.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dao.review.ReviewDAO;
import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO dao;
	
	@Override
	public ReviewPageDTO selectAllPages(int curPage, String isbn) throws Exception {
		return dao.selectAllPages(curPage, isbn);
	}

	@Override
	public int addReview(ReviewDTO dto) throws Exception {
		return dao.addReview(dto);
	}

	@Override
	public int updateReview(ReviewDTO dto) throws Exception {
		return dao.updateReview(dto);
	}

}
