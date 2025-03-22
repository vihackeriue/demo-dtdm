<%--
  Created by IntelliJ IDEA.
  User: TDTrung
  Date: 8/14/2024
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean hasCustomer = false;
%>
<div class="container-fluid">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <form class="d-flex">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-light" id="dash-daterange">
                            <span class="input-group-text bg-primary border-primary text-white"><i class="mdi mdi-calendar-range font-13"></i></span>
                        </div>

                    </form>
                </div>
                <h4 class="page-title">Danh sách đơn hàng</h4>
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
                            <a href="<c:url value='/manage/order-out/new'/>" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-2"></i> Thêm đơn hàng</a>
                        </div>

                    </div>

                    <div class="table-responsive">
                        <table class="table table-centered display table-list" id="products-datatable">
                            <thead class="table-light">
                            <tr>
                                <th class="all">STT</th>
                                <th>Thời gian</th>
                                <th>Người bán</th>
                                <th>Tổng số lượng</th>
                                <th>Tổng tiền</th>
                                <%--                                <th>Giảm giá</th>--%>

                                <th>Giảm giá</th>
                                <th>Khách hàng</th>
                                <th>Edit</th>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="order" items="${orders}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td> <!-- Tự động tăng id -->
                                    <td>${order.orderDate}</td>
                                    <td>${order.user.username}</td>
                                        <%--                                    <td>--%>
                                        <%--                                        <c:forEach var="ordersout" items="${ordersGroupedByOrderId[order.orderId]}">--%>
                                        <%--                                            ${ordersout.product.productName}<br/>--%>
                                        <%--                                        </c:forEach>--%>
                                        <%--                                    </td>--%>


                                    <td>
                                        <c:set var="totalQuantity" value="0" />
                                        <c:forEach var="ordersout" items="${ordersGroupedByOrderId[order.orderId]}">
                                            <c:set var="totalQuantity" value="${totalQuantity + ordersout.quantity}" />
                                        </c:forEach>
                                            ${totalQuantity}
                                    </td>
                                    <td>${order.orderTotal} .vnd</td>
                                        <%--                                    <td>--%>
                                        <%--                                        <c:set var="voucher" value="0" />--%>
                                        <%--                                        <c:forEach var="ordersout" items="${ordersGroupedByOrderId[order.orderId]}">--%>
                                        <%--                                            ${ordersout.product.price}<br/>--%>
                                        <%--                                            <c:set var="price" value="${ordersout.product.price}" />--%>
                                        <%--                                            <c:set var="totalQuantity" value="${totalQuantity + ordersout.quantity}" />--%>
                                        <%--                                        </c:forEach>--%>
                                        <%--                                    </td>--%>
                                    <td>
                                        <c:set var="price" value="0" />
                                        <c:forEach var="ordersout" items="${ordersGroupedByOrderId[order.orderId]}">
                                            <c:set var="price" value="${price + (ordersout.product.price * ordersout.quantity)}" />
                                        </c:forEach>

                                        <c:set var="voucherPrice" value="0" />
                                        <c:choose>
                                            <c:when test="${price > order.orderTotal}">
                                                <c:set var="voucherPrice" value="${price - order.orderTotal}" />
                                                <c:set var="voucherPrice" value=" - ${ Math.round(voucherPrice * 10.0) / 10.0} .vnd" />
                                                ${ voucherPrice}
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="voucherPrice" value="" />
                                                ${voucherPrice}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <c:set var="customerName" value="" />
                                        <c:forEach var="ordersout" items="${ordersGroupedByOrderId[order.orderId]}">
                                            <c:choose>
                                                <c:when test="${not empty ordersout.customer.nameCustomer and empty customerName}">
                                                    <c:set var="customerName" value="${ordersout.customer.nameCustomer}" />
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>

                                        <c:if test="${empty customerName}">
                                            Không có<br/>
                                        </c:if>
                                        <c:if test="${not empty customerName}">
                                            ${customerName}<br/>
                                        </c:if>

                                    </td>

                                    <td class="table-action">
                                        <a class="action-icon"
                                           data-order-id="${order.orderId}"
                                           data-username="${order.user.username}"
                                           data-customer="${customerName}"
                                           data-order-date="${order.orderDate}"
                                           data-order-total="${order.orderTotal}"
                                           data-total-quantity="${totalQuantity}"
                                           data-total-voucher="${voucherPrice}"
                                           data-order-details='
                                       <table  class="table table-hover">
                                           <thead>
                                               <tr>
                                                   <th>STT</th>
                                                   <th>Tên sản phẩm</th>
                                                   <th>Số lượng</th>
                                                   <th>Giá tiền</th>
                                                   <th>Tổng tiền</th>
                                               </tr>
                                           </thead>
                                           <tbody>
                                               <c:forEach var="detail" items="${ordersGroupedByOrderId[order.orderId]}" varStatus="sta">
                                                   <tr>
                                                       <td>${sta.index + 1}</td>
                                                       <td>${detail.product.productName}</td>
                                                       <td>${detail.quantity}</td>
                                                       <td>${detail.product.price}</td>
                                                       <td>${detail.quantity * detail.product.price}</td>
                                                   </tr>
                                               </c:forEach>
                                           </tbody>
                                       </table>'
                                           onclick="showOrderDetails(this)">
                                            <i class="mdi mdi-eye"></i>
                                        </a>
                                        <a href="<c:url value='/manage/order-out/edit/${order.orderId}' />" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                                        <a href="<c:url value='/manage/order-out/delete/${order.orderId }' />" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col -->
    </div>
    <jsp:include page="sales-invoice.jsp"/>

