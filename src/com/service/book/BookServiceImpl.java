package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.book.BookDAO;
import com.dto.book.BookDTO;

public class BookServiceImpl implements BookService {

	@Override
	public List<BookDTO> search(String title) throws Exception {
		List<BookDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			BookDAO dao = new BookDAO();
			list = dao.search(session, title);
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
