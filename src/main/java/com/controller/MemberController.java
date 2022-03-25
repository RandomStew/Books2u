package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.member.MemberDTO;
import com.dto.order.OrderDTO;
import com.service.cart.CartService;
import com.service.member.MemberService;
import com.service.order.OrderService;

@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/loginUI")
	public String loginUI() throws Exception {
		return "member/loginForm";
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(@RequestParam HashMap<String, String> map, HttpSession session) throws Exception {
		MemberDTO memberDTO = memberService.login(map);
//		session.setAttribute("cartSumAmount", cartService.showCartList(memberDTO.getUserId()).size());
		if(memberDTO != null) {
			session.setAttribute("login", memberDTO);
			String prevPage = map.get("prevPage");
			return "redirect:"+prevPage;
		}
		
		return "member/loginFail";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	@GetMapping("/joinUI")
	public String joinUI() {
		return "joinForm";
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(MemberDTO memberDTO) throws Exception {
		int num = memberService.join(memberDTO);
		return "redirect:loginUI";
	}
	
	/*
	 * 조만간 session 없애야함
	 */
	@GetMapping("/myPage")
	public String myPage(HttpSession session) throws Exception {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userId = login.getUserId();
		List<OrderDTO> orderList = orderService.orderList(userId);
		session.setAttribute("login", login);
		session.setAttribute("orderList", orderList);
		return "myPage";
	}
	
	// 마이페이지 개인정보 수정
	@PostMapping("/myPageUpdate")
	public String myPageUpdate(MemberDTO fixedDTO, HttpSession session) throws Exception {
		int num = memberService.updateMyPage(fixedDTO);
		session.setAttribute("login", fixedDTO);
		return "redirect:myPage";
	}
	
	@GetMapping("/customerCenter")
	public String customerCenter() {
		return "member/mailForm";
	}
	
	
	// 메일 보내기
	@PostMapping("/sendMail")
	public String sendMail(@RequestParam Map<String, String> map) throws Exception {
		String userName = map.get("userName");
		String email1 = map.get("email1");
		String email2 = map.get("email2");
		String subject = map.get("subject");
		String content = map.get("content");
		
		String from = "RandomStew.Books2u@gmail.com"; // 보내는 메일
		String fromName = "Books2u 고객센터"; // 보내는 이름
		String to = email1 + "@" +email2;
		subject = "reply: " + subject;
		content = userName + "님의 문의가 접수되었습니다.\n" + "답변까지의 평균 소요시간은 3~5일 입니다.\n" + "이용해주셔서 감사합니다.\n" + "문의 내용\n"
				+ content;
        MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
        // true는 멀티파트 메세지를 사용하겠다는 의미
        
        /*
         * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
         * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
         */
        
        mailHelper.setFrom(from);
        // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
        // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
        //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
        mailHelper.setTo(to);
        mailHelper.setSubject(subject);
        mailHelper.setText(content, true);
        // true는 html을 사용하겠다는 의미입니다
        /*
         * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
         */
        
        mailSender.send(mail);
        return "redirect:mail";
	}
	
	@GetMapping("/mail")
	public String mail() {
		return "/member/mail";
	}
	
	@GetMapping("findIdPwUI")
	public String FindIdPwUI() {
		return "member/findForm";
	}
	
	// 아이디 패스워드 찾기(with mail)
	@PostMapping("findIdPw")
	public String FindIdPw(@RequestParam Map<String, String> map) throws Exception {
		MemberDTO member = memberService.find(map);
		if (member == null)
			return "redirect:findFail";
		String userId = member.getUserId();
		String passWd = member.getPassWd();
		String email1 = member.getEmail1(); // 받는 메일(계정)
		String email2 = member.getEmail2(); // 받는 메일(도메인)
		String subject ="분실하신 아이디와 비밀번호입니다.";
		String content = "아이디:"+userId+"\n"+"비밀번호: " + passWd + "\n";
		String from = "RandomStew.Books2u@gmail.com"; // 보내는 메일
		String fromName = "Books2u 고객센터"; // 보내는 이름
		String to = email1 + "@" +email2;
		subject = "reply: " + subject;
		
		MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
        mailHelper.setFrom(from);
        mailHelper.setTo(to);
        mailHelper.setSubject(subject);
        mailHelper.setText(content, true);
        
        mailSender.send(mail);
        return "redirect:findSuccess";
	}
	
	@GetMapping("/findSuccess")
	public String findSuccess() {
		return "member/findSuccess";
	}
	
	@GetMapping("/findFail")
	public String findFail() {
		return "member/findFail";
	}
	@ExceptionHandler({Exception.class})
	public String error() {
		return "error/error";
	}
	

}
