package com.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.book.BookDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;


@WebServlet("/BookInfoServlet")
public class BookInfoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String isbn = request.getParameter("isbn");
		String curPage = request.getParameter("curPage");
		BookService service = new BookServiceImpl();
		String nextPage = "";
		try {
			BookDTO bookDTO = service.searchBookInfo(isbn);
			request.setAttribute("book", bookDTO);
			request.setAttribute("curPage", curPage);
			nextPage = "BookReviewServlet";
		} catch (Exception e) {
			e.printStackTrace();
			nextPage = "error/error.jsp";
		} 
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
