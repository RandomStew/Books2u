package com.service.review;

import org.apache.ibatis.session.SqlSession;

import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

public interface ReviewService {
	
	// 리뷰 페이징 처리
	public ReviewPageDTO selectAllPages(int curPage, String isbn) throws Exception;
	
	// 리뷰 추가
	public int addReview(ReviewDTO dto) throws Exception;
	
	// 리뷰 수정
	public int updateReview(ReviewDTO dto) throws Exception ;
}
