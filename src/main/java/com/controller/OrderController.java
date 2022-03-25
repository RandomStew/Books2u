package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.dto.order.OrderDTO;
import com.service.book.BookService;
import com.service.cart.CartService;
import com.service.order.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	BookService bookService;
	
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
	
	@GetMapping("/directOrder")
	public String directOrder(CartDTO cartDTO, Model m) {
		List<CartDTO> cartList = new ArrayList<>();
		cartList.add(cartDTO);
		m.addAttribute("orderList", cartList);
		return "orderConfirm";
	}
	
	@PostMapping("/orderDone")
	public String orderDone(HttpSession session,
							@RequestParam("isbn") List<String> isbns,
							RedirectAttributes flash,
							OrderDTO orderDTO) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		List<OrderDTO> orderList = new ArrayList<>();
		
		int totalSum = 0;
		for(String isbn : isbns) {
			Map<String, String> map = new HashMap<>();
			map.put("userId", login.getUserId());
			map.put("isbn", isbn);
			CartDTO cartDTO = cartService.showCartListByIsbn(map);
			orderDTO.setIsbn(cartDTO.getIsbn());
			orderDTO.setTitle(cartDTO.getTitle());
			orderDTO.setAuthor(cartDTO.getAuthor());
			orderDTO.setPublisher(cartDTO.getPublisher());
			orderDTO.setPrice(cartDTO.getPrice());
			orderDTO.setAmount(cartDTO.getAmount());
			totalSum += cartDTO.getAmount() * cartDTO.getPrice();
			orderList.add(orderDTO);
		}
		
		int n = orderService.orderDone(orderList);
		if(n > 0) {
			for(String isbn : isbns) {
				Map<String, String> map = new HashMap<>();
				map.put("userId", login.getUserId());
				map.put("isbn", isbn);
				cartService.delToCart(map);
			}
		}
		return "redirect:orderDoneUI";
	}
	
	@GetMapping("/orderDoneUI")
	public String orderDoneUI(HttpSession session, Model m) throws Exception {
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		List<OrderDTO> orderList = orderService.orderList(login.getUserId());
		m.addAttribute("orderList", orderList);
		return "orderDone";
	}
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}