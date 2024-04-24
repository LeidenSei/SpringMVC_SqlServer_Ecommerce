package entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
@Table(name="Account")
@Entity
public class Account implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="AccountId")
	private String accountId;
	
	@Column(name="UserName")
	private String userName;
	
	@Column(name="Password")
	private String password;
	

	@Column(name="FullName")
	@Length(min = 6,max = 50,message = "Độ dài của mã từ 6-50 ký tự")
	@NotEmpty(message = "Tên sinh viên không được trống")
	private String fullName;
	
	@Column(name="Picture")
	private String picture;
	
	
	@Column(name="Email")
	@Email(message = "Nhập đúng định dạng email")
	@NotEmpty(message = "Hãy nhập email")
	private String email;


	@Column(name="Address")
	@Length(min = 6,max = 50,message = "Độ dài của mã từ 6-50 ký tự")
	@NotEmpty(message = "Địa chỉ không được trống")
	private String address;


	@Column(name="Phone")
	@Pattern(regexp = "^\\d{8,10}$",message = "Số điện thoại từ 8-10 số")
	@NotEmpty(message = "Hãy điện thoại")
	private String phone;
	
	@Column(name="IsAdmin")
	private boolean isAdmin;
	
	@Column(name="Active")
	private boolean active;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(String accountId, String userName, String password,
			@Length(min = 6, max = 50, message = "Độ dài của mã từ 6-50 ký tự") @NotEmpty(message = "Tên sinh viên không được trống") String fullName,
			String picture,
			@Email(message = "Nhập đúng định dạng email") @NotEmpty(message = "Hãy nhập email") String email,
			@Length(min = 6, max = 50, message = "Độ dài của mã từ 6-50 ký tự") @NotEmpty(message = "Địa chỉ không được trống") String address,
			@Pattern(regexp = "^\\d{8,10}$", message = "Số điện thoại từ 8-10 số") @NotEmpty(message = "Hãy điện thoại") String phone,
			boolean isAdmin, boolean active) {
		super();
		this.accountId = accountId;
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.picture = picture;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.isAdmin = isAdmin;
		this.active = active;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}



	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	
}