</div>
<script>
    function showOrderDetails(element) {
        // Lấy dữ liệu từ thuộc tính data- của thẻ HTML
        var orderId = element.getAttribute('data-order-id');
        var username = element.getAttribute('data-username');
        var customer = element.getAttribute('data-customer');
        var orderDate = element.getAttribute('data-order-date');
        var orderTotal = element.getAttribute('data-order-total');
        var totalQuantity = element.getAttribute('data-total-quantity');
        var totalVoucher  = element.getAttribute('data-total-voucher')
        var orderDetailsHtml = element.getAttribute('data-order-details');

        // Clear the existing content in the modal
        var modalBody = document.querySelector('#orderModal .modal-body');
        modalBody.innerHTML = '';

        // Create the header section
        var headerDiv = document.createElement('div');
        headerDiv.classList.add('row');

        var col7Div = document.createElement('div');
        col7Div.classList.add('col-7');

        var orderDateH5 = document.createElement('h5');
        orderDateH5.innerText = 'Thời gian: ' + orderDate;
        col7Div.appendChild(orderDateH5);

        var usernameH5 = document.createElement('h5');
        usernameH5.innerText = 'Thu ngân: ' + username;

        var customerH5 = document.createElement('h5');
        customerH5.innerText = 'Khách hàng: ' + customer;
        col7Div.appendChild(customerH5);
        col7Div.appendChild(usernameH5);
        headerDiv.appendChild(col7Div);

        var col5Div = document.createElement('div');
        col5Div.classList.add('col-5');

        var orderIdH5 = document.createElement('h5');
        // orderIdH5.innerText = 'ID: ' + orderId;
        orderIdH5.innerText = 'ID: SFSFOSF687W98EH';
        col5Div.appendChild(orderIdH5);
        headerDiv.appendChild(col5Div);
        modalBody.appendChild(headerDiv);

        // Add the order details HTML directly
        var orderDetailsDiv = document.createElement('div');
        orderDetailsDiv.innerHTML = orderDetailsHtml;
        modalBody.appendChild(orderDetailsDiv);

        // Create the footer section
        var footerDiv = document.createElement('div');
        footerDiv.classList.add('row');

        var col6Div1 = document.createElement('div');
        col6Div1.classList.add('col-6');

        var totalQuantityH5 = document.createElement('h5');
        totalQuantityH5.innerText = 'Tổng số lượng: ' + totalQuantity;
        col6Div1.appendChild(totalQuantityH5);

        var totalVoucherH5 = document.createElement('h5');
        totalVoucherH5.innerText = 'Giảm giá: ' + totalVoucher ;
        col6Div1.appendChild(totalVoucherH5);

        var totalAmountH5 = document.createElement('h5');
        totalAmountH5.innerText = 'Tổng tiền: ' + orderTotal+ '.Vnd';
        col6Div1.appendChild(totalAmountH5);
        footerDiv.appendChild(col6Div1);
        modalBody.appendChild(footerDiv);

        // Show the modal
        var orderModal = new bootstrap.Modal(document.getElementById('orderModal'));
        orderModal.show();
    }


</script>
