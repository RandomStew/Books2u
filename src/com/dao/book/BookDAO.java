package com.dao.book;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;
import com.dto.book.BookPageDTO;

public class BookDAO {
	public List<BookDTO> searchTitle(SqlSession session, String title) throws Exception{
		return session.selectList("com.config.BookMapper.searchTitle", title);
	}
	
	public List<BookDTO> searchAuthor(SqlSession session, String author) throws Exception{
		return session.selectList("com.config.BookMapper.searchAuthor", author);
	}
	
	public List<BookDTO> searchPublisher(SqlSession session, String publisher) throws Exception{
		return session.selectList("com.config.BookMapper.searchPublisher", publisher);
	}
	
	public List<BookDTO> searchStory(SqlSession session, String story) throws Exception{
		return session.selectList("com.config.BookMapper.searchStory", story);
	}
	
	public BookDTO searchBookInfo(SqlSession session, String isbn) throws Exception {
		return session.selectOne("com.config.BookMapper.searchBookInfo", isbn);
	}
	public BookPageDTO selectTitlePages(SqlSession session, String title, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(session, title);
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
	public BookPageDTO selectAuthorPages(SqlSession session, String author, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(session, author);
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
	
	public BookPageDTO selectPublisherPages(SqlSession session, String publisher, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(session, publisher);
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
	
	public BookPageDTO selectStoryPages(SqlSession session, String story, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = new BookPageDTO();
		int totalRecord = totalRecordTitle(session, story);
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
	private int totalRecordTitle(SqlSession session, String title) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordTitle", title);
	}
	
	private int totalRecordAuthor(SqlSession session, String author) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordAuthor", author);
	}
	
	private int totalRecordPublisher(SqlSession session, String publisher) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordPublisher", publisher);
	}
	
	private int totalRecordStory(SqlSession session, String story) throws Exception {
		return session.selectOne("com.config.BookMapper.totalRecordStory", story);
	}
}
