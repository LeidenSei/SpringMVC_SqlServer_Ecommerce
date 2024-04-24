<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="session" />
<!-- Hero Section Begin -->
<section class="hero">
	<div class="hero__slider owl-carousel">
		<div class="hero__items set-bg"
			data-setbg="https://gundamshop.vn/wp-content/uploads/2023/05/8c50d7503fcd656ea62b2f5efa267e5b-1.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-7 col-md-8">
						<div class="hero__text">
							
							
							<a href="#" class="primary-btn">Shop now <span
								class="arrow_right"></span></a>
							<div class="hero__social">
								<a href="${contextPath}/shop"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="hero__items set-bg"
			data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/Banner_Gundam2-43dbcca246010bd07a2a8c9dbb86d7ef-1400x541.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-7 col-md-8">
						<div class="hero__text">
						
							
							<a href="${contextPath}/shop" class="primary-btn">Shop now <span
								class="arrow_right"></span></a>
							<div class="hero__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->

<!-- Banner Section Begin -->
<section class="banner spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-7 offset-lg-4">
				<div class="banner__item">
					<div class="banner__item__pic">
						<img src="https://tabmohinh.com/wp-content/uploads/2022/01/M%C3%B4-h%C3%ACnh-l%E1%BA%AFp-r%C3%A1p-HG-1144-GUNDAM-HELIOS-Bandai-2-400x400.jpg" alt="">
					</div>
					<div class="banner__item__text">
						<h2>Super Deformed</h2>
						<a href="${contextPath}/shop">Shop now</a>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="banner__item banner__item--middle">
					<div class="banner__item__pic">
						<img src="https://azgundam.com/wp-content/uploads/2024/01/HG-GUNDAM-00-DIVER-ARC-AZGUNDAM-02-247x296.jpg" alt="">
					</div>
					<div class="banner__item__text">
						<h2>High Grade 1/144</h2>
						<a href="${contextPath}/shop">Shop now</a>
					</div>
				</div>
			</div>
			<div class="col-lg-7">
				<div class="banner__item banner__item--last">
					<div class="banner__item__pic">
						<img src="https://azgundam.com/wp-content/uploads/2021/10/RG-35-WING-GUNDAM-AZG-4-247x296.jpg" alt="">
					</div>
					<div class="banner__item__text">
						<h2>Real Grade 1/144</h2>
						<a href="${contextPath}/shop">Shop now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Banner Section End -->

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="filter__controls">
					
					<li data-filter=".new-arrivals">New Arrivals</li>
					<li data-filter=".hot-sales">Hot Sales</li>
				</ul>
			</div>
		</div>
		<div class="row product__filter">
			<c:forEach var="p" items="${newProducts}">
				<div
					class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="${contextPath}/${p.image}">
							<span class="label">New</span>
							<ul class="product__hover">
					
								<li><a href="${contextPath}/detail/${p.slug}"><img
										src="${contextPath}/home/img/icon/search.png" alt=""></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>${p.name}</h6>
							<button onclick="addBasket('${p.slug}')" id="my-button" class="btn btn-primary">+
								Add To Cart</button>
							<c:choose>
								<c:when test="${p.sale_price>0}">
									<h5>
										<fmt:formatNumber value="${p.sale_price}" type="currency" currencySymbol="VND"></fmt:formatNumber>
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
			</c:forEach>




			<c:forEach var="p" items="${saleProducts}">
				<div
					class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="${contextPath}/${p.image}">
							<ul class="product__hover">
								
								<li><a href="${contextPath}/detail/${p.slug}"><img
										src="${contextPath}/home/img/icon/search.png" alt=""></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>${p.name}</h6>
						<button onclick="addBasket('${p.slug}')" id="my-button" class="btn btn-primary">+
								Add To Cart</button>
							<c:choose>
								<c:when test="${p.sale_price>0}">
									<h5>
										<fmt:formatNumber value="${p.sale_price}" currencySymbol="VND" type="currency"></fmt:formatNumber>
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
			</c:forEach>


		</div>
	</div>
</section>
<!-- Product Section End -->

<!-- Categories Section Begin -->
<section class="categories spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="categories__text">
					<h2>
						 <br /> <span>Gundam Hot!</span> <br />
						
					</h2>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="categories__hot__deal">
					<img src="https://tabmohinh.com/wp-content/uploads/2022/01/M%C3%B4-h%C3%ACnh-l%E1%BA%AFp-r%C3%A1p-HG-1144-GUNDAM-HELIOS-Bandai-2-400x400.jpg" alt="">
				</div>
			</div>
			<div class="col-lg-4 offset-lg-1">
				<div class="categories__deal__countdown">
					<span>Deal Of The Week</span>
					<h2></h2>
					<div class="categories__deal__countdown__timer" id="countdown">
						<div class="cd-item">
							<span>3</span>
							<p>Days</p>
						</div>
						<div class="cd-item">
							<span>1</span>
							<p>Hours</p>
						</div>
						<div class="cd-item">
							<span>50</span>
							<p>Minutes</p>
						</div>
						<div class="cd-item">
							<span>18</span>
							<p>Seconds</p>
						</div>
					</div>
					<a href="${contextPath}/shop" class="primary-btn">Shop now</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Categories Section End -->

<!-- Instagram Section Begin -->
<section class="instagram spad mb-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="instagram__pic">
					<div class="instagram__pic__item set-bg"
						data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/M%C3%B4-h%C3%ACnh-Gundam-Bandai-RG-00-raiser-GDC-1-300x300.jpeg"></div>
					<div class="instagram__pic__item set-bg"
						data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/M%C3%B4-H%C3%ACnh-Gundam-Bandai-RG-Nu-GDC-3-400x400.jpg"></div>
					<div class="instagram__pic__item set-bg"
						data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/M%C3%B4-H%C3%ACnh-Bandai-Gundam-RG-00-QAN-T-16-300x300.jpg"></div>
					<div class="instagram__pic__item set-bg"
						data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/M%C3%B4-h%C3%ACnh-Bandai-HG-Gundam-Barbatos-Lupus-Rex-GDC-2-300x300.jpg"></div>
					<div class="instagram__pic__item set-bg"
						data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/M%C3%B4-h%C3%ACnh-Bandai-HG-Gundam-Barbatos-Lupus-Rex-GDC-2-300x300.jpg"></div>
					<div class="instagram__pic__item set-bg"
						data-setbg="https://tabmohinh.com/wp-content/uploads/2019/10/M%C3%B4-h%C3%ACnh-l%E1%BA%AFp-r%C3%A1p-Gundam-Bandai-RG-Justice-ZGMF-X09A-GDC-7_2-300x300.jpg"></div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="instagram__text">
					<h2>Instagram</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
					<h3>#Shop Gundam</h3>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Instagram Section End -->

<!-- Latest Blog Section Begin -->

<!-- Latest Blog Section End -->