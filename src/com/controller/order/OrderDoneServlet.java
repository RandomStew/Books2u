package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.member.Auth;
import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.dto.order.OrderDTO;
import com.service.order.OrderService;
import com.service.order.OrderServiceImpl;

import api.data.transform.RequestTransformer;
import api.data.transform.SessionTransformer;
import api.data.transform.Transformer;

@WebServlet("/OrderDoneServlet")
public class OrderDoneServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		String nextPage = "";

		if (memberDTO != null) {
			String[] itemToOrder = request.getParameterValues("isbn");
			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
			Transformer trans = new RequestTransformer(request);

			try {
				int orderSumAmount = 0;
				int totalSum = 0;

				for (String isbn : itemToOrder) {
					OrderDTO orderDTO = new OrderDTO();
					trans.setMappingDTO(orderDTO);
					orderDTO.setIsbn(isbn);
					orderDTO.setTitle(request.getParameter("hiddenTitle" + isbn));
					orderDTO.setAuthor(request.getParameter("hiddenAuthor" + isbn));
					orderDTO.setPublisher(request.getParameter("hiddenPublisher" + isbn));
					int bookPrice = Integer.parseInt(request.getParameter("hiddenPrice" + isbn));
					orderDTO.setPrice(bookPrice);
					int bookAmount = Integer.parseInt(request.getParameter("hiddenAmount" + isbn));
					orderDTO.setAmount(bookAmount);
					totalSum += bookPrice * bookAmount;
					orderList.add(orderDTO);

					orderSumAmount += orderDTO.getAmount();
				}

				OrderService service = new OrderServiceImpl();

				int n = service.orderDone(orderList);

				List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
				
				if(n > 0 && cartList != null) {
					List<CartDTO> found = new ArrayList<CartDTO>();
					
					for(String isbn : itemToOrder) {
						for(CartDTO cartDTO : cartList) {
							if(cartDTO.getIsbn().equals(isbn)) {
								found.add(cartDTO);
							}
						}
					}
					cartList.removeAll(found);
				}

				int oldCartSumAmount = (int) session.getAttribute("cartSumAmount");
				int newCartSumAmount = oldCartSumAmount - orderSumAmount;
				if (newCartSumAmount < 0) {
					newCartSumAmount = 0;
				}
				session.setAttribute("cartSumAmount", newCartSumAmount);
				request.setAttribute("orderList", orderList);
				request.setAttribute("orderSumAmount", orderSumAmount);

				nextPage = "orderDone.jsp";

				// ?????? ?????? ????????? ??????
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////
				String userName = memberDTO.getUserName();
				String email1 = memberDTO.getEmail1(); // ?????? ??????(?????????)
				String email2 = memberDTO.getEmail2(); // ?????? ??????(?????????)

				String from = "RandomStew.Books2u@gmail.com"; // ????????? ??????
				String fromName = "Books2u ????????????"; // ????????? ??????
				String to = email1 + "@" + email2;
				String subject = userName + "?????? ????????? ???????????? ?????????????????????.";
				String content = "<font size=\"5\" color=\"#11C619\"><b>?????????????????? ???????????????</b></font>" + 
						"<table width=\"60%\">" + 
						"	<tr><td colspan=\"2\"><font class=\"h4\"><b>?????? ??????</b></font></td></tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"4\" color=\"#CCCCCC\"></td></tr>" + 
						"	<tr><td colspan=\"2\" align=\"center\"><strong>??????</strong></td><td align=\"center\"><strong>??????</strong></td></tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"1\" color=\"#CCCCCC\"></td></tr>" + 
						"	<tr>" + 
						"		<td colspan=\"2\" align=\"center\">" + 
						"			" + orderList.get(0).getTitle() + "<br>" + 
						"			<font size=\"2\" color=\"#665b5f\">" + 
						"				????????? : " + orderList.get(0).getAuthor() + "<br>" + 
						"				?????????(" + orderList.get(0).getPublisher() +")<br>" + 
						"			</font>" + 
						"		</td>" + 
						"		<td align=\"center\">??? " + (orderSumAmount - 1) + "???</td>" + 
						"	</tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"1\" color=\"#CCCCCC\"></td></tr>" + 
						"	<tr><td colspan=\"2\" align=\"center\">????????????</td><td align='center'><b>" + totalSum + "</b> ???</td></tr>" + 
						"	<tr>" + 
						"		<td colspan=\"2\" align=\"center\">????????????</td>" + 
						"		<td align='center'>" + 
						"			<span>" + orderList.get(0).getPayment() + "</span>" + 
						"		</td>" + 
						"	</tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"4\" color=\"#CCCCCC\"></td></tr>" + 
						"</table>";

				// ???????????? ??? ???????????? ????????? ????????????(SMTP ?????? ????????? ??????)
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

				Authenticator auth = new Auth();
				Session mailSession = Session.getDefaultInstance(props, auth);

				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B"))); // ????????? ?????? ??????
				InternetAddress[] address = { new InternetAddress(to) };

				msg.setRecipients(Message.RecipientType.TO, address); // ?????? ????????????

				msg.setSubject(subject); // ????????????
				msg.setSentDate(new java.util.Date()); // ????????? ?????? ??????
				msg.setContent(content, "text/html;charset=UTF-8"); // ?????? ??????(MIME ??????-HTML ??????)

				Transport.send(msg); // ?????? ?????????
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////
			} catch (MessagingException ex) {
				System.out.println("mail send error : " + ex.getMessage());
				ex.printStackTrace();
				nextPage = "error/error.jsp";
			} catch (Exception e) {
				System.out.println("error : " + e.getMessage());
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
