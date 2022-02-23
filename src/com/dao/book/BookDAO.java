package com.dao.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;

public class BookDAO {
	public List<BookDTO> search(SqlSession session, String title) throws Exception{
		return session.selectList("com.config.BookMapper.search", title);
	}
}
