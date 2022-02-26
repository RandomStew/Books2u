package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;

public interface BookService {
	// 책 제목 검색 like
	public List<BookDTO> searchTitle(String title) throws Exception;
	
	// 저자명 검색 like
	public List<BookDTO> searchAuthor(String author) throws Exception;

	// 출판사 검색 like
	public List<BookDTO> searchPublisher(String publisher) throws Exception;
	
	// 줄거리 검색 like
	public List<BookDTO> searchStory(String story) throws Exception;
	
	// ISBN을 이용한 책 한권 정보 검색
	public BookDTO searchBookInfo(String isbn) throws Exception;
}
