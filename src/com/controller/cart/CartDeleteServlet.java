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
		
		// 삭제할 상품 가져오기
		String [] check = request.getParameterValues("check");
		String individual = request.getParameter("isbn");
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String nextPage = "";
		
		if(memberDTO != null) {
			
			//삭제 할 isbn list
			List<String> isbnToDelete = null;
			
			if(check == null) {
				isbnToDelete = Arrays.asList(individual);
			} else {
				isbnToDelete = Arrays.asList(check);
			}
			
			int cartSumAmount = (int) session.getAttribute("cartSumAmount");
			List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
			
			
			try {
				// 삭제할 CartDTO
				List<CartDTO> listToDelete = new ArrayList<CartDTO>();		
				for(String isbn : isbnToDelete) {
					for(CartDTO cartDTO : cartList) {
						if(cartDTO.getIsbn().equals(isbn)) {
							listToDelete.add(cartDTO);
							cartSumAmount -= cartDTO.getAmount();
						}
					}
				}
					
				cartList.removeAll(listToDelete);
				session.setAttribute("cartSumAmount", cartSumAmount);
				nextPage = "CartListServlet";
				
			} catch (Exception e) {
				e.printStackTrace();
				nextPage = "error/error.jsp";
				
			}
		} else {
			response.sendRedirect("member/sessionInvalidate.jsp");
		}
		
		response.sendRedirect(nextPage);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
