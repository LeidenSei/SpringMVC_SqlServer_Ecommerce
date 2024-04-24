package entities;

import java.util.List;

public class OrderPage {
	private List<Order> order;
	private int totalPages;
	private int pageSize;
	private int currentPage;

	public OrderPage() {
		// TODO Auto-generated constructor stub
	}

	public OrderPage(List<Order> order, int totalPages, int pageSize, int currentPage) {
		super();
		this.order = order;
		this.totalPages = totalPages;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
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
