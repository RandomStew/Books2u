package com.controller.review;

import java.io.IOException;

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


@WebServlet("/BookReviewUpdateServlet")
public class BookReviewUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ReviewService service = new ReviewServiceImpl();
		Transformer trans = new RequestTransformer(request);
		ReviewDTO reviewDTO = new ReviewDTO();
		trans.setMappingDTO(reviewDTO);
		System.out.println(reviewDTO);
		String nextPage = "";
		int num = 0;
		try {
			num = service.updateReview(reviewDTO);
			nextPage = "MainServlet";
		} catch (Exception e) {
			e.printStackTrace();
			nextPage = "error/error.jsp";
		}
		response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
