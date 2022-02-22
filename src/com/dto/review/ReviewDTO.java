package com.dto.review;

public class ReviewDTO {

	private int reviewId; // 리뷰 번호
	private String isbn; // ISBN
	private String userId; // 작성자
	private double rating; // 별점
	private String content; // 내용
	private String reviewDate; // 리뷰날짜

	public ReviewDTO() {
	}

	public ReviewDTO(int reviewId, String isbn, String userId, double rating, String content, String reviewDate) {
		super();
		this.reviewId = reviewId;
		this.isbn = isbn;
		this.userId = userId;
		this.rating = rating;
		this.content = content;
		this.reviewDate = reviewDate;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "ReviewDTO [reviewId=" + reviewId + ", isbn=" + isbn + ", userId=" + userId + ", rating=" + rating
				+ ", content=" + content + ", reviewDate=" + reviewDate + "]";
	}

}
