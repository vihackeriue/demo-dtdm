<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<div class="container-fluid pt-3">
  <c:if test="${not empty message}">
    <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
      <strong></strong>${message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  </c:if>
  <div class="mb-3">
    <h1 class="h3 d-inline align-middle">
      ${category.categoryId == null || category.categoryId == 0 ? 'Thêm Loại' : 'Chỉnh sửa Loại'}
    </h1>
  </div>
  <div class="card">
    <div class="card-body">
      <form id="categoryForm" action="<c:url value='/manage/category/new'/>"  method="post" enctype="multipart/form-data" class="needs-validation" novalidate >
        <div class="row">
          <div class="col-lg-6">
            <c:if test="${category.categoryId != 0}">
              <input type="hidden" name="categoryId" value="${category.categoryId}">
            </c:if>
            <div class="mb-3">
              <label for="categoryName" class="form-label">Category Name</label>
              <input type="text" id="categoryName" class="form-control" name="categoryName" placeholder="Name" required value="${category.categoryName}">
            </div>
            <div class="mb-3">
              <label for="categoryDescription" class="form-label">Category Description</label>
              <textarea class="form-control" id="categoryDescription" rows="5" placeholder="Description" name="categoryDescription" required>${category.categoryDescription}</textarea>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="mb-3">
              <label for="example-fileinput" class="form-label">Category Image</label>
              <input type="file" id="example-fileinput" class="form-control" name="imageFile" accept="image/*" onchange="previewImage()" required>
              <c:if test="${not empty category.image}">
                <img id="categoryImage" src="<c:url value='/resources/images/category/${category.image}'/>" alt="Category Image" title="Category Image" class="fixed-size-image rounded me-3" height="100" >
              </c:if>
              <img id="imagePreview" style="display: none;" alt="Image Preview" class="rounded me-3 fixed-size-image" height="100">
            </div>
            <div class="mb-3">
              <button type="submit" class="btn btn-primary">
                ${category.categoryId == null || category.categoryId == 0 ? 'Thêm' : 'Cập Nhật'}
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>

  </div>
</div>
<script>
  function previewImage() {
    const file = document.getElementById('example-fileinput').files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('imagePreview').src = e.target.result;
        document.getElementById('imagePreview').style.display = 'block';
      };
      reader.readAsDataURL(file);
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