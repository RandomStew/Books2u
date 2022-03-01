package com.dto.order;

public class OrderDTO {

	private int orderId;
	private String userId; // 아이디
	private String isbn; // ISBN
	private String title; // 책제목
	private String author; // 저자명
	private String publisher; // 출판사
	private int price; // 가격
	private int amount; // 수량
	
	private String recipient; // 수령인
	private String recipientPost; // 수령지 우편번호
	private String recipientAddr1; // 수령지1
	private String recipientAddr2; // 수령지2
	private String recipientAddr3; // 수령지3
	private String recipientPhone1; // 수령인전화번호1
	private String recipientPhone2; // 수령인 전화번호2
	private String recipientPhone3; // 수령인 전화번호3
	private String payment; // 결제수단
	private String orderDate; // 주문날짜

	public OrderDTO() {
	}

	public OrderDTO(String userId, String isbn, String title, String author, String publisher, int price, int amount,
			String recipient, String recipientPost, String recipientAddr1, String recipientAddr2, String recipientAddr3,
			String recipientPhone1, String recipientPhone2, String recipientPhone3, String payment, String orderDate) {
		super();
		this.userId = userId;
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.amount = amount;
		this.recipient = recipient;
		this.recipientPost = recipientPost;
		this.recipientAddr1 = recipientAddr1;
		this.recipientAddr2 = recipientAddr2;
		this.recipientAddr3 = recipientAddr3;
		this.recipientPhone1 = recipientPhone1;
		this.recipientPhone2 = recipientPhone2;
		this.recipientPhone3 = recipientPhone3;
		this.payment = payment;
		this.orderDate = orderDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipientPost() {
		return recipientPost;
	}

	public void setRecipientPost(String recipientPost) {
		this.recipientPost = recipientPost;
	}

	public String getRecipientAddr1() {
		return recipientAddr1;
	}

	public void setRecipientAddr1(String recipientAddr1) {
		this.recipientAddr1 = recipientAddr1;
	}

	public String getRecipientAddr2() {
		return recipientAddr2;
	}

	public void setRecipientAddr2(String recipientAddr2) {
		this.recipientAddr2 = recipientAddr2;
	}

	public String getRecipientAddr3() {
		return recipientAddr3;
	}

	public void setRecipientAddr3(String recipientAddr3) {
		this.recipientAddr3 = recipientAddr3;
	}

	public String getRecipientPhone1() {
		return recipientPhone1;
	}

	public void setRecipientPhone1(String recipientPhone1) {
		this.recipientPhone1 = recipientPhone1;
	}

	public String getRecipientPhone2() {
		return recipientPhone2;
	}

	public void setRecipientPhone2(String recipientPhone2) {
		this.recipientPhone2 = recipientPhone2;
	}

	public String getRecipientPhone3() {
		return recipientPhone3;
	}

	public void setRecipientPhone3(String recipientPhone3) {
		this.recipientPhone3 = recipientPhone3;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", userId=" + userId + ", isbn=" + isbn + ", title=" + title
				+ ", author=" + author + ", publisher=" + publisher + ", price=" + price + ", amount=" + amount
				+ ", recipient=" + recipient + ", recipientPost=" + recipientPost + ", recipientAddr1=" + recipientAddr1
				+ ", recipientAddr2=" + recipientAddr2 + ", recipientAddr3=" + recipientAddr3 + ", recipientPhone1="
				+ recipientPhone1 + ", recipientPhone2=" + recipientPhone2 + ", recipientPhone3=" + recipientPhone3
				+ ", payment=" + payment + ", orderDate=" + orderDate + "]";
	}

}
