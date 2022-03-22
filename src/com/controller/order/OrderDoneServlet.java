package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.dto.order.OrderDTO;
import com.service.order.OrderService;
import com.service.order.OrderServiceImpl;

import api.data.transform.RequestTransformer;
import api.data.transform.SessionTransformer;
import api.data.transform.Transformer;


@WebServlet("/OrderDoneServlet")
public class OrderDoneServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String nextPage = "";
		
		if(memberDTO != null) {
			String [] itemToOrder = request.getParameterValues("isbn");
			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
			Transformer trans = new RequestTransformer(request);
			
			try {
				int orderSumAmount = 0;
				//주문자 정보
				for(String isbn : itemToOrder) {
					OrderDTO orderDTO = new OrderDTO();
					trans.setMappingDTO(orderDTO);
					orderDTO.setIsbn(isbn);
					orderDTO.setTitle(request.getParameter("hiddenTitle"+isbn));
					orderDTO.setAuthor(request.getParameter("hiddenAuthor"+isbn));
					orderDTO.setPublisher(request.getParameter("hiddenPublisher"+isbn));
					orderDTO.setPrice(Integer.parseInt(request.getParameter("hiddenPrice"+isbn)));
					orderDTO.setAmount(Integer.parseInt(request.getParameter("hiddenAmount"+isbn)));
					orderList.add(orderDTO);
					
					orderSumAmount += orderDTO.getAmount();
				}
				
				
				OrderService service = new OrderServiceImpl();
				
				int n = service.orderDone(orderList);
				List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
				
				if(n > 0 && cartList != null) {
					List<CartDTO> found = new ArrayList<CartDTO>();
					
					for(String isbn : itemToOrder) {
						for(CartDTO cartDTO : cartList) {
							if(cartDTO.getIsbn().equals(isbn)) {
								found.add(cartDTO);
							}
						}
					}
					cartList.removeAll(found);
				}
				
				int oldCartSumAmount = (int) session.getAttribute("cartSumAmount");
				int newCartSumAmount = oldCartSumAmount - orderSumAmount;
				if(newCartSumAmount<0){
					newCartSumAmount = 0;
				}
				session.setAttribute("cartSumAmount",newCartSumAmount);
				request.setAttribute("orderList", orderList);
				request.setAttribute("orderSumAmount", orderSumAmount);
				
				nextPage = "orderDone.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				nextPage = "error/error.jsp";
			}
		
		} else {
			nextPage="member/sessionInvalidate.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
