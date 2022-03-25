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
	
	// 장바구니 => 주문하기
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
		m.addAttribute("isDirect", false);
		return "orderConfirm";
	}
	
	// bookinfo => 주문하기
	@GetMapping("/directOrder")
	public String directOrder(CartDTO cartDTO, Model m) {
		List<CartDTO> cartList = new ArrayList<>();
		cartList.add(cartDTO);
		m.addAttribute("orderList", cartList);
		m.addAttribute("isDirect", true);
		return "orderConfirm";
	}
	
	// 주문 처리하고 주문목록 등록
	@PostMapping("/orderDone")
	public String orderDone(HttpSession session,
							@RequestParam("isbn") List<String> isbns,
							@RequestParam("title") List<String> titles,
							@RequestParam("author") List<String> authors,
							@RequestParam("publisher") List<String> publishers,
							@RequestParam("price") List<Integer> prices,
							@RequestParam("amount") List<Integer> amounts,
							@RequestParam("isDirect") boolean isDirect,
							RedirectAttributes flash,
							OrderDTO orderDTO) throws Exception {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		List<OrderDTO> orderList = new ArrayList<>();
		
		int totalSum = 0;
		for(int i = 0; i < isbns.size(); ++i) {
			orderDTO.setIsbn(isbns.get(i));
			orderDTO.setTitle(titles.get(i));
			orderDTO.setAuthor(authors.get(i));
			orderDTO.setPublisher(publishers.get(i));
			orderDTO.setPrice(prices.get(i));
			orderDTO.setAmount(amounts.get(i));
			totalSum += prices.get(i) * amounts.get(i);
			orderList.add(orderDTO);
		}
		
		int n = orderService.orderDone(orderList);
		if(n > 0 && isDirect == false) {
			for(String isbn : isbns) {
				Map<String, String> map = new HashMap<>();
				map.put("userId", login.getUserId());
				map.put("isbn", isbn);
				cartService.delToCart(map);
			}
		}
		flash.addFlashAttribute("orderList", orderList);
		return "redirect:orderDoneUI";
	}
	
	
	@GetMapping("/orderDoneUI")
	public String orderDoneUI(HttpServletRequest request, HttpSession session, Model m) throws Exception {
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		List<OrderDTO> orderList = (List<OrderDTO>)flashMap.get("orderList");
		m.addAttribute("orderList", orderList);
		return "orderDone";
	}
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
}