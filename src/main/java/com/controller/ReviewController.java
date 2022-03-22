package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.book.BookDTO;
import com.dto.review.ReviewPageDTO;
import com.service.review.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@GetMapping("/bookReview")
	public String bookReview(BookDTO book,
							 @RequestParam(value="curPage", required=false, defaultValue="1") String curPage,
							 Model m) throws Exception {
		
		ReviewPageDTO pageDTO = service.selectAllPages(Integer.parseInt(curPage), book.getIsbn());
		m.addAttribute("reviewPageDTO", pageDTO);
		return "bookInfo";
	}
	
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}
