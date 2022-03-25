package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dto.member.MemberDTO;
import com.service.cart.CartService;


@Component("CountHandlerInterceptor")
public class CountHandlerInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	CartService cartService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		session.setAttribute("cartSumAmount", cartService.showCartList(dto.getUserId()).size());
	}
	
	
	
}
