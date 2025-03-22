<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<style>
    .card-body {
        height: 351px;
    }
    .table-scroll {
		max-height: 351px;
        overflow-y: auto;
    }
</style>
<div class="container-fluid">

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Hyper</a></li>
                        <li class="breadcrumb-item"><a href="javascript: void(0);">eCommerce</a></li>
                        <li class="breadcrumb-item active">Order Details</li>
                    </ol>
                </div>
                <h4 class="page-title">Thông tin chi tiết </h4>
            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row justify-content-center">
        <div class="col-lg-7 col-md-10 col-sm-11">



        </div>
    </div>
    <!-- end row -->


    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body" >
                    <h4 class="header-title mb-3">Lịch sử đơn hàng</h4>

                    <div class="table-responsive table-centered table-scroll" >
                        <table class="table mb-0 table-list" id="">
                            <thead class="table-light">
                            <tr>
                                <th>STT</th>
                                <th>Sản phẩm</th>


                                <th>Tổng tiền</th>
                                <th>Ngày mua hàng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orders}">
                            <tr>
                                <td></td>
                                <td>
                                    <c:forEach var="detail" items="${order.orderOutDetails}">
									<p>${detail.product.productName} x ${detail.quantity}</p>

                                    </c:forEach>
                                </td>

                                <td>${order.orderTotal}</td>
                                <td>${order.orderDate}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- end table-responsive -->

                </div>
            </div>
        </div> <!-- end col -->

        <div class="col-lg-7">
            <div class="card">
                <div class="card-body">
                    <h4 class="header-title mb-3">Mã giảm giá</h4>

                    <div class="table-responsive">
                        <table class="table mb-0 table-list" >
                            <thead class="table-light">
                            <tr>
                                <th>STT</th>
                                <th>Mã giảm giá</th>
                                <th>% giảm</th>
                                <th>Ngày hết hạn</th>
                                <th>Số lượng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="voucher" items="${vouchers}">
                            <tr>
                                <td></td>
                                <td>${voucher.code}</td>
                                <td>${voucher.discount}%</td>
                                <c:forEach var="detail" items="${voucher.vouchers}">
                                <td>${detail.shelfLife}</td>
                                    <td>${detail.quantity}</td>
                                </c:forEach>

                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- end table-responsive -->

                </div>
            </div>
        </div> <!-- end col -->

        <div class="col-lg-5">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                    <h4 class="header-title mb-3">Thông tin khách hàng</h4>
                        <a class="btn btn-primary" href="<c:url value='/manage/customer/edit/${customer.customerId}'/>">Chỉnh sửa thông tin</a>
                    </div>
                    <h5>${customer.nameCustomer}</h5>


                    <address class="mb-0 font-14 address-lg">
                        SĐT: ${customer.phoneCustomer}<br>
                        Email: ${customer.emailCustomer}<br>

                    </address>

                </div>
            </div>
        </div>
    </div>
    <!-- end row -->


<%--    <div class="row">--%>
<%--        <div class="col-lg-4">--%>
<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <h4 class="header-title mb-3">Shipping Information</h4>--%>

<%--                    <h5>Stanley Jones</h5>--%>

<%--                    <address class="mb-0 font-14 address-lg">--%>
<%--                        795 Folsom Ave, Suite 600<br>--%>
<%--                        San Francisco, CA 94107<br>--%>
<%--                        <abbr title="Phone">P:</abbr> (123) 456-7890 <br>--%>
<%--                        <abbr title="Mobile">M:</abbr> (+01) 12345 67890--%>
<%--                    </address>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div> <!-- end col -->--%>

<%--        <div class="col-lg-4">--%>
<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <h4 class="header-title mb-3">Billing Information</h4>--%>

<%--                    <ul class="list-unstyled mb-0">--%>
<%--                        <li>--%>
<%--                            <p class="mb-2"><span class="fw-bold me-2">Payment Type:</span> Credit Card</p>--%>
<%--                            <p class="mb-2"><span class="fw-bold me-2">Provider:</span> Visa ending in 2851</p>--%>
<%--                            <p class="mb-2"><span class="fw-bold me-2">Valid Date:</span> 02/2020</p>--%>
<%--                            <p class="mb-0"><span class="fw-bold me-2">CVV:</span> xxx</p>--%>
<%--                        </li>--%>
<%--                    </ul>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div> <!-- end col -->--%>

<%--        <div class="col-lg-4">--%>
<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <h4 class="header-title mb-3">Delivery Info</h4>--%>

<%--                    <div class="text-center">--%>
<%--                        <i class="mdi mdi-truck-fast h2 text-muted"></i>--%>
<%--                        <h5><b>UPS Delivery</b></h5>--%>
<%--                        <p class="mb-1"><b>Order ID :</b> xxxx235</p>--%>
<%--                        <p class="mb-0"><b>Payment Mode :</b> COD</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div> <!-- end col -->--%>
<%--    </div>--%>
    <!-- end row -->


</div>