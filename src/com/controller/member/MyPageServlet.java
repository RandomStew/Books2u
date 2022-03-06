package com.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.member.MemberDTO;
import com.dto.order.OrderDTO;
import com.service.member.MemberService;
import com.service.member.MemberServiceImpl;
import com.service.order.OrderService;
import com.service.order.OrderServiceImpl;

@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		String nextPage = "";
		if (login != null) {
			nextPage = "myPage.jsp";
			String userId = login.getUserId();
			MemberService memberService = new MemberServiceImpl();
			OrderService orderService = new OrderServiceImpl();
			try {
				MemberDTO memberDTO = memberService.selectMyPage(userId);
				List<OrderDTO> orderList = orderService.orderList(userId);
				session.setAttribute("login", memberDTO);
				session.setAttribute("orderList", orderList);
			} catch (Exception e) {
				nextPage = "error/error.jsp";
				e.printStackTrace();
			}
		} else {
			nextPage = "member/sessionInvalidate.jsp";
		}

		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
