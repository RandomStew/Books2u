package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;

public interface BookService {
	// 연관 키워드 검색
	public List<BookDTO> search(String title) throws Exception;
	
	// ISBN을 이용한 책 한권 정보 검색
	public BookDTO searchBookInfo(String isbn) throws Exception;
}
