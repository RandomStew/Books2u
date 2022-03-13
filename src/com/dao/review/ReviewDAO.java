package com.dao.review;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

public class ReviewDAO {
	
	public int addReview(SqlSession session, ReviewDTO dto) throws Exception {
		return session.insert("com.config.ReviewMapper.addReview", dto);
	}
	
	public int updateReview(SqlSession session, ReviewDTO dto) throws Exception {
		return session.update("com.config.ReviewMapper.updateReview", dto);
	}
	// 페이징 처리
	public ReviewPageDTO selectAllPages(SqlSession session, int curPage, String isbn)throws Exception {
		ReviewPageDTO pageDTO = new ReviewPageDTO();
		int totalrecord = totalRecord(session, isbn);
		int perPage = pageDTO.getPerPage();
		int offset = (curPage-1) * perPage;
		
		List<ReviewDTO> list = session.selectList("com.config.ReviewMapper.selectAll",
				isbn,
				new RowBounds(offset, perPage));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setTotalPage(totalrecord);
		return pageDTO;
		
	}
	// total 레코드 갯수 출력
	private int totalRecord(SqlSession session, String isbn) throws Exception{
		return session.selectOne("com.config.ReviewMapper.totalRecord", isbn);
	}
	
}
