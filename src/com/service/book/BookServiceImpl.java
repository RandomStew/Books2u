package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.book.BookDAO;
import com.dto.book.BookDTO;
import com.dto.book.BookPageDTO;

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

	@Override
	public BookPageDTO selectTitlePages(String title, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			pageDTO = dao.selectTitlePages(session, title, curPage, perPage);
		} finally {
			session.close();
		}
		return pageDTO;
	}

	@Override
	public BookPageDTO selectAuthorPages(String author, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			pageDTO = dao.selectTitlePages(session, author, curPage, perPage);
		} finally {
			session.close();
		}
		return pageDTO;
	}

	@Override
	public BookPageDTO selectPublisherPages(String publisher, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			pageDTO = dao.selectPublisherPages(session, publisher, curPage, perPage);
		} finally {
			session.close();
		}
		return pageDTO;
	}

	@Override
	public BookPageDTO selectStoryPages(String story, int curPage, int perPage) throws Exception {
		BookPageDTO pageDTO = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			pageDTO = dao.selectStoryPages(session, story, curPage, perPage);
		} finally {
			session.close();
		}
		return pageDTO;
	}

}
