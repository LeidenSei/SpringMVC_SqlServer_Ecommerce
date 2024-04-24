package entities;

import java.io.Serializable;

public class Basket implements Serializable {
	private static final long serialVersionUID = 1L;
	private String productId;
	private String image;
	private String title;
	private String slug;
	private float price;
	private int quantity;
	public Basket() {

	}




	public Basket(String productId, String image, String title, String slug, float price, int quantity) {
		super();
		this.productId = productId;
		this.image = image;
		this.title = title;
		this.slug = slug;
		this.price = price;
		this.quantity = quantity;
	}




	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}




	public String getSlug() {
		return slug;
	}


	public void setSlug(String slug) {
		this.slug = slug;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}