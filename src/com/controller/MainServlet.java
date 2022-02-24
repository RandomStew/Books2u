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

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;


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
		
		// 임시 CartDTO
		CartDTO cDTO1 = new CartDTO("abc", "9791197010965", "게이트 (팬데믹 미스터리)", "심채윤", "껴안음", 16000, 1);
		CartDTO cDTO2 = new CartDTO("abc", "9791187822653", "욤 키푸르 전쟁 (중동의 판도를 바꾼 제4차 중동전쟁)", "아브라함 라비노비치", "플래닛미디어", 35000, 2);
		CartDTO cDTO3 = new CartDTO("abc", "9788999725814", "친밀감의 딜레마 (L 박사의 심리치료 이야기)", "데보라 안나 루에프니츠", "학지사", 16000, 1);
		CartDTO cDTO4 = new CartDTO("abc", "9791161756165", "디지털 트윈 개발 및 클라우드 배포 (Simulink, Simscape, AWS를 활용해 클라우드 기반 다이나믹 모델 개발하기)", "나심 칼레드|비빈 파텔|아판 시디키", "에이콘출판", 45000, 1);
		
		List<CartDTO> cartList = new ArrayList<CartDTO>() ;
		cartList.add(cDTO1);
		cartList.add(cDTO2);
		cartList.add(cDTO3);
		cartList.add(cDTO4);
		
		
		session.setAttribute("login", mDTO);
		session.setAttribute("cartList", cartList);

		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
