package com.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;
import com.service.member.MemberServiceImpl;

import api.data.transform.RequestTransformer;
import api.data.transform.Transformer;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberDTO memberDTO = new MemberDTO();
		Transformer trans = new RequestTransformer(request);
		trans.setMappingDTO(memberDTO);
		
		MemberService service = new MemberServiceImpl();
		String nextPage = "";
		try {
			int num = service.join(memberDTO);
			nextPage = "MainServlet";
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
