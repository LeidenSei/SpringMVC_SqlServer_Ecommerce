//Document ready thì show loại sách và số lượng trong giỏ hàng (jquery ajax)
$(function(){
	$.get(path + "/categories", function(data) {
		$('.dropdown-menu').html(data);
	});
	$.get(path + "/countItems", function(data) {
		$('#basket_total').html(data);
	});
});
//hàm xử lý add 1 sách vào giỏ hàng (jquery ajax)
function addBasket(slug) {
			$.get(path + "/addItem/" + slug, function(data) {
				$('#basket_total').html(data);
				toastr.success('Thêm giỏ hàng thành công','Shop')
			});
		}
//hàm xử lý cập nhật lại số lượng trong giỏ hàng (jquery ajax)
function updateBasket(slug, value) {
	$.get(path + "/updateBasket/" + slug + "/" + value, function() {
		window.location.reload();
	});
}
//hàm xử lý xóa 1 sách trong giỏ hàng (jquery ajax)
function removeItem(slug) {
	if (confirm('Bạn có muốn xóa không?')) {
		$.get(path + "/removeItem/" + slug, function() {
			window.location.reload();
		});
	}
}