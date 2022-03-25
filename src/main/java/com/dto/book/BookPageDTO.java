package com.dto.book;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("BookPageDTO")
public class BookPageDTO {
	List<BookDTO> list;
	int curPage;
	int perPage;
	int totalPage;
	
	public BookPageDTO() {}

	public BookPageDTO(List<BookDTO> list, int curPage, int perPage, int totalPage) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalPage = totalPage;
	}

	public List<BookDTO> getList() {
		return list;
	}

	public void setList(List<BookDTO> list) {
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
		return "BookPageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalPage="
				+ totalPage + "]";
	}
	
}
