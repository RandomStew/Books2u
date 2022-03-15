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

import com.dto.curation.CurationDTO;
import com.service.book.BookService;
import com.service.book.BookServiceImpl;
import com.service.curation.CurationService;
import com.service.curation.CurationServiceImpl;


@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		////////////////////////////////////////////
		// 장르: 소설, 시에세이, 여행, 역사문화, 정치사회, 건강, 경제경영, 인문, 예술대중문화
		// 큐레이션 데이터
		CurationService service = new CurationServiceImpl();
		try {
			List<CurationDTO> novelList = service.selectList("소설");
			List<CurationDTO> artList = service.selectList("예술대중문화");
			List<CurationDTO> cookList = service.selectList("요리");

			request.setAttribute("novelList", new ArrayList(novelList.subList(0, getCurationMaxSize(novelList))));
			request.setAttribute("artList", new ArrayList(artList.subList(0, getCurationMaxSize(artList))));
			request.setAttribute("cookList", new ArrayList(cookList.subList(0, getCurationMaxSize(cookList))));
			
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

	private int getCurationMaxSize(List<CurationDTO> list) {
		return Integer.min(list.size(), 5);
	}
}
