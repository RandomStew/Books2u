package com.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			return "redirect:loginUI";
		List<CartDTO> cartList = service.showCartList(memberDTO.getUserId());
		m.addAttribute("cartList", cartList);
		return "cartList";
	}
	
	
	// 장바구니에 추가하기 (Ajax)
	@PostMapping("/cartAdd")
	@ResponseBody
	public int cartAdd(CartDTO cartDTO) throws Exception {
		int num = service.addToCart(cartDTO);
		return num;
	}
	
	// 장바구니 수량 수정
	@PostMapping("/cartAmountUpdate")
	@ResponseBody
	public int cartAmountUpdate(CartDTO cartDTO, HttpSession session) throws Exception {
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		cartDTO.setUserId(login.getUserId());
		System.out.println(cartDTO);
		int num = service.updateBookAmount(cartDTO);
		return num;
	}
	
	// 장바구니 삭제
	@GetMapping("/cartDel")
	public String cartDel(@RequestParam("isbn") List<String> isbns, HttpSession session) throws Exception {
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		for(String isbn : isbns) {
			Map<String, String> map = new HashMap<>();
			map.put("userId", login.getUserId());
			map.put("isbn", isbn);
			service.delToCart(map);
		}
		return "redirect:cartList";
	}
	
	// 장바구니 모두 삭제
	@GetMapping("/cartDelAll")
	public String cartDelAll(HttpSession session) throws Exception {
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		service.delToCartAll(login.getUserId());
		return "redirect:cartList";
	}
	
	
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}
