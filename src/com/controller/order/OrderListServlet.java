package com.controller.order;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;


@WebServlet("/OrderListServlet")
public class OrderListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		List<CartDTO> carList = (List<CartDTO>) session.getAttribute("cartList");
		String nextPage = "";
		
			
		try {
			String [] orderList = request.getParameterValues("check"); 
			List<String> listToOrder = Arrays.asList(orderList);
			
			List<CartDTO> found = new ArrayList<CartDTO>();
			
			for(String isbn : listToOrder) {
				for(CartDTO cartDTO : carList) {
					if(cartDTO.getIsbn().equals(isbn)) {
						found.add(cartDTO);
					}
				}
			}
			request.setAttribute("orderList", found);
			nextPage = "orderList.jsp";
			
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
