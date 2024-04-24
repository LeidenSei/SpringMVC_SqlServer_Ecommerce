<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<style>

.error{color:red;}

</style>
<div class="mx-auto">

<div class="card row">
	<div class="card-body align-items-center ">
		<h4 class="card-title">Thêm mới danh mục</h4>
		<p class="card-description">Thông tin danh mục</p>
		<f:form action="insertCate" class="forms-sample w-100" method="post" modelAttribute="cate">
			<div class="form-group">
				<label for="exampleInputUsername1">Category Name</label> <f:input
					 class="form-control" id="name"
					path="categoryName" onkeyup="ChangeToSlug()"/>
					<f:errors cssClass="error" path="categoryName"></f:errors>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Slug</label> <f:input
					 class="form-control " path="slug" id="slug"
					placeholder="slug"/>
					<f:errors cssClass="error" path="slug"></f:errors>
					
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Mô tả</label> 
				<f:textarea path="description" id="description"></f:textarea>
				<f:errors cssClass="text-danger" path="description"></f:errors>
			</div>
			<div class="form-check form-check-flat form-check-primary">
				<label class="form-check-label">
					Trạng thái
				</label>
				<div class="ml-5 mb-5 mt-3">
				<f:checkbox class="form-check-input" path="status" /></div>
			</div>
			<button class="btn btn-primary mr-2">Submit</button>
			<button class="btn btn-light">Cancel</button>
		</f:form>
	</div>
</div>
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
</script>