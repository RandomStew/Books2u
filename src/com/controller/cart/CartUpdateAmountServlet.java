package com.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;

import api.data.transform.RequestTransformer;
import api.data.transform.Transformer;


@WebServlet("/CartUpdateAmountServlet")
public class CartUpdateAmountServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		
		if(memberDTO != null) {
			String isbn = request.getParameter("isbn");
			int amount = Integer.parseInt(request.getParameter("amount"));
			int AscOrDesc = Integer.parseInt(request.getParameter("AscOrDesc"));
			
			int cartSumAmount = (int) session.getAttribute("cartSumAmount");
			session.setAttribute("cartSumAmount", cartSumAmount+AscOrDesc);
			
			
			ArrayList<CartDTO> cartList = (ArrayList<CartDTO>) session.getAttribute("cartList");
			
			// 후에 고민해볼 것 ----------------------------------------------------------------------
			for(CartDTO item : cartList) {
				if(item.getIsbn().equals(isbn)) {
					item.setAmount(amount);
				}
			}
			session.setAttribute("cartList", cartList);
			
		} else {
			response.sendRedirect("member/sessionInvalidate.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	
	

}
