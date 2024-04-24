<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__text">
					<h4>Shopping Cart</h4>
					<div class="breadcrumb__links">
						<a href="${contextPath}/home">Home</a> <a href="${contextPath}/shop">Mua sắm</a> <span>Giỏ hàng</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="shopping__cart__table">
					<table>
						<thead>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${baskets}" var="b">
								<tr>
									<td class="product__cart__item">
										<div class="product__cart__item__pic">
											<img src="${contextPath}/${b.image}" alt="" width="200px">
										</div>
										<div class="product__cart__item__text">
											<h6>${b.title}</h6>
											<h5>
												<fmt:formatNumber value="${b.price}" currencySymbol="VND" type="currency" />
											</h5>
										</div>
									</td>
									<td class="quantity__item">
										<div class="quantity">
											<div class="pro-qty-2">
												<input type="number"
													onchange="updateBasket('${b.slug}',this.value)"
													value="${b.quantity}" min="1" max="100">
											</div>
										</div>
									</td>
									
									<td class="cart__price">
									<fmt:formatNumber currencySymbol="VND" value="${b.price*b.quantity}"
									type="currency" />
						
											</td>
									<c:set var="total" value="${total+b.price*b.quantity}" />

									<td class="cart__close"><a
										onclick="removeItem('${b.slug}')"> <i class="fa fa-close"></i>
									</a></i></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="continue__btn">
							<a href="${contextPath}/shop">Continue Shopping</a>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="continue__btn update__btn">
							<a href="${contextPath}/cart"><i class="fa fa-spinner"></i>
								Update cart</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="cart__discount">
					<h6>Discount codes</h6>
					<form action="#">
						<input type="text" placeholder="Coupon code">
						<button type="submit">Apply</button>
					</form>
				</div>
				<div class="cart__total">
					<h6>Cart total</h6>
					<ul>

						<li>Total <span><fmt:formatNumber currencySymbol="VND" value="${total}"
									type="currency" /></span></li>
					</ul>
					<a href="${contextPath}/checkout" class="primary-btn">Thanh toán</a>
				</div>
			</div>
		</div>
	</div>
</section>