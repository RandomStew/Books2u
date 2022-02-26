package com.controller.member;

import javax.mail.PasswordAuthentication;

public class Auth extends javax.mail.Authenticator {
	
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("RandomStew.Books2u@gmail.com", "RandomStew.BookStew");
	}
	
}
