package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;
import com.service.member.MemberServiceImpl;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String passWd = request.getParameter("passWd");

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("userId", userId);
		hashMap.put("passWd", passWd);

		MemberService service = new MemberServiceImpl();
		String nextPage = "";
		try {
			MemberDTO memberDTO = service.login(hashMap);
			if (memberDTO != null) {
				HttpSession session = request.getSession();
				session.setAttribute("login", memberDTO);
				nextPage = request.getParameter("prevPage");
			} else {
				nextPage = "member/loginFail.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			nextPage = "error/error.jsp";
		}

		response.sendRedirect(nextPage);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
