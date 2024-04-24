<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<style>

.error{color:red;}

</style>
<div class="container">

<h3>Thêm mới sản phẩm</h3>

<div>
	<f:form
		action="${pageContext.servletContext.contextPath}/admin/updateProduct"
		method="post" enctype="multipart/form-data" class="forms-sample"
		modelAttribute="product">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Thông tin thêm mới</h4>


							<div class="form-group row">
								<label for="exampleInputUsername2"
									class="col-sm-3 col-form-label">Id sản phẩm</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control"
										id="exampleInputUsername2" path="id" />
										<p>
										<f:errors cssClass="error" path="id"></f:errors>
									</p>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên
									sản phẩm</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control" id="name" path="name"
										onkeyup="ChangeToSlug();" />
										<f:errors cssClass="error" path="name"></f:errors>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">Slug</label>
								<div class="col-sm-9">
									<f:input type="text" class="form-control" id="slug" path="slug" />
									<f:errors cssClass="error" path="slug"></f:errors>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2"
									class="col-sm-3 col-form-label">Giá</label>
								<div class="col-sm-9">
									<f:input class="form-control" path="price" />
										<f:errors cssClass="error" path="price"></f:errors>
								</div>

							</div>
							<div class="form-group row">
								<label for="exampleInputConfirmPassword2"
									class="col-sm-3 col-form-label">Giá khuyến mãi</label>
								<div class="col-sm-9">
									<f:input class="form-control" path="sale_price" />
									<f:errors cssClass="error" path="sale_price"></f:errors>
									<h5 class="error">${pricefail}</h5>
								</div>
							</div>
							<div
								class=" ml-4 mb-3 form-check form-check-flat form-check-primary">
								<label class="form-check-label"> </label>
								<f:checkbox class="form-check-input" path="hightlight" />
								Nổi bật
							</div>
							<div
								class=" ml-4 mb-3 form-check form-check-flat form-check-primary">
								<label class="form-check-label"> </label>
								<f:checkbox class="form-check-input" path="status" />
								Còn hàng
							</div>
							<button class="btn btn-primary mr-2">Submit</button>
							<button class="btn btn-light">Cancel</button>

						</div>
					</div>
				</div>
				<div class=" col-md-7 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<div class="form-group">
								<div class="input-group">
									<label for="exampleInputConfirmPassword2" class="col-sm-3 ">Danh
										mục</label>
									<f:select path="categoryId" items="${cates}"
										itemValue="categoryId" itemLabel="categoryName"
										class="form-select" aria-label="Default select example">

									</f:select>
								</div>
							</div>
							<div class="form-group">
								<div class="w-50 h-30">
									<label for="exampleInputConfirmPassword2">Mô tả</label>
									<f:textarea path="description"></f:textarea>
									<f:errors cssClass="error" path="description"></f:errors>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-6 mt-4">
									<label for="exampleInputUsername2" class=" col-form-label">Ảnh
										Cũ</label>
									<div class="">
										<input type="hidden" name="pictureOld"
											value="${product.image}" /> <img
											src="${contextPath}/${product.image}"
											style="width: 300px; height: 200px;" />
									</div>
								</div>
								<div class="col-lg-6">
									<label for="exampleInputUsername2" class=" col-form-label">Ảnh
										sản phẩm</label>
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
	CKEDITOR.replace('description')
	function ChangeToSlug() {
		var title, slug;

		//Lấy text từ thẻ input title 
		title = document.getElementById("name").value;

		//Đổi chữ hoa thành chữ thường
		slug = title.toLowerCase();

		//Đổi ký tự có dấu thành không dấu
		slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
		slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
		slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
		slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
		slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
		slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
		slug = slug.replace(/đ/gi, 'd');
		//Xóa các ký tự đặt biệt
		slug = slug
				.replace(
						/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi,
						'');
		//Đổi khoảng trắng thành ký tự gạch ngang
		slug = slug.replace(/ /gi, " - ");
		//Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
		//Phòng trường hợp người nhập vào quá nhiều ký tự trắng
		slug = slug.replace(/\-\-\-\-\-/gi, '-');
		slug = slug.replace(/\-\-\-\-/gi, '-');
		slug = slug.replace(/\-\-\-/gi, '-');
		slug = slug.replace(/\-\-/gi, '-');
		//Xóa các ký tự gạch ngang ở đầu và cuối
		slug = '@' + slug + '@';
		slug = slug.replace(/\@\-|\-\@|\@/gi, '');
		//In slug ra textbox có id “slug”
		document.getElementById('slug').value = slug;
	}
	function PreviewImage() {
		var oFReader = new FileReader();
		oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

		oFReader.onload = function(oFREvent) {
			document.getElementById("uploadPreview").src = oFREvent.target.result;
		};
	};
</script>
</div>