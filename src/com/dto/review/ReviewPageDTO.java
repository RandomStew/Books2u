package com.dto.review;

import java.util.List;

public class ReviewPageDTO {
	List<ReviewDTO> list;
	
	int curPage = 0;
	int perPage = 5;
	int totalPage;
	public ReviewPageDTO() {}
	public ReviewPageDTO(List<ReviewDTO> list, int curPage, int perPage, int totalPage) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalPage = totalPage;
	}
	public List<ReviewDTO> getList() {
		return list;
	}
	public void setList(List<ReviewDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	@Override
	public String toString() {
		return "ReviewPageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalPage="
				+ totalPage + "]";
	}
	
}
