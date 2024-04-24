<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<style>
.error {
	color: red;
}
</style>


<div class="container mb-5">
	<div class="mb-3">
		<h3>Chỉnh sửa tài khoản</h3>
	</div>
	<f:form
		action="${pageContext.servletContext.contextPath}/updateAccount"
		method="post" enctype="multipart/form-data" class="forms-sample"
		modelAttribute="acc">
		<f:hidden path="accountId" />
		<f:hidden path="userName" />
		<f:hidden path="password" />
		<f:hidden path="active" />
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Chỉnh sửa tài khoản</h4>


							<div class="form-group row">
								<label for="exampleInputUsername2"
									class="col-sm-3 col-form-label">Tên tài khoản</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control" path="fullName" />
									<p>
										<f:errors cssClass="error" path="fullName"></f:errors>
									</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">Email</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control" path="email" />
									<f:errors cssClass="error" path="email"></f:errors>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">Address</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control" path="address" />
									<f:errors cssClass="error" path="address"></f:errors>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">Phone</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control" path="phone" />
									<f:errors cssClass="error" path="phone"></f:errors>
								</div>
							</div>
							<button class="btn btn-primary mr-2">Submit</button>
							<button class="btn btn-light">Cancel</button>

						</div>
					</div>
				</div>
				<div class=" col-md-7 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<div class="form-group row">
								<div class="col-lg-6 mt-4">
									<label for="exampleInputUsername2" class=" col-form-label">Ảnh
										Cũ</label>
									<div class="">
										<input type="hidden" name="pictureOld" value="${acc.picture}" />
										<img src="${contextPath}/${acc.picture}"
											style="width: 300px; height: 200px;" />
									</div>
								</div>
								<div class="col-lg-6">
									<label for="exampleInputUsername2" class=" col-form-label">Ảnh
										Mới</label>
									<div class="">
										<input type="file" id="uploadImage" name="file"
											onchange="PreviewImage();" /> <img id="uploadPreview"
											style="width: 300px; height: 200px;" />
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</f:form>
</div>



<script>
	function PreviewImage() {
		var oFReader = new FileReader();
		oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

		oFReader.onload = function(oFREvent) {
			document.getElementById("uploadPreview").src = oFREvent.target.result;
		};
	};
</script>