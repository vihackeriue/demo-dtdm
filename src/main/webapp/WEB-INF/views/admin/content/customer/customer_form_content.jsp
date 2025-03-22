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
        <h1 class="h3 d-inline align-middle">${customer.customerId == null ? 'Thêm khách hàng' : 'Chỉnh sửa thông tin khách hàng'}</h1>

    </div>
    <div class="card">
        <form action="<c:url value='/manage/customer/save'/>" method="post"
              class="card-body">
            <div class="row">
                <div class="col-lg-6">

                    <c:if test="${customer.customerId != null}">
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                    </c:if>
                    <div class="mb-3">
                        <label for="nameCustomer" class="form-label">Họ tên</label> <input
                            type="text" id="nameCustomer" class="form-control"
                            name="nameCustomer" placeholder="Name" required
                            value="${customer.nameCustomer }">
                    </div>

                    <div class="mb-3">
                        <label for="emailCustomer" class="form-label">Email</label> <input
                            type="email" id="emailCustomer" class="form-control"
                            name="emailCustomer" placeholder="Email" required
                            value="${customer.emailCustomer }">
                    </div>



                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">${customer.customerId != null ? 'Cập nhật' : 'Thêm'}</button>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="mb-3">
                        <label for="phoneCustomer" class="form-label">Số điện thoại</label>
                        <input type="text" id="phoneCustomer" class="form-control"
                               name="phoneCustomer" placeholder="Số điện thoại" required
                               value="${customer.phoneCustomer}">
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
