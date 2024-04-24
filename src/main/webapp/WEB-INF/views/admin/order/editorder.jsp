<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.error {
	color: red;
}
</style>
<div class="container">

	<h3>Chỉnh sửa trạng thái đơn hàng</h3>

	<div>
		<form action="${contextPath}/admin/updateOrderStatus/${order.orderId}" method="post" class="forms-sample">

			<div class="content-wrapper">
				<div class="row">
					<div class="col-md-5 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Thông tin thêm mới</h4>


								<div class="form-group row">
									<label for="exampleInputUsername2"
										class="col-sm-3 col-form-label">Mã đơn hàng</label>
									<div class="col-sm-9">
										<input type="text" disabled class="form-control"
											id="exampleInputUsername2" value="${order.orderId}" />

									</div>
								</div>
								<div class="form-group row">
									<label for="exampleInputEmail2" class="col-sm-3 col-form-label">Ngày
										đặt</label>
									<div class="col-sm-9">
										<input type="date" disabled value="${order.orderDate}"
											class="form-control" />

									</div>
								</div>
								<div class="form-group row">
									<label for="exampleInputMobile" class="col-sm-3 col-form-label">Địa
										chỉ</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" disabled
											value="${order.receiveAddress}" />
									</div>
								</div>
								<div class="form-group row">
									<label for="exampleInputMobile" class="col-sm-3 col-form-label">Số
										điện thoại</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" disabled
											value="${order.receivePhone}" />
									</div>
								</div>
								<div class="form-group row">
									<label for="exampleInputMobile" class="col-sm-3 col-form-label">Email</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" disabled
											value="${order.receiveEmail}" />
									</div>
								</div>
								<div class="form-group row">
									<label for="exampleInputMobile" class="col-sm-3 col-form-label">Phương
										thức thanh toán</label>
									<div class="col-sm-9">
										<c:choose>
											<c:when test="${order.methodPayment==1}">
												<input type="text" class="form-control" disabled
													value="Bằng thẻ tín dụng" />
											</c:when>
											<c:otherwise>
												<input type="text" class="form-control" disabled
													value="Thanh toán trực tiếp" />
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<div class="form-group row">
									<label for="exampleInputMobile" class="col-sm-3 col-form-label">Trạng
										thái</label> <select name="orderStatus" class="form-select"
										aria-label="Default select example">
										<c:choose>
											<c:when test="${order.orderStatus==0}">
												<option value="0" selected>Đang chuẩn bị</option>
											</c:when>
											<c:otherwise>
												<option value="0">Đang chuẩn bị</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${order.orderStatus==1}">
												<option value="1" selected>Đang giao</option>
											</c:when>
											<c:otherwise>
												<option value="1">Đang giao</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${order.orderStatus==2}">
												<option value="2" selected>Đã gửi</option>
											</c:when>
											<c:otherwise>
												<option value="2">Đã gửi</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${order.orderStatus==3}">
												<option value="3" selected>Đã Hủy</option>
											</c:when>
											<c:otherwise>
												<option value="3">Đã Hủy</option>
											</c:otherwise>
										</c:choose>

									</select>
								</div>
								<button class="btn btn-primary mr-2">Submit</button>
								<button class="btn btn-light">Cancel</button>

							</div>
						</div>
					</div>
					<div class=" col-md-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<div class="form-group">
									<div class="w-50 h-30">
										<label for="exampleInputConfirmPassword2">Mô tả</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" disabled
												value="${order.note}" />
										</div>

									</div>
								</div>
								<div class="form-group row">
									<div class="col-lg-6 mt-4">
										<label for="exampleInputUsername2" class=" col-form-label">Khách
											hàng:
											<h3>${order.acc.fullName}</h3>
										</label>
										<div class="">
											 <img
												src="${contextPath}/${order.acc.picture}"
												style="width: 300px; height: 200px;" />
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


</div>