<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <style>
    .custom-input {
      max-width: 200px; /* Điều chỉnh kích thước theo ý muốn */
    }
  </style>
</head>
<div class="container-fluid">

  <!-- start page title -->
  <div class="row">
    <div class="col-12">
      <div class="page-title-box d-flex justify-content-between align-items-center">
        <h4 class="page-title">Nhập hàng</h4>
        <a href="${pageContext.request.contextPath}/manage/order-in/list" class="btn btn-secondary">Quay lại</a>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <div class="row mb-2">
            <div class="col-md-8">
              <form action="<c:url value='/manage/order-in/${order.orderId}/update-date' />" method="post" class="d-flex align-items-center">
                <div class="form-group row flex-grow-1">
                  <label for="dateInput" class="col-form-label">Ngày nhập hàng</label>
                  <div class="d-flex align-items-center">
                    <input type="datetime-local" class="form-control form-control-sm me-2 custom-input" id="dateInput" name="orderDate" value="<c:out value='${order.orderDate}' />" required />
                    <button type="submit" class="btn btn-primary me-2">Cập nhật Ngày</button>
                  </div>
                </div>
              </form>
            </div>
            <div class="col-md-4 text-end d-flex align-items-center justify-content-center">
              <a href="${pageContext.request.contextPath}/manage/order-in/${order.orderId}/new" class="btn btn-success">Nhập hàng</a>
            </div>
          </div>
          <div class="table-responsive">
            <table id="example" class="table table-centered" style="width: 100%">
              <thead class="table-light">
              <tr>
                <th>STT</th>
                <th>Nguyên liệu</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
                <th style="width: 85px;">Chức năng</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="orderin" items="${order.orderInDetails}">
                <tr>
                  <td></td>
                  <td>${orderin.material.materialName}</td>
                  <td>${orderin.quantity} (${orderin.material.unitsOfMeasurement})</td>
                  <td>${orderin.price}</td>
                  <td class="table-action">
                    <a href="<c:url value='/manage/order-in/${order.orderId}/edit/${orderin.id}'/>" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                    <form action="<c:url value='/manage/order-in/${order.orderId}/delete/${orderin.id}' />" method="post" style="display:inline;">
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
