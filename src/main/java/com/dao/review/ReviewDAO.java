package com.dao.review;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

@Repository("reviewDAO")
public class ReviewDAO {
	
	@Autowired
	SqlSession session;
	
	public int addReview(ReviewDTO dto) throws Exception {
		return session.insert("com.config.ReviewMapper.addReview", dto);
	}
	
	public int updateReview(ReviewDTO dto) throws Exception {
		return session.update("com.config.ReviewMapper.updateReview", dto);
	}
	// 페이징 처리
	public ReviewPageDTO selectAllPages(int curPage, String isbn)throws Exception {
		ReviewPageDTO pageDTO = new ReviewPageDTO();
		int totalrecord = totalRecord(isbn);
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
	private int totalRecord(String isbn) throws Exception{
		return session.selectOne("com.config.ReviewMapper.totalRecord", isbn);
	}
	
}
