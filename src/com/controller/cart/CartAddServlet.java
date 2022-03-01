package com.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;

import api.data.transform.RequestTransformer;
import api.data.transform.SessionTransformer;
import api.data.transform.Transformer;


@WebServlet("/CartAddServlet")
public class CartAddServlet extends HttpServlet {
	
	private Logger logger = LoggerFactory.getLogger(CartAddServlet.class);
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nextPage = "";
		
		CartDTO cartDTO = new CartDTO();
		ArrayList<CartDTO> newCartList = null;

		Transformer trans = new RequestTransformer(request);
		trans.setMappingDTO(cartDTO);
		logger.debug("CartDTO: " +  cartDTO);
		Object oldCartList = session.getAttribute("cartList");
		
		try {
			
			if(oldCartList == null) { 
				//장바구니가 비어있는 경우 새로운 List생성
				newCartList = new ArrayList<CartDTO>();
			} else {
				//장바구니에 상품이 있는 경우 기존 상품을 Arraylist로 형번환
				newCartList = (ArrayList<CartDTO>) oldCartList;
			}
			
			//기존 장바구니에 동일한 상품 존재 여부 확인--------------------------------------------------------
			
			checkInCart(newCartList, cartDTO);
			
		} catch(Exception e) {
			e.printStackTrace();
			nextPage = "error/error.jsp";
			response.getWriter().print(-1);
			response.sendRedirect(nextPage);
		}
			
		
		
		int cartSumAmount = sumTotalAmount(newCartList);
		//session정보 업데이트---------------------------------------------------------------------
		session.setAttribute("cartList", newCartList);
		session.setAttribute("cartSumAmount", cartSumAmount);
		request.setAttribute("cartDTO", cartDTO);
		response.getWriter().print(1);
		//response.sendRedirect(nextPage);
		//request.getRequestDispatcher(nextPage).forward(request, response);
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	// 장바구니 담긴 전체 수량 더하는 함수
	private int sumTotalAmount(ArrayList<CartDTO> list) {
		int cartSumAmount = 0;
		for(CartDTO item: list) {
			cartSumAmount += item.getAmount();
		}
		return cartSumAmount;
	}
	
	// 장바구니 동일상품 존재 여부
	private void checkInCart(ArrayList<CartDTO> cartList, CartDTO cartDTO) {
		int checkInCart = -1; //장바구니에 동일한 제품이 없는 경우로 초기화
		
		//기존 장바구니에 동일한 제품이 있는 경우 : 수량만 업데이트
		for(CartDTO item : cartList) {
			if(item.getIsbn().equals(cartDTO.getIsbn())) {
				checkInCart = 1; // 장바구니에 동일한 상품 존재
				item.setAmount(item.getAmount()+cartDTO.getAmount());
			}
		}
		
		//기존 장바구니에 제품이 없는 경우 : list에 추가
		if(checkInCart == -1) {
			cartList.add(cartDTO);
		}
	}
	

}
