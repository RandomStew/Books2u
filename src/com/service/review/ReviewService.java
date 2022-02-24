package com.service.review;

import org.apache.ibatis.session.SqlSession;

import com.dto.review.ReviewPageDTO;

public interface ReviewService {
	public ReviewPageDTO selectAllPages(int curPage)throws Exception;
	
}
