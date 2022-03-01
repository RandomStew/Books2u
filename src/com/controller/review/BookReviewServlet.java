package com.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.book.BookDTO;
import com.dto.review.ReviewPageDTO;
import com.service.review.ReviewService;
import com.service.review.ReviewServiceImpl;


@WebServlet("/BookReviewServlet")
public class BookReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService service = new ReviewServiceImpl();
		String curPage = (String)request.getAttribute("curPage");
		String isbn = ((BookDTO)request.getAttribute("book")).getIsbn();
		if(curPage == null) {
			curPage = "1";
		}
		String nextPage = "";
		try {
			ReviewPageDTO pageDTO = service.selectAllPages(Integer.parseInt(curPage), isbn);
			request.setAttribute("reviewPageDTO", pageDTO);
			nextPage = "bookInfo.jsp";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			nextPage = "error/error.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
