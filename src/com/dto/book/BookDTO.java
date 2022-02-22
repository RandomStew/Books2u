package com.dto.book;

public class BookDTO {

	private String isbn; // isbn
	private String title; // 제목
	private String author; // 저자명
	private String publisher; // 출판사
	private String publishDate; // 출판 날짜
	private String story; // 줄거리
	private int price; // 가격
	private String genre; // 장르

	public BookDTO() {
	}

	public BookDTO(String isbn, String title, String author, String publisher, String publishDate, String story,
			int price, String genre) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.publishDate = publishDate;
		this.story = story;
		this.price = price;
		this.genre = genre;
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

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "BookDTO [isbn=" + isbn + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", publishDate=" + publishDate + ", story=" + story + ", price=" + price + ", genre=" + genre + "]";
	}

}
