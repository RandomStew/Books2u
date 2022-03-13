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


@WebServlet("/BookReviewUpdateServlet")
public class BookReviewUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ReviewService service = new ReviewServiceImpl();
		Transformer trans = new RequestTransformer(request);
		ReviewDTO reviewDTO = new ReviewDTO();
		trans.setMappingDTO(reviewDTO);
		System.out.println(reviewDTO);
		String answer = "";
		
		int num = 0;
		try {
			num = service.updateReview(reviewDTO);
			if(num > 0) answer="성공";
			else if (num == 0) answer = "실패";
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(answer);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
