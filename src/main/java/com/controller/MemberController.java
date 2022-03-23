package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.member.MemberDTO;
import com.dto.order.OrderDTO;
import com.service.member.MemberService;
import com.service.order.OrderService;

@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/loginUI")
	public String loginUI() throws Exception {
		return "member/loginForm";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam HashMap<String, String> map, HttpSession session) throws Exception {
		MemberDTO memberDTO = memberService.login(map);
		if(memberDTO != null) {
			session.setAttribute("login", memberDTO);
			session.setAttribute("cartSumAmount", 0);
			String prevPage = map.get("prevPage");
			return "redirect:"+prevPage;
		}
		return "member/loginFail";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	@GetMapping("/joinUI")
	public String joinUI() {
		return "joinForm";
	}
	
	@PostMapping("/join")
	public String join(MemberDTO memberDTO) throws Exception {
		int num = memberService.join(memberDTO);
		return "redirect:loginUI";
	}
	
	/*
	 * 조만간 session 없애야함
	 */
	@GetMapping("/myPage")
	public String myPage(HttpSession session) throws Exception {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userId = login.getUserId();
		List<OrderDTO> orderList = orderService.orderList(userId);
		session.setAttribute("login", login);
		session.setAttribute("orderList", orderList);
		return "myPage";
	}
	
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
	

}
