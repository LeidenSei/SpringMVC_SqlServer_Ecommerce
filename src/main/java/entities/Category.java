package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

@Table(name = "categories")
@Entity

public class Category {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;

	@Column(name = "name")
	@Length(min = 3, max = 50, message = "Độ dài của tên danh mục 3-50 ký tự")
	@NotEmpty(message = "Tên danh mục không được trống")
	private String categoryName;

	@Length(min = 3, max = 50, message = "Độ dài của slug 3-50 ký tự")
	@NotEmpty(message = "Slug không được trống")
	private String slug;

	private String description;

	private boolean status;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private List<Product> products;

	public Category() {
		// TODO Auto-generated constructor stub
	}















	public Category(int categoryId,
			@Length(min = 3, max = 50, message = "Độ dài của tên danh mục 3-50 ký tự") @NotEmpty(message = "Tên danh mục không được trống") String categoryName,
			@Length(min = 3, max = 50, message = "Độ dài của slug 3-50 ký tự") @NotEmpty(message = "Slug không được trống") String slug,
			String description, boolean status, List<Product> products) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.slug = slug;
		this.description = description;
		this.status = status;
		this.products = products;
	}















	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
