package com.controller.order;

import java.io.Console;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/OrderListServlet")
public class OrderListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*
		 * String [] orderList = request.getParameterValues("check"); List<String>
		 * listToOrder = Arrays.asList(orderList);
		 * 
		 * HttpSession session = request.getSession();
		 * 
		 * //-------------------------여기서부터 작성해야함
		 * 
		 * 
		 * 
		 * 
		 * 
		 * for(String olist : listToOrder) { System.out.println(olist); }
		 */
		
		response.sendRedirect("orderList.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
