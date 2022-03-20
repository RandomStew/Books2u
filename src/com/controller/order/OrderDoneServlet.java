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

				if (n > 0) {
					List<CartDTO> found = new ArrayList<CartDTO>();
					List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
					for (String isbn : itemToOrder) {
						for (CartDTO cartDTO : cartList) {
							if (cartDTO.getIsbn().equals(isbn)) {
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

				// 주문 완료 이메일 발송
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////
				String userName = memberDTO.getUserName();
				String email1 = memberDTO.getEmail1(); // 받는 메일(계정명)
				String email2 = memberDTO.getEmail2(); // 받는 메일(도메인)

				String from = "RandomStew.Books2u@gmail.com"; // 보내는 메일
				String fromName = "Books2u 고객센터"; // 보내는 이름
				String to = email1 + "@" + email2;
				String subject = userName + "님의 주문이 안전하게 처리되었습니다.";
				String content = "<font size=\"5\" color=\"#11C619\"><b>주문해주셔서 감사합니다</b></font>" + 
						"<table width=\"60%\">" + 
						"	<tr><td colspan=\"2\"><font class=\"h4\"><b>주문 정보</b></font></td></tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"4\" color=\"#CCCCCC\"></td></tr>" + 
						"	<tr><td colspan=\"2\" align=\"center\"><strong>도서</strong></td><td align=\"center\"><strong>수량</strong></td></tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"1\" color=\"#CCCCCC\"></td></tr>" + 
						"	<tr>" + 
						"		<td colspan=\"2\" align=\"center\">" + 
						"			" + orderList.get(0).getTitle() + "<br>" + 
						"			<font size=\"2\" color=\"#665b5f\">" + 
						"				저자명 : " + orderList.get(0).getAuthor() + "<br>" + 
						"				출판사(" + orderList.get(0).getPublisher() +")<br>" + 
						"			</font>" + 
						"		</td>" + 
						"		<td align=\"center\">외 " + (orderSumAmount - 1) + "권</td>" + 
						"	</tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"1\" color=\"#CCCCCC\"></td></tr>" + 
						"	<tr><td colspan=\"2\" align=\"center\">결제금액</td><td align='center'><b>" + totalSum + "</b> 원</td></tr>" + 
						"	<tr>" + 
						"		<td colspan=\"2\" align=\"center\">결제수단</td>" + 
						"		<td align='center'>" + 
						"			<span>" + orderList.get(0).getPayment() + "</span>" + 
						"		</td>" + 
						"	</tr>" + 
						"	<tr><td colspan=\"3\"><hr size=\"4\" color=\"#CCCCCC\"></td></tr>" + 
						"</table>";

				// 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

				Authenticator auth = new Auth();
				Session mailSession = Session.getDefaultInstance(props, auth);

				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B"))); // 보내는 사람 설정
				InternetAddress[] address = { new InternetAddress(to) };

				msg.setRecipients(Message.RecipientType.TO, address); // 받는 사람설정

				msg.setSubject(subject); // 제목설정
				msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
				msg.setContent(content, "text/html;charset=UTF-8"); // 내용 설정(MIME 지정-HTML 형식)

				Transport.send(msg); // 메일 보내기
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
