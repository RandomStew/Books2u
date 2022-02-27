package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.book.BookDTO;
import com.dto.book.BookPageDTO;

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
	
	// page 처리 title
	public BookPageDTO selectTitlePages(String title, int curPage, int perPage) throws Exception;

	// page 처리 저자명
	public BookPageDTO selectAuthorPages(String author, int curPage, int perPage) throws Exception;

	// page 처리 출판사
	public BookPageDTO selectPublisherPages(String publisher, int curPage, int perPage) throws Exception;
	
	// page 처리 줄거리
	public BookPageDTO selectStoryPages(String story, int curPage, int perPage) throws Exception;


}
