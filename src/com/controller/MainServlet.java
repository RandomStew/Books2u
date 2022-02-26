package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.book.BookDTO;
import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;



@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		// 임시 MemberDTO
		MemberDTO mDTO = new MemberDTO();
		mDTO.setUserId("abc");
		mDTO.setPassWd("123");
		mDTO.setUserName("jaengs");
		mDTO.setSsn1("980425");
		mDTO.setSsn2("2000000");
		mDTO.setPhone1("010");
		mDTO.setPhone2("9864");
		mDTO.setPhone3("7374");
		mDTO.setPost("20054");
		mDTO.setAddr1("서울시");
		mDTO.setAddr2("동대문구");
		mDTO.setAddr3("빌라3층");
		mDTO.setEmail1("jaengsjaengs");
		mDTO.setEmail2("@naver.com");
		mDTO.setJoinDate("19980903");
		mDTO.setLastDate("20220202");
		

		List<CartDTO> cartList = new ArrayList<CartDTO>() ;
		
		session.setAttribute("cartList", cartList);
		
		////////////////////////////////////////////
		// 임시 큐레이션 데이터
		BookService service = new BookServiceImpl();
		try {
			List<BookDTO> list = service.searchStory("이");
			request.setAttribute("curationList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/////////////////////////////////////////////////////
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
