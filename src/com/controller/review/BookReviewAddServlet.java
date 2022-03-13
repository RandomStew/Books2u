package com.controller.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.review.ReviewDTO;
import com.service.review.ReviewService;
import com.service.review.ReviewServiceImpl;

import api.data.transform.RequestTransformer;
import api.data.transform.Transformer;


@WebServlet("/BookReviewAddServlet")
public class BookReviewAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Transformer trans = new RequestTransformer(request);
		ReviewDTO reviewDTO = new ReviewDTO();
		trans.setMappingDTO(reviewDTO);
		ReviewService service = new ReviewServiceImpl();
		int num = 0;
		try {
			num = service.addReview(reviewDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("BookInfoServlet?isbn="+reviewDTO.getIsbn());
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
