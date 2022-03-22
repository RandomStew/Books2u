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

import com.dto.book.BookDTO;
import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;


@WebServlet("/OrderConfirmServlet")
public class OrderConfirmServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		
		String nextPage = "";
		
		try {
			String [] check = request.getParameterValues("check");
			String individual = request.getParameter("isbn");
			List<CartDTO> found = new ArrayList<CartDTO>();
			
			if(check == null) {
				BookService service = new BookServiceImpl();
				BookDTO bookDTO = service.searchBookInfo(individual);
				CartDTO cartDTO = new CartDTO();
				cartDTO.setUserId(memberDTO.getUserId());
				cartDTO.setIsbn(bookDTO.getIsbn());
				cartDTO.setAuthor(bookDTO.getAuthor());
				cartDTO.setPrice(bookDTO.getPrice());
				cartDTO.setTitle(bookDTO.getTitle());
				cartDTO.setPublisher(bookDTO.getPublisher());
				cartDTO.setAmount(Integer.parseInt(request.getParameter("cart_amount")));
				
				found.add(cartDTO);
				
			} else {
				List<String> listToOrder = null;
				listToOrder = Arrays.asList(check);
				List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
				
				for(String isbn : listToOrder) {
					for(CartDTO cartDTO : cartList) {
						if(cartDTO.getIsbn().equals(isbn)) {
							found.add(cartDTO);
						}
					}
				}
				
			}
			
			request.setAttribute("orderList", found);
			nextPage = "orderConfirm.jsp";
			
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
