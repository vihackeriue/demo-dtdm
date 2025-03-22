<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<script src="https://kit.fontawesome.com/6f5caf640a.js" crossorigin="anonymous"></script>

<div class="container-fluid">
  <!-- start page title -->
  <div class="row">
    <div class="col-12">
      <div class="page-title-box">
        <h4 class="page-title">Danh sách danh mục</h4>
      </div>
    </div>
  </div>
  <!-- end page title -->
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <div class="row mb-2">
            <div class="col-sm-4">
              <a href="<c:url value='/manage/category/new'/>" class="btn btn-primary mb-2"><i
                      class="mdi mdi-plus-circle me-2"></i> Thêm danh mục mới</a>
            </div>

          </div>

          <div class="table-responsive">
            <table  class="table table-centered display table-list" style="width: 100%">
              <thead class="table-light">

              <tr>
                <th class="d-none d-xl-table-cell">STT</th>
                <th class="d-none d-xl-table-cell">Tên danh mục</th>
                <th class="d-none d-md-table-cell">Mô tả</th>
                <th class="d-none d-md-table-cell">Hình ảnh</th>

                <th style="width: 85px;">Hành động</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${categories}" var="category">
                <tr>
                  <td>${category.categoryId}</td>
                  <td class="category-name">${category.categoryName}</td>
                  <td class="category-description">${category.categoryDescription}</td>
                  <td>
                    <img src="<c:url value="/resources/images/category/${category.image}"/>"
                         alt="Category Image" title="Category Image"
                         class="category-image rounded me-3"
                         height="50" width="50">
                  </td>

                  <td class="table-action">
                    <a href="<c:url value='/manage/category/edit/${category.categoryId}' />"
                       class="action-icon">
                      <i class="fa-solid fa-pen"></i>
                    </a>
                    <a href="<c:url value='/manage/category/delete/${category.categoryId}' />"
                       class="action-icon">
                      <i class="fa-solid fa-trash"></i>
                    </a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <!-- end card-body-->
      </div>
      <!-- end card-->
    </div>
    <!-- end col -->
  </div>
  <!-- end row -->
  <!-- Modal HTML -->
</div>

<script>
  $(document).ready(function () {
    $('#editModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget); // Button that triggered the modal
      var userId = button.data('user-id'); // Extract info from data-* attributes
      var username = button.data('username');
      var role = button.data('role');

      var modal = $(this);
      modal.find('#username').val(username);
      modal.find('#role').val(role);
      modal.find('#userId').val(userId);
    });
  });
</script>