<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class=" d-flex align-items-center justify-content-center">

		<form class="w-50" method="post">
			<div class="mb-3">
				<h3>
					Login <span class="badge badge-secondary"></span>
				</h3>
								<c:if test="${sessionScope.msg != null}">
					<div class="alert alert-waring alert-dismissible fade show"
						role="alert">
						<strong class="text-danger">${sessionScope.msg}</strong>.
						  <c:remove var="msg" scope="session" />
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
			</div>
			<!-- Email input -->
			<div class="form-outline mb-4">
			<h4 style="color:red;">${msg}</h4>
				<input type="text" id="form2Example1" name="username" class="form-control" /> <label
					class="form-label" for="form2Example1">Username</label>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-4">
				<input type="text" name="password" id="form2Example2" class="form-control" /> <label
					class="form-label" for="form2Example2">Password</label>
			</div>

			

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary btn-block mb-4">Sign
				in</button>

			<!-- Register buttons -->
		</form>
	</div>

</div>