<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="shop-details">
	<div class="product__details__pic">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="product__details__breadcrumb">
						<a href="${contextPath}/home">Home</a> <a href="${contextPath}/shop">Shop</a> <span>Product
							Details</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab">
								<div class="product__thumb__pic set-bg"
									data-setbg="img/shop-details/thumb-1.png"></div>
						</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab">
								<div class="product__thumb__pic set-bg"
									data-setbg="img/shop-details/thumb-2.png"></div>
						</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab">
								<div class="product__thumb__pic set-bg"
									data-setbg="img/shop-details/thumb-3.png"></div>
						</a></li>
					</ul>
				</div>
				<div class="col-lg-6 col-md-9">
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__pic__item">
								<img src="${contextPath}/${product.image}" alt="">
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__pic__item">
								<img src="img/shop-details/product-big-3.png" alt="">
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__pic__item">
								<img src="img/shop-details/product-big.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product__details__content">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="product__details__text">
						<h4>${product.name}</h4>
						<c:choose>
							<c:when test="${product.sale_price>0}">
								<h3>

									<fmt:formatNumber value="${product.sale_price}"
										currencySymbol="VND" type="currency"></fmt:formatNumber>
									<span><fmt:formatNumber value="${product.price}"
											type="currency" currencySymbol="VND"></fmt:formatNumber></span>
								</h3>
							</c:when>
							<c:otherwise>
								<h3>
									<fmt:formatNumber value="${product.price}" type="currency"
										currencySymbol="VND"></fmt:formatNumber>
								</h3>
							</c:otherwise>
						</c:choose>

						<div class="product__details__cart__option">
							<button onclick="addBasket('${product.slug}')" class="primary-btn">add to cart</button>
						</div>
						<div class="product__details__last__option">
							<h5>
								<span>Guaranteed Safe Checkout</span>
							</h5>
							<img src="img/shop-details/details-payment.png" alt="">
							<ul>
								<li><span>SKU:</span> ${product.id}</li>
								<li><span>Categories:</span>${product.category.categoryName}</li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-5" role="tab">Mô tả</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-5" role="tabpanel">
								<div class="product__details__tab__content">
									${product.description}</div>
							</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shop Details Section End -->

<!-- Related Section Begin -->
<section class="related spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="related-title">Related Product</h3>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${relatedProduct}" var="p">
			<c:if test="${p.id != product.id}">
			<div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="${contextPath}/${p.image}">
							<ul class="product__hover">
								<li><a href="#"><img
										src="${contextPath}/home/img/icon/heart.png" alt=""></a></li>
								<li><a href="${contextPath}/detail/${p.slug}"><img
										src="${contextPath}/home/img/icon/search.png" alt=""></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>${p.name}</h6>
							<button onclick="addBasket('${p.slug}')" class="btn btn-primary">+
								Add To Cart</button>
							<div class="rating">
								<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
									class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
									class="fa fa-star-o"></i>
							</div>
							<c:choose>
								<c:when test="${p.sale_price>0}">
									<h5>
										<fmt:formatNumber value="${p.sale_price}" currencySymbol="VND"
											type="currency"></fmt:formatNumber>
									</h5>
								</c:when>
								<c:otherwise>
									<h5>
										<fmt:formatNumber value="${p.price}" type="currency"
											currencySymbol="VND"></fmt:formatNumber>
									</h5>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:if>
				
			</c:forEach>

		</div>
	</div>
</section>