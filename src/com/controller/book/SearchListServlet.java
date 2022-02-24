package com.controller.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.book.BookDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;


@WebServlet("/SearchListServlet")
public class SearchListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("search");
		System.out.println(title);
		BookService service = new BookServiceImpl();
		String next = "";
		try {
			List<BookDTO> list = service.search(title);
			System.out.println(list);
			request.setAttribute("bookList", list);
			request.setAttribute("title", title);
			next = "searchList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			next = "error/error.jsp";
			
		}
		request.getRequestDispatcher(next).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
