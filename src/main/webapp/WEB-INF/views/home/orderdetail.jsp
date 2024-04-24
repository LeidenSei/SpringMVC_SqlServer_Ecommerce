<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
<a href="${contextPath}/profile" class="btn btn-success">Trở lại</a>
	<table class="table">
		<caption>Danh sách đơn hàng</caption>
		<thead>
			<tr>
				<th scope="col">Mã đặt hàng</th>
				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Ảnh</th>
				<th scope="col">Số lượng</th>
				<th scope="col">Tổng tiền</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="od" items="${orderDetails}">
				<tr>
					<th scope="row">${od.orderId}</th>
					<td>${od.product.name}</td>
					<td><img alt="" width="200px" height="200px"
						src="${contextPath}/${od.product.image}"></td>
					<td>${od.quantity}</td>
					<td><fmt:formatNumber value="${od.quantity*od.price}"
							type="currency" currencySymbol="VND"></fmt:formatNumber></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>