package com.dao.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;

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
}
