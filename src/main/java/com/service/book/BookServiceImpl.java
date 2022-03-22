package com.service.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dao.book.BookDAO;
import com.dto.book.BookDTO;
import com.dto.book.BookPageDTO;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	BookDAO dao;
	
	@Override
	public List<BookDTO> searchTitle(String title) throws Exception {
		return dao.searchTitle(title);
	}

	@Override
	public List<BookDTO> searchAuthor(String author) throws Exception {
		return dao.searchAuthor(author);
	}

	@Override
	public List<BookDTO> searchPublisher(String publisher) throws Exception {
		return dao.searchPublisher(publisher);
	}

	@Override
	public List<BookDTO> searchStory(String story) throws Exception {
		return dao.searchStory(story);
	}
	
	@Override
	public BookDTO searchBookInfo(String isbn) throws Exception {
		return dao.searchBookInfo(isbn);
	}

	@Override
	public BookPageDTO selectTitlePages(String title, int curPage, int perPage) throws Exception {
		return dao.selectTitlePages(title, curPage, perPage);
	}

	@Override
	public BookPageDTO selectAuthorPages(String author, int curPage, int perPage) throws Exception {
		return dao.selectAuthorPages(author, curPage, perPage);
	}

	@Override
	public BookPageDTO selectPublisherPages(String publisher, int curPage, int perPage) throws Exception {
		return dao.selectPublisherPages(publisher, curPage, perPage);
	}

	@Override
	public BookPageDTO selectStoryPages(String story, int curPage, int perPage) throws Exception {
		return dao.selectStoryPages(story, curPage, perPage);
	}

}
