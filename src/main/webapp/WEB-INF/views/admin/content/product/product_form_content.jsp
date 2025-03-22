<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<style>
.fixed-size-image {
	width: 100px; /* Hoặc kích thước bạn mong muốn */
	height: 100px; /* Hoặc kích thước bạn mong muốn */
	object-fit: cover; /* Đảm bảo hình ảnh không bị biến dạng */
	margin-top: 8px;
}
</style>
<div class="container-fluid p-0">

	<div class="mb-3">
		<h1 class="h3 d-inline align-middle">${product.productId == null ? 'Thêm sản phẩm' : 'Chỉnh sửa sản phẩm'}</h1>

	</div>
	<div class="card">
		<div class="card-body">
			<form action="<c:url value='/manage/product/save'/>" method="post"
				  enctype="multipart/form-data"  id="categoryForm"  class="needs-validation" novalidate>
				<div class="row">
					<div class="col-lg-6">

						<c:if test="${product.productId != null}">
							<input type="hidden" name="productId" value="${product.productId}">
						</c:if>
						<div class="mb-3">
							<label for="productName" class="form-label">Product name</label> <input
								type="text" id="productName" class="form-control"
								name="productName" placeholder="Name" required
								value="${product.productName }">
						</div>

						<div class="mb-3">
							<label for="productDes" class="form-label">Product
								description</label>
							<textarea class="form-control" id="productDes" rows="5"
									  placeholder="Description" name="description" required data-value="${product.description}">
							</textarea>
						</div>



						<div class="mb-3">
							<button type="submit" class="btn btn-primary">${product.productId != 0 ? 'Cập nhật' : 'Thêm'}</button>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="mb-3">
							<label for="categoryId" class="form-label">Product
								category</label>
							<select class="form-select" id="categoryId"
									name="categoryId" required>
								<option value="">Select category</option>

								<c:forEach var="category" items="${categories}">
									<option value="${category.categoryId}"
										${category.categoryId == product.category.categoryId ? 'selected' : ''}>
											${category.categoryName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="mb-3">
							<label for="productPrice" class="form-label">Product price</label>
							<input type="number" id="productPrice" class="form-control"
								   name="price" placeholder="Price" required
								   value="${product.price}">
						</div>

						<div class="mb-3">
							<label for="example-fileinput" class="form-label">Product
								Image</label> <input type="file" id="example-fileinput"
													 class="form-control" name="imageFile" accept="image/*"
													 onchange="previewImage()">

							<!-- Hiển thị hình ảnh hiện tại nếu không có file mới được chọn -->
							<c:if test="${not empty product.image}">
								<img id="productImage" src="<c:url value="${product.image}"/>"
									 alt="Product Image" title="Product Image"
									 class=" fixed-size-image rounded me-3" height="100">
							</c:if>

							<!-- Thẻ img để hiển thị ảnh được chọn -->
							<img id="imagePreview" style="display: none;" alt="Image Preview"
								 class="rounded me-3 fixed-size-image" height="100">
						</div>


					</div>
				</div>
			</form>
		</div>

	</div>

</div>
<script>
		function previewImage() {
			var fileInput = document.getElementById('example-fileinput');
			var imagePreview = document.getElementById('imagePreview');
			var productImage = document.getElementById('productImage');

			if (fileInput.files && fileInput.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					// Hiển thị ảnh mới được chọn
					imagePreview.src = e.target.result;
					imagePreview.style.display = 'block';

					// Ẩn ảnh hiện tại
					if (productImage) {
						productImage.style.display = 'none';
					}
				}

				reader.readAsDataURL(fileInput.files[0]);
			} else {
				// Hiển thị ảnh hiện tại nếu không có file mới được chọn
				if (productImage) {
					productImage.style.display = 'block';
				}

				imagePreview.style.display = 'none';
			}
		}
		document.getElementById('categoryForm').addEventListener('submit', function(event) {

			if (!this.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
				this.classList.add('was-validated');
			}

		});
	</script>