package com.dto.cart;

import org.apache.ibatis.type.Alias;

@Alias("CartDTO")
public class CartDTO {

	private String userId; // 아이디
	private String isbn; // isbn
	private String title; // 책제목
	private String author; // 저자명
	private String publisher; // 출판사
	private int price; // 가격
	private int amount; // 수량

	public CartDTO() {
	}

	public CartDTO(String userId, String isbn, String title, String author, String publisher, int price, int amount) {
		super();
		this.userId = userId;
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.amount = amount;
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

	@Override
	public String toString() {
		return "CartDTO [userid=" + userId + ", isbn=" + isbn + ", title=" + title + ", author=" + author
				+ ", publisher=" + publisher + ", price=" + price + ", amount=" + amount + "]";
	}

}
