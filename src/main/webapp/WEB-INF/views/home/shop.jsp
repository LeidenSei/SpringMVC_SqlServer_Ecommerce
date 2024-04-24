<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb__text">
					<h4>Shop</h4>
					<div class="breadcrumb__links">
						<a href="${contextPath}/home">Trang chủ</a> <span>Mua sắm</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shop Section Begin -->
<section class="shop spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="shop__sidebar">
					<div class="shop__sidebar__search">
						<form action="" method="post">
							<input type="text" placeholder="Search..." value="${searchname}"
								name="searchname">
							<button type="submit">
								<span class="icon_search"></span>
							</button>
						</form>
					</div>
					<div class="shop__sidebar__accordion">
						<div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
								</div>
								<div id="collapseOne" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__categories">
											<ul class="nice-scroll">
												<c:forEach var="c" items="${category}">
													<li><a href="shop?cateid=${c.categoryId}">${c.categoryName }
															(${c.products.size()})</a></li>
												</c:forEach>

											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-heading">
									<a data-toggle="collapse" data-target="#collapseThree">Filter
										Price</a>
								</div>
								<div id="collapseThree" class="collapse show"
									data-parent="#accordionExample">
									<div class="card-body">
										<div class="shop__sidebar__price">
											<ul>
												<li><a href="shop?fromprice=1">0 - 200.000VND</a></li>
												<li><a href="shop?fromprice=2">200.000VND -
														500.000VND</a></li>
												<li><a href="shop?fromprice=3">500.000VND -
														1.000.000VND</a></li>
												<li><a href="shop?fromprice=4">Trên 1.000.000VND </a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="shop__product__option">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="shop__product__option__left">
								<p>Có ${products.size()} sản phẩm</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">

							<div class="shop__product__option__right">
								<select onchange="location = this.value;">
									<c:choose>
										<c:when test="${sort!=null&&sort==1}">
											<option value="shop?sort=1" selected>Mới nhất</option>
										</c:when>
										<c:otherwise>
											<option value="shop?sort=1">Mới nhất</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${sort!=null&&sort==2}">
											<option value="shop?sort=2" selected>Giá thấp đến
												cao</option>
										</c:when>
										<c:otherwise>
											<option value="shop?sort=2">Giá thấp đến cao</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${sort!=null&&sort==3}">
											<option value="shop?sort=3" selected>Giá cao đến
												thấp</option>
										</c:when>
										<c:otherwise>
											<option value="shop?sort=3">Giá cao đến thấp</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${sort!=null&&sort==4}">
											<option value="shop?sort=4" selected>A-Z</option>
										</c:when>
										<c:otherwise>
											<option value="shop?sort=4">A-Z</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${sort!=null&&sort==5}">
											<option value="shop?sort=5" selected>Z-A</option>
										</c:when>
										<c:otherwise>
										<option value="shop?sort=5">Z-A</option>
										</c:otherwise>
									</c:choose>
									

								</select>
							</div>
						</div>
						<c:if test="${description!=null and !empty description }">
							<div class="col-lg-12 col-md-12 col-sm-12 mt-3">
								<div>
									<p>Mô tả: ${description }</p>

								</div>
							</div>
						</c:if>
						<c:if test="${fromprice!=null  }">
							<c:if test="${fromprice==1 }">
								<div class="col-lg-12 col-md-12 col-sm-12 mt-3">
									<div>
										<span class="label label-info">Sản phẩm trong khoảng từ
											nhỏ hơn 200.000VND </span>

									</div>
								</div>
							</c:if>
							<c:if test="${fromprice==2 }">
								<div class="col-lg-12 col-md-12 col-sm-12 mt-3">
									<div>
										<span class="label label-info">Sản phẩm trong khoảng từ
											200.000VND đên 500.000VND </span>

									</div>
								</div>
							</c:if>
							<c:if test="${fromprice==3 }">
								<div class="col-lg-12 col-md-12 col-sm-12 mt-3">
									<div>
										<span class="label label-info">Sản phẩm trong khoảng từ
											500.000VND đên 1.000.000VND </span>

									</div>
								</div>
							</c:if>
							<c:if test="${fromprice==4 }">
								<div class="col-lg-12 col-md-12 col-sm-12 mt-3">
									<div>
										<span class="label label-info">Sản phẩm trong khoảng từ
											trên 1.000.000VND </span>

									</div>
								</div>
							</c:if>
						</c:if>

					</div>
				</div>

				<div class="row">

					<c:forEach items="${ products}" var="p">
						<div class="col-lg-4 col-md-6 col-sm-6">
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
									<button onclick="addBasket('${p.slug}')"
										class="btn btn-primary">+ Add To Cart</button>
									<c:choose>
										<c:when test="${p.sale_price>0}">
											<h5>
												<fmt:formatNumber value="${p.sale_price}"
													currencySymbol="VND" type="currency"></fmt:formatNumber>
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
				<div class="row">
					<div class="col-lg-12">
						<c:forEach var="i" begin="1" end="${totalpage}">
							<c:choose>
								<c:when test="${i==currentpage}">
									<span> ${i} </span>
								</c:when>
								<c:otherwise>
									<a
										href="shop?cateid=${cateid}&searchname=${searchname}&fromprice=${fromprice}&sort=${sort}&pageno=${i}">
										${i} </a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
