<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="">

	<div class="card w-100">
		<div class="card-body p-4 ">
			<div class="mr-5 mb-3 d-flex justify-content-between">
				<div>
					<form action="" method="post">
						<div class="input-group rounded">
							<input type="text" name="orderId" class="form-control rounded"
								placeholder="Search by orderId" value="${orderId}"
								aria-label="Search " aria-describedby="search-addon" />
							<button type="submit" class="input-group-text border-0"
								id="search-addon">
								<i class="fas fa-search">Search</i>
							</button>
						</div>
					</form>

				</div>
			</div>

			<h2 class="text-info">Danh sách đơn hàng</h2>
			<div class="table-responsive">
				<table class="table text-nowrap mb-0 align-middle">
					<thead class="text-dark fs-4">
						<tr>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Order Id</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Tên khách hàng</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Ngày tạo</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Trạng thái</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Action</h6>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="o">
							<tr>
								<td class="border-bottom-0"><h6 class="fw-semibold mb-0">${o.orderId}</h6></td>
								<td class="border-bottom-0">
									<h6 class="fw-semibold mb-1">${o.acc.fullName}</h6>
								</td>
								<td class="border-bottom-0">
									<p class="mb-0 fw-normal">${o.orderDate}</p>
								</td>
								<td class="border-bottom-0"><c:choose>
										<c:when test="${o.orderStatus == 0}">
											<div class="text-warning">Đang chuẩn bị</div>

										</c:when>
										<c:when test="${o.orderStatus == 1}">
											<div class="text-info">Đang giao</div>
										</c:when>
										<c:when test="${o.orderStatus == 2}">
											<div class="text-success">Đã gửi</div>
										</c:when>
										<c:otherwise>
											<div class="text-danger">Đã hủy</div>

										</c:otherwise>
									</c:choose></td>
								<td class="border-bottom-0"><a
									class="btn btn-outline-danger btn-fw" href=""
									onclick="return confirm('Bạn có muốn xóa không?')">Xóa</a> <a
									class="btn btn-outline-info btn-fw"
									href="editOrder/${o.orderId}">Cập nhật</a>
									<a
									class="btn btn-outline-success btn-fw"
									href="showOrderDetailAdmin/${o.orderId}">Chi tiết</a>
									</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
				<c:forEach var="i" begin="1" end="${totalpage}">
					<c:choose>
						<c:when test="${i==currentpage}">
							<span> ${i} </span>
						</c:when>
						<c:otherwise>
							<a href="listorder?orderId=${orderId}&pageno=${i}"> ${i} </a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</div>