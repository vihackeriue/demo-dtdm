<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid">

  <!-- start page title -->
  <div class="row">
    <div class="col-12">
      <div class="page-title-box">
        <h4 class="page-title">Nhập hàng</h4>
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
              <a href="<c:url value='/manage/order-in/new' />" class="btn btn-danger mb-2"><i
                      class="mdi mdi-plus-circle me-2"></i>Thêm đợt nhập hàng</a>
            </div>
          </div>

          <div class="table-responsive">
            <table id="example" class="table table-centered" style="width: 100%">
              <thead class="table-light">
              <tr>
                <th>ID</th>
                <th>Ngày</th>
                <th>Tổng tiền</th>
                <th style="width: 85px;">Chức năng</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="order" items="${orders}">
                <tr>
                  <td>${order.orderId}</td>
                  <td>${order.orderDate}</td>
                  <td>${order.orderTotal}</td>
                  <td class="table-action">
                    <a href="<c:url value='/manage/order-in/${order.orderId}'/>" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                    <form action="<c:url value='/manage/order-in/delete/${order.orderId}' />" method="post" style="display:inline;">
                      <button type="submit" class="action-icon" style="border: none; background: none;">
                        <i class="mdi mdi-delete"></i>
                      </button>
                    </form>
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

</div>
<!-- container -->

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.1.3/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.1.3/js/dataTables.bootstrap5.js"></script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    new DataTable('#example', {
      "rowCallback": function(row, data, index) {
        // Gán giá trị STT
        $('td:eq(0)', row).html(index + 1); // Cột đầu tiên là STT
      }
    });
  });
</script>
