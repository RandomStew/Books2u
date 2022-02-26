package com.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;
import com.service.member.MemberServiceImpl;

@WebServlet("/MyPageUpdateServlet")
public class MyPageUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO) session.getAttribute("login");

		String nextPage = "";
		if (login != null) {
			String userId = request.getParameter("userId");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String post = request.getParameter("post");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");

			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setUserId(userId);
			memberDTO.setPhone1(phone1);
			memberDTO.setPhone2(phone2);
			memberDTO.setPhone3(phone3);
			memberDTO.setPost(post);
			memberDTO.setAddr1(addr1);
			memberDTO.setAddr2(addr2);
			memberDTO.setAddr3(addr3);
			memberDTO.setEmail1(email1);
			memberDTO.setEmail2(email2);

			MemberService service = new MemberServiceImpl();
			try {
				int num = service.updateMyPage(memberDTO);
				nextPage = "MyPageServlet";
			} catch (Exception e) {
				e.printStackTrace();
				nextPage = "error/error.jsp";
			}
		} else {
			nextPage = "member/sessionInvalidate.jsp";
		}

		request.getRequestDispatcher(nextPage).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
