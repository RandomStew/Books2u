package com.dto.curation;

import org.apache.ibatis.type.Alias;

@Alias("CurationDTO")
public class CurationDTO {
	String isbn;
	String title;
	String author;
	String publisher;
	int price;
	String genre;
	double rating;
	
	public CurationDTO() {}

	public CurationDTO(String isbn, String title, String author, String publisher, int price, String genre,
			double rating) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.genre = genre;
		this.rating = rating;
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

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "CurationDTO [isbn=" + isbn + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", price=" + price + ", genre=" + genre + ", rating=" + rating + "]";
	}

	
	
	
}
