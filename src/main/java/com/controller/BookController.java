package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.book.BookDTO;
import com.dto.book.BookPageDTO;
import com.service.book.BookService;

@Controller
public class BookController {

	@Autowired
	BookService service;
	
	@GetMapping("/searchList")
	public String searchList(@RequestParam("search") String search,
							 @RequestParam("type") String type,
							 @RequestParam(value="curPage", required = false, defaultValue = "1") String curPage,
							 Model m) throws Exception {
		BookPageDTO pageDTO = null;
		int perPage =4;
		if (type.equals("title")) {
			pageDTO = service.selectTitlePages(search, Integer.parseInt(curPage), perPage);
		} else if (type.equals("author")) {
			pageDTO = service.selectAuthorPages(search, Integer.parseInt(curPage), perPage);
		} else if (type.equals("publisher")) {
			pageDTO = service.selectPublisherPages(search, Integer.parseInt(curPage), perPage);
		} else if (type.equals("story")) {
			pageDTO = service.selectStoryPages(search, Integer.parseInt(curPage), perPage);
		}
		m.addAttribute("pageDTO", pageDTO);
		m.addAttribute("title", search);
		m.addAttribute("type", type);
		return "searchList";
	}
	
	@GetMapping("/bookInfo")
	public String bookInfo(@RequestParam(value="isbn") String isbn,
						   @RequestParam(value="curPage", required=false) String curPage,
						   Model m) throws Exception {
		BookDTO bookDTO = service.searchBookInfo(isbn);
		m.addAttribute("book", bookDTO);
		m.addAttribute("curPage", curPage);
		return "forward:bookReview";
	}
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}
