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

//		String userId = request.getParameter("userId");
//		String passWd = request.getParameter("passWd");
//		String userName = request.getParameter("userName");
//		String ssn1 = request.getParameter("ssn1");
//		String ssn2 = request.getParameter("ssn2");
//		String phone1 = request.getParameter("phone1");
//		String phone2 = request.getParameter("phone2");
//		String phone3 = request.getParameter("phone3");
//		String post = request.getParameter("post");
//		String addr1 = request.getParameter("addr1");
//		String addr2 = request.getParameter("addr2");
//		String addr3 = request.getParameter("addr3");
//		String email1 = request.getParameter("email1");
//		String email2 = request.getParameter("email2");
//
//		MemberDTO dto = new MemberDTO(userId, passWd, userName, ssn1, ssn2, phone1, phone2, phone3, post, addr1, addr2, addr3, email1, email2, null, null);
		MemberDTO dto = new MemberDTO();
		Transformer trans = new RequestTransformer(request);
		trans.setMappingDTO(dto);
		
		
		MemberService service = new MemberServiceImpl();
		String nextPage = "";
		try {
			int num = service.join(dto);
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
