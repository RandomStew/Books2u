package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;
import com.service.member.MemberServiceImpl;

@WebServlet("/IdDuplicateCheckServlet")
public class IdDuplicateCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId").trim();

		MemberService service = new MemberServiceImpl();
		String message = "";
		try {
			MemberDTO memberDTO = service.checkIdDuplicate(userId);
			if (memberDTO == null) {
				message = "아이디 사용 가능";
			} else {
				message = "아이디 중복";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
