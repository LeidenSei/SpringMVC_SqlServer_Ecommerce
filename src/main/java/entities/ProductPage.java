package entities;

import java.util.List;

public class ProductPage {
	private List<Product> product;
	private int totalPages;
	private int pageSize;
	private int currentPage;
	public ProductPage() {
		// TODO Auto-generated constructor stub
	}
	


	public ProductPage(List<Product> product, int totalPages, int pageSize, int currentPage) {
		super();
		this.product = product;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}



	public List<Product> getProduct() {
		return product;
	}



	public void setProduct(List<Product> product) {
		this.product = product;
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
