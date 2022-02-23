package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;

public interface BookService {
	public List<BookDTO> search(String title) throws Exception;
}
