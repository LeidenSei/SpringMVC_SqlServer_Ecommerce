<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section style="background-color: #eee;">
	<div class="container py-5">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="${contextPath}/home">Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/profile">User</a></li>
						<li class="breadcrumb-item active" aria-current="page">User
							Profile</li>
					</ol>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<c:choose>
							<c:when test="${acc.picture!=null}">
								<img src="${contextPath}/${acc.picture}" alt="avatar"
									class=" img-fluid" style="width: 250px;">
							</c:when>
							<c:otherwise>
								<img
									src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
									alt="avatar" class=" img-fluid" style="width: 150px;">
							</c:otherwise>
						</c:choose>

						<h5 class="my-3">${acc.userName}</h5>
						<p class="text-muted mb-1">${acc.address}</p>
						<div class="d-flex justify-content-center mb-2">
							<a href="editAccount/${acc.accountId}" class="btn btn-primary">Thay
								đổi thông tin</a>

						</div>
					</div>
				</div>

			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Full Name</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${acc.fullName}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Email</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${acc.email}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${acc.phone}</p>
							</div>
						</div>

						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Address</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0">${acc.address}</p>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-lg-12">
				<div class="">
					<div class="card mb-4 mb-md-0">
						<div class="card-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Mã đơn hàng</th>
										<th scope="col">Ngày đặt</th>
										<th scope="col">Thanh toán</th>
										<th scope="col">Trạng thái</th>
										<th scope="col">Chi tiết</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="o" items="${orders}">
										<tr>
											<th scope="row">${o.orderId}</th>
											<td>${o.orderDate}</td>
											<c:choose>
												<c:when test="${o.methodPayment==1}">
													<td>Bằng thẻ tín dụng</td>
												</c:when>
												<c:otherwise>
													<td>Trực tiếp</td>
												</c:otherwise>
											</c:choose>


											<td><c:choose>
													<c:when test="${o.orderStatus == 0}">
														      Đang chuẩn bị
														      <a
															href="${contextPath}/changStatusOrder/${o.orderId}"
															class="btn btn-danger">Hủy đơn hàng</a>
													</c:when>
													<c:when test="${o.orderStatus == 1}">
						      Đang giao
						    </c:when>
													<c:when test="${o.orderStatus == 2}">
      Đã gửi
    </c:when>
													<c:otherwise>
      Đã hủy
       <a href="${contextPath}/changStatusOrder2/${o.orderId}"
															class="btn btn-success">Khôi phục đơn hàng</a>
													</c:otherwise>
												</c:choose></td>


											<td><a
												href="${contextPath}/showOrderDetail/${o.orderId}"
												class="btn btn-info">Chi tiết đơn hàng</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>