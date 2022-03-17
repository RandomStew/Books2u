package com.controller.member;

import java.io.IOException;
import java.util.HashMap;
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

import com.dto.member.MemberDTO;
import com.service.member.MemberService;
import com.service.member.MemberServiceImpl;

@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("userName");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");

		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("userName", userName);
		hashMap.put("ssn1", ssn1);
		hashMap.put("ssn2", ssn2);

		MemberService service = new MemberServiceImpl();
		String nextPage = "";
		try {
			MemberDTO memberDTO = service.find(hashMap);
			if (memberDTO != null) {
				String userId = memberDTO.getUserId();
				String passWd = memberDTO.getPassWd();
				String email1 = memberDTO.getEmail1(); // 받는 메일(계정명)
				String email2 = memberDTO.getEmail2(); // 받는 메일(도메인)

				String from = "RandomStew.Books2u@gmail.com"; // 보내는 메일
				String fromName = "Books2u 고객센터"; // 보내는 이름
				String to = email1 + "@" + email2;
				String subject = "아이디 및 비밀번호 찾기";
				String content = "아이디 : " + userId + "\n" + "비밀번호 : " + passWd + "\n";

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
				nextPage = "member/findSuccess.jsp";
			} else {
				nextPage = "member/findFail.jsp";
			}
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
