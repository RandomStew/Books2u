package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.cart.CartService;

@Controller
public class CartController {

	@Autowired
	CartService service;
	
	@GetMapping("/cartList")
	public String cartList(HttpSession session, Model m) throws Exception {
		
		// 로그인 체크
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		if(memberDTO == null)
			return "loginUI";
		List<CartDTO> cartList = service.showCartList(memberDTO.getUserId());
		m.addAttribute("cartList", cartList);
		return "cartList";
	}
	
	
}
