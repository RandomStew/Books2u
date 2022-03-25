package com.dao.book;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.book.BookDTO;
import com.dto.book.BookPageDTO;

@Repository("bookDAO")
public class BookDAO {
	
	@Autowired
	SqlSession session;
	
	public List<BookDTO> searchTitle(String title) throws Exception{
		return session.selectList("com.config.BookMapper.searchTitle", title);
	}
	
	public List<BookDTO> searchAuthor(String author) throws Exception{
		return session.selectList("com.config.BookMapper.searchAuthor", author);
	}
	
	public List<BookDTO> searchPublisher(String publisher) throws Exception{
		return session.selectList("com.config.BookMapper.searchPublisher", publisher);
	}
	
	public List<BookDTO> searchStory(String story) throws Exception{
		return session.selectList("com.config.BookMapper.searchStory", story);
	}
	
	public BookDTO searchBookInfo(String isbn) throws Exception {
		return session.selectOne("com.config.BookMapper.searchBookInfo", isbn);
	}
	public BookPageDTO selectTitlePages(String title, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(title);
		int offset = (curPage-1) * perPage;
		
		List<BookDTO> list = session.selectList("com.config.BookMapper.searchTitle",
				title,
				new RowBounds(offset, perPage));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setPerPage(perPage);
		pageDTO.setTotalPage(totalRecord);
		return pageDTO;
	}
	
	///////////////////////////////////////////////////////
	// page 처리 DAO
	public BookPageDTO selectAuthorPages(String author, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(author);
		int offset = (curPage-1) * perPage;
		
		List<BookDTO> list = session.selectList("com.config.BookMapper.searchAuthor",
				author,
				new RowBounds(offset, perPage));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setPerPage(perPage);
		pageDTO.setTotalPage(totalRecord);
		return pageDTO;
	}
	
	public BookPageDTO selectPublisherPages(String publisher, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(publisher);
		int offset = (curPage-1) * perPage;
		
		List<BookDTO> list = session.selectList("com.config.BookMapper.searchPublisher",
				publisher,
				new RowBounds(offset, perPage));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setPerPage(perPage);
		pageDTO.setTotalPage(totalRecord);
		return pageDTO;
	}
	
	public BookPageDTO selectStoryPages(String story, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(story);
		int offset = (curPage-1) * perPage;
		
		List<BookDTO> list = session.selectList("com.config.BookMapper.searchStory",
				story,
				new RowBounds(offset, perPage));
		
		pageDTO.setList(list);
		pageDTO.setCurPage(curPage);
		pageDTO.setPerPage(perPage);
		pageDTO.setTotalPage(totalRecord);
		return pageDTO;
	}
	
	
	
	////////////////////////////////////////////////////////////////
	// totalRecord 구하기 
	private int totalRecordTitle(String title) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordTitle", title);
	}
	
	private int totalRecordAuthor(String author) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordAuthor", author);
	}
	
	private int totalRecordPublisher( String publisher) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordPublisher", publisher);
	}
	
	private int totalRecordStory(String story) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordStory", story);
	}
}
