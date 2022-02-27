package com.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.book.BookPageDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;


@WebServlet("/SearchListServlet")
public class SearchListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search = request.getParameter("search");
		String type =  request.getParameter("type");
		String curPage = request.getParameter("curPage");
		if(curPage == null) {
			curPage = "1";
		}
		int perPage = 4;
		BookService service = new BookServiceImpl();
		String nextPage = "";
		try {
			BookPageDTO pageDTO = new BookPageDTO();
			if (type.equals("title")) {
				pageDTO = service.selectTitlePages(search,
						   Integer.parseInt(curPage),
						   perPage);
			} else if (type.equals("author")) {
				pageDTO = service.selectAuthorPages(search,
						   Integer.parseInt(curPage),
						   perPage);
			} else if (type.equals("publisher")) {
				pageDTO = service.selectPublisherPages(search,
						   Integer.parseInt(curPage),
						   perPage);
			} else if (type.equals("story")) {
				pageDTO = service.selectStoryPages(search,
						   Integer.parseInt(curPage),
						   perPage);
			}

			request.setAttribute("pageDTO", pageDTO);
			request.setAttribute("title", search);
			request.setAttribute("type", type);
			nextPage = "searchList.jsp";
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
