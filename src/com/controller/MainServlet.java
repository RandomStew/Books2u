package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dto.book.BookDTO;
import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;


@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		////////////////////////////////////////////
		// 임시 큐레이션 데이터
		BookService service = new BookServiceImpl();
		try {
			List<BookDTO> list = service.searchStory("이");
			request.setAttribute("curationList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/////////////////////////////////////////////////////
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
