<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="">

	<div class="card w-100">

		<div class="card-body p-4 ">

			<div class="mr-5 mb-3">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<a class="btn btn-success m-1" href="addproduct">Add Product</a>
					</div>
					<div>
						<h2>Tìm kiếm</h2>
						<c:if test="${sessionScope.msg != null}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<strong>${sessionScope.msg}</strong>.
								<c:remove var="msg" scope="session" />
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>

						
						<form action="" method="post">
							Chọn danh mục<select name="cateid">
								<option value="0">---------Hiển thị tất cả-----------</option>
								<c:forEach var="c" items="${category}">
									<c:choose>
										<c:when test="${c.categoryId==cateid}">
											<option value="${c.categoryId}" selected>${c.categoryName}</option>
										</c:when>
										<c:otherwise>
											<option value="${c.categoryId}">${c.categoryName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select> <input type="text" value="${searchname}" name="searchname"
								placeholder="Nhập tên cần tìm" />
							<button class="btn btn-primary key">Tìm</button>
						</form>
					</div>
				</div>


			</div>
			<p style="color: green">${msg}</p>
			<h5 class="card-title fw-semibold mb-4">List Product</h5>
			<div class="table-responsive">
				<table class="table text-nowrap mb-0 align-middle">
					<thead class="text-dark fs-4">
						<tr>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Id</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Product Name</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Category</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Image</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Status</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Action</h6>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="p">
							<tr>
								<td class="border-bottom-0"><h6 class="fw-semibold mb-0">${p.id}</h6></td>
								<td class="border-bottom-0">
									<h6 class="fw-semibold mb-1">${p.name}</h6>
								</td>

								<td class="border-bottom-0">

									<p class="mb-0 fw-normal">${p.category.categoryName}</p>
								</td>
								<td class="border-bottom-0"><img
									src="${contextPath}/${p.image}" width="400" height="500" /></td>
								<td class="border-bottom-0"><c:choose>
										<c:when test="${p.status==true}">
											<div class="d-flex align-items-center gap-2">
												<span class="badge bg-success rounded-3 fw-semibold">Còn
													hàng</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="d-flex align-items-center gap-2">
												<span class="badge bg-danger rounded-3 fw-semibold">Hết
													hàng</span>
											</div>
										</c:otherwise>
									</c:choose></td>
								<td class="border-bottom-0"><a
									class="btn btn-outline-danger btn-fw"
									href="deleteProduct/${p.id}" onclick="return confirm('Bạn có muốn xóa không?')">Xóa</a> <a
									class="btn btn-outline-info btn-fw" href="">Chi tiết</a> <a
									class="btn btn-outline-warning btn-fw"
									href="editProduct/${p.id}">Sửa</a></td>
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
							<a
								href="listPro?cateid=${cateid}&?searchname=${searchname}&pageno=${i}">
								${i} </a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</div>