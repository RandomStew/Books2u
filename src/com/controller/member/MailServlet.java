package com.controller.member;

import java.io.IOException;
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

@WebServlet("/MailServlet")
public class MailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId"); // 고객명
		String email1 = request.getParameter("email1"); // 받는 메일(계정명)
		String email2 = request.getParameter("email2"); // 받는 메일(도메인)
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		System.out.println(userId);
		System.out.println(email1 + "@" + email2);
		System.out.println(subject);
		System.out.println(content);

		String from = "RandomStew.Books2u@gmail.com"; // 보내는 메일
		String fromName = "Books2u 고객센터"; // 보내는 이름
		String to = email1 + "@" + email2;
		subject = "reply:" + subject;
		content = userId + "님 안녕하세요. 문의하신 내용에 대한 답변입니다.\n\n"
				+ "문의 내용\n"
				+ content + "\n\n"
				+ "답변 : 죄송합니다.";

		String nextPage = "error/error.jsp";
		try {
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
			msg.setContent(content, "text/plain;charset=UTF-8"); // 내용 설정(MIME 지정-HTML 형식)

			Transport.send(msg); // 메일 보내기
			nextPage = "member/mail.jsp";
		} catch (MessagingException ex) {
			System.out.println("mail send error : " + ex.getMessage());
			ex.printStackTrace();
		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
			e.printStackTrace();
		}

		request.getRequestDispatcher(nextPage).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
