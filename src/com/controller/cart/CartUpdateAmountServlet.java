package com.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.cart.CartDTO;

import api.data.transform.RequestTransformer;
import api.data.transform.Transformer;


@WebServlet("/CartUpdateAmountServlet")
public class CartUpdateAmountServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Transformer trans = new RequestTransformer(request);
		CartDTO cartDTO = new CartDTO();
		trans.setMappingDTO(cartDTO);
		
		HttpSession session = request.getSession();
		List<CartDTO> cartList = (List<CartDTO>)session.getAttribute("cartList");
		addDTO(cartList, cartDTO);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	
	private void addDTO(List<CartDTO> list, CartDTO dto) {
		for(int i = 0; i < list.size(); ++i) {
			if(list.get(i).getIsbn().equals(dto.getIsbn())) {
				list.get(i).setAmount(list.get(i).getAmount()+dto.getAmount());
				return;
			}
		}
		list.add(dto);
	}

}
