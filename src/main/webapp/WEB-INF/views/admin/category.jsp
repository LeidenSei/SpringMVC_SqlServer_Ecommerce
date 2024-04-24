<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="">

	<div class="card w-100">
		<div class="card-body p-4 ">
			<div class="mr-5 mb-3 d-flex justify-content-between">
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
								<c:if test="${sessionScope.msgDeleteCate != null}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>${sessionScope.msgDeleteCate}</strong>.
						<c:remove var="msgDeleteCate" scope="session" />
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<div>
					<a class="btn btn-success m-1" href="addcategory">Add Category</a>
				</div>
				<div>
					<form action="" method="post">
						<div class="input-group rounded">
							<input type="text" name="searchname" class="form-control rounded"
								placeholder="Search by name" aria-label="Search "
								aria-describedby="search-addon" />
							<button class="input-group-text border-0" id="search-addon">
								<i class="fas fa-search">Search</i>
							</button>
						</div>
					</form>

				</div>
			</div>

			<h5 class="card-title fw-semibold mb-4">List Category</h5>
			<div class="table-responsive">
				<table class="table text-nowrap mb-0 align-middle">
					<thead class="text-dark fs-4">
						<tr>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Id</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Category Name</h6>
							</th>
							<th class="border-bottom-0">
								<h6 class="fw-semibold mb-0">Slug</h6>
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
						<c:forEach items="${cates}" var="c">
							<tr>
								<td class="border-bottom-0"><h6 class="fw-semibold mb-0">${c.categoryId}</h6></td>
								<td class="border-bottom-0">
									<h6 class="fw-semibold mb-1">${c.categoryName}</h6>
								</td>
								<td class="border-bottom-0">
									<p class="mb-0 fw-normal">${c.slug}</p>
								</td>
								<td class="border-bottom-0"><c:choose>
										<c:when test="${c.status==true}">
											<div class="d-flex align-items-center gap-2">
												<span class="badge bg-success rounded-3 fw-semibold">Đang
													hoạt động</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="d-flex align-items-center gap-2">
												<span class="badge bg-danger rounded-3 fw-semibold">Tạm
													hoãn</span>
											</div>
										</c:otherwise>
									</c:choose></td>
								<td class="border-bottom-0"><a
									class="btn btn-outline-danger btn-fw"
									href="${contextPath}/admin/deleteCate/${c.categoryId}"
									onclick="return confirm('Bạn có muốn xóa không?')">Xóa</a> <a
									class="btn btn-outline-warning btn-fw"
									href="${contextPath}/admin/editCate/${c.categoryId}">Sửa</a></td>
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
							<a href="category?cateid=${cateid}&pageno=${i}"> ${i} </a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</div>