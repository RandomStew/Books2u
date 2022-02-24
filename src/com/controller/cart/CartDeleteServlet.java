package com.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;


@WebServlet("/CartDeleteServlet")
public class CartDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String [] check = request.getParameterValues("check");

		
		List<String> list = Arrays.asList(check);
		
		HttpSession session = request.getSession();
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String nextPage = "";
		
		if(memberDTO != null) {
			List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
			List<CartDTO> found = new ArrayList<CartDTO>();
			
			for(String isbn : list) {
				for(CartDTO cDTO : cartList) {
					if(cDTO.getIsbn().equals(isbn)) {
						found.add(cDTO);
					}
				}
			}
			
			cartList.removeAll(found);
			nextPage = "CartListServlet";
			
		} else {
			nextPage = "member/sessionInvalidate.jsp";
		}
		
		response.sendRedirect(nextPage);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
