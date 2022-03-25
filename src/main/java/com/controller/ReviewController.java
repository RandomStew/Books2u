package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.book.BookDTO;
import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;
import com.service.review.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	
	@GetMapping("/bookReview")
	public String bookReview(BookDTO book,
							 @RequestParam(value="curPage", required=false, defaultValue="1") String curPage,
							 Model m) throws Exception {
		
		ReviewPageDTO pageDTO = reviewService.selectAllPages(Integer.parseInt(curPage), book.getIsbn());
		m.addAttribute("reviewPageDTO", pageDTO);
		return "bookInfo";
	}
	
	
	@PostMapping("/bookReviewAdd")
	public String bookReviewAdd(ReviewDTO reviewDTO) throws Exception {
		int num = reviewService.addReview(reviewDTO);
		return "redirect:bookInfo?isbn="+reviewDTO.getIsbn();
	}
	
	
	@GetMapping("/bookReviewUpdateUI")
	public String bookReviewUpdateUI(@RequestParam("reviewId") String reviewId, Model m) {
		m.addAttribute("reviewId", reviewId);
		return "review/BookReviewUpdateForm";
	}
	
	
	@PostMapping("/bookReviewUpdate")
	@ResponseBody
	public String bookReviewUpdate(ReviewDTO reviewDTO) throws Exception {
		int num = reviewService.updateReview(reviewDTO);
		return "성공";
	}
	
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}