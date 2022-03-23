package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.cart.CartService;
import com.service.order.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/orderConfirm")
	public String orderConfirm(HttpSession session,
							   @RequestParam("isbn") List<String> isbns,
							   Model m) throws Exception {
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		List<CartDTO> cartList = cartService.showCartList(login.getUserId());
		
		List<CartDTO> found = new ArrayList<CartDTO>();
		for(String isbn : isbns) {
			for(CartDTO cartDTO : cartList) {
				if (cartDTO.getIsbn().equals(isbn)) {
					found.add(cartDTO);
				}
			}
		}
		m.addAttribute("orderList", found);
		return "orderConfirm";
	}
	
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}