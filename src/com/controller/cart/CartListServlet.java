package com.controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.member.MemberDTO;


@WebServlet("/CartListServlet")
public class CartListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String nextPage = "";
		
		if(dto != null) {
			// 임시-- cart는 DB에 저장되지 않으니까
			session.getAttribute("cartList");
			nextPage = "cartList.jsp";
			
			
		} else {
			nextPage = "member/sessionInvalidate.jsp";
		}
		
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
