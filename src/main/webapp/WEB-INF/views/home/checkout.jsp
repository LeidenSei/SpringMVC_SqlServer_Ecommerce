<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__text">
					<h4>Check Out</h4>
					<div class="breadcrumb__links">
						<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Check
							Out</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form">
			<form action="Order" method="post">
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<h6 class="checkout__title">Chi tiết đơn hàng</h6>
						<div class="checkout__input">
							<p>
								Họ và tên<span>*</span>
							</p>
							<input type="text" disable value="${sessionScope.fullname}">
						</div>
						<div class="checkout__input">
							<p>
								Địa chỉ<span>*</span>
							</p>
							<input type="text" value="${sessionScope.address}" name="address">
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Điện thoại<span>*</span>
									</p>
									<input name="phone" value="${sessionScope.phone}">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>
										Email<span>*</span>
									</p>
									<input name="email" value="${sessionScope.email}">
								</div>
							</div>
						</div>
						<div class="checkout__input">
							<p>
								Ghi chú<span>*</span>
							</p>
							<input type="text" name="note"
								placeholder="Notes about your order, e.g. special notes for delivery.">
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="checkout__order">
							<h4 class="order__title">Your order</h4>
							<div class="checkout__order__products">
								Product <span>Total</span>
							</div>
							<ul class="checkout__total__products">
								<c:forEach items="${baskets}" var="b" >
									<li>${b.title}<span><fmt:formatNumber
												value="${b.price*b.quantity}" currencySymbol="VND" type="currency" /></span></li>
									<c:set var="total" value="${total+b.price*b.quantity}" />
								</c:forEach>


							</ul>
							<ul class="checkout__total__all">

								<li>Total <span>
								<fmt:formatNumber
												value="${total}" currencySymbol="VND" type="currency" />
							</span></li>
							</ul>
							<div class="form-check">
								<input class="form-check-input" type="radio" value="1"
									name="payment" id="flexRadioDefault1"> <label
									class="form-check-label" for="flexRadioDefault1">
									Thanh toán bằng thẻ tín dụng </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" value="2"
									name="payment" id="flexRadioDefault2" >
								<label class="form-check-label" for="flexRadioDefault2">
									Thanh toán trực tiếp </label>
							</div>
							<button type="submit" class="site-btn">PLACE ORDER</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>