package entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

@Table(name = "products")
@Entity
public class Product {
	@Id
	@Length(min = 3, max = 50, message = "Độ dài của mã từ 3-50 ký tự")
	@NotEmpty(message = "Mã sản phẩm không được trống")
	private String id;

	@Length(min = 3, max = 100, message = "Độ dài của tên sản phẩm từ 3-100 ký tự")
	@NotEmpty(message = "Tên sản phẩm không được trống")
	private String name;

	@Length(min = 3, max = 100, message = "Độ dài của slug từ 3-100 ký tự")
	@NotEmpty(message = "Slug không được trống")
	private String slug;

	private String image;

	@NotNull(message = "Hãy nhập giá tiền")
	@Min(value = 1, message = "Giá tiền phải lớn hơn 0")
	private float price;

	
	private boolean status;
	
	@NotNull(message = "Hãy nhập giá khuyến mãi")
	@Min(value = 1, message = "Giá khuyến mãi phải lớn hơn 0")
	private float sale_price;

	@NotEmpty(message = "Mô tả sản phẩm không được trống")
	private String description;

	private boolean hightlight;
	@Column(name = "createdate")
	private Date createDate;

	@Column(name = "category_id")
	@NotNull(message = "Hãy chọn danh mục")
	private int categoryId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", insertable = false, updatable = false)
	private Category category;

	public Product() {
		// TODO Auto-generated constructor stub
	}



	public Product(
			@Length(min = 3, max = 50, message = "Độ dài của mã từ 3-50 ký tự") @NotEmpty(message = "Mã sản phẩm không được trống") String id,
			@Length(min = 3, max = 100, message = "Độ dài của tên sản phẩm từ 3-100 ký tự") @NotEmpty(message = "Tên sản phẩm không được trống") String name,
			@Length(min = 3, max = 100, message = "Độ dài của slug từ 3-100 ký tự") @NotEmpty(message = "Slug không được trống") String slug,
			String image,
			@NotNull(message = "Hãy nhập giá tiền") @Min(value = 1, message = "Giá tiền phải lớn hơn 0") float price,
			boolean status,
			@NotNull(message = "Hãy nhập giá khuyến mãi") @Min(value = 1, message = "Giá khuyến mãi phải lớn hơn 0") float sale_price,
			@NotEmpty(message = "Mô tả sản phẩm không được trống") String description, boolean hightlight,
			Date createDate, @NotNull(message = "Hãy chọn danh mục") int categoryId, Category category) {
		super();
		this.id = id;
		this.name = name;
		this.slug = slug;
		this.image = image;
		this.price = price;
		this.status = status;
		this.sale_price = sale_price;
		this.description = description;
		this.hightlight = hightlight;
		this.createDate = createDate;
		this.categoryId = categoryId;
		this.category = category;
	}



	public boolean isHightlight() {
		return hightlight;
	}

	public void setHightlight(boolean hightlight) {
		this.hightlight = hightlight;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public float getSale_price() {
		return sale_price;
	}

	public void setSale_price(float sale_price) {
		this.sale_price = sale_price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
