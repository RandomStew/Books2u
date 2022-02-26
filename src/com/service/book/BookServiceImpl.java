package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.book.BookDAO;
import com.dto.book.BookDTO;

public class BookServiceImpl implements BookService {

	@Override
	public List<BookDTO> searchTitle(String title) throws Exception {
		List<BookDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			list = dao.searchTitle(session, title);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<BookDTO> searchAuthor(String author) throws Exception {
		List<BookDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			list = dao.searchAuthor(session, author);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<BookDTO> searchPublisher(String publisher) throws Exception {
		List<BookDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			list = dao.searchPublisher(session, publisher);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<BookDTO> searchStory(String story) throws Exception {
		List<BookDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			list = dao.searchStory(session, story);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public BookDTO searchBookInfo(String isbn) throws Exception {
		BookDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			dto = dao.searchBookInfo(session, isbn);
		} finally {
			session.close();
		}
		return dto;
	}

}
