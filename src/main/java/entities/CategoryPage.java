package entities;

import java.util.List;


public class CategoryPage {
	private List<Category> cate;
	private int totalPages;
	private int pageSize;
	private int currentPage;
	public CategoryPage() {
		// TODO Auto-generated constructor stub
	}
	
	public CategoryPage(List<Category> cate, int totalPages, int pageSize, int currentPage) {
		super();
		this.cate = cate;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}

	public List<Category> getCate() {
		return cate;
	}
	public void setCate(List<Category> cate) {
		this.cate = cate;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
}
