package entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String orderId;
	private Date orderDate;
	private String accountId;
	private String receiveAddress;
	private String receivePhone;
	private String receiveEmail;
	private Date receiveDate;
	private String note;
	private int methodPayment;
	@Column(name = "Status")
	private int orderStatus;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "accountId", insertable = false, updatable = false)
	private Account acc;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(String orderId, Date orderDate, String accountId, String receiveAddress, String receivePhone,
			String receiveEmail, Date receiveDate, String note, int methodPayment, int orderStatus) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.accountId = accountId;
		this.receiveAddress = receiveAddress;
		this.receivePhone = receivePhone;
		this.receiveEmail = receiveEmail;
		this.receiveDate = receiveDate;
		this.note = note;
		this.methodPayment = methodPayment;
		this.orderStatus = orderStatus;
	}

	public Order(String orderId, Date orderDate, String accountId, String receiveAddress, String receivePhone,
			String receiveEmail, Date receiveDate, String note, int methodPayment, int orderStatus, Account acc) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.accountId = accountId;
		this.receiveAddress = receiveAddress;
		this.receivePhone = receivePhone;
		this.receiveEmail = receiveEmail;
		this.receiveDate = receiveDate;
		this.note = note;
		this.methodPayment = methodPayment;
		this.orderStatus = orderStatus;
		this.acc = acc;
	}

	public Account getAcc() {
		return acc;
	}

	public void setAcc(Account acc) {
		this.acc = acc;
	}

	public String getReceiveEmail() {
		return receiveEmail;
	}

	public void setReceiveEmail(String receiveEmail) {
		this.receiveEmail = receiveEmail;
	}

	public int getMethodPayment() {
		return methodPayment;
	}

	public void setMethodPayment(int methodPayment) {
		this.methodPayment = methodPayment;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getReceiveAddress() {
		return receiveAddress;
	}

	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}

	public String getReceivePhone() {
		return receivePhone;
	}

	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

}
