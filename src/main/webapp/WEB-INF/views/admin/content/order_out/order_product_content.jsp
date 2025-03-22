<%@ page import="com.example.security.SecurityUtils" %>
<%@ page import="com.example.constant.StringConstrant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: TDTrung
  Date: 8/14/2024
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<style>
    .card {
        transition: transform 0.2s ease-in-out;
    }
    .card-product:hover {
        transform: scale(1.05);
    }
    .card-img-top {
        border-bottom: 1px solid #ddd;
    }
    .card-body {
        padding: 15px;
    }
    /*.fixed-bottom-corner {*/
    /*    position: fixed;*/
    /*    bottom: 0;*/
    /*    right: 0;*/
    /*    margin: 1rem; !* Adjust margin as needed *!*/
    /*    z-index: 1030; !* Ensures the element is above other content *!*/
    /*}*/
    .scrollable-tbody {
        max-height: 250px; /* Adjust the height as needed */
        overflow-y: auto; /* Enables vertical scrolling */
        display: block;
    }
    .scrollable-tbody table {
        width: 100%; /* Ensure table width is 100% */
        margin: 0;
    }
    .productList {
        max-height: 500px;
        overflow-y: auto;
        overflow-x: hidden; /* Ẩn phần tử vượt quá chiều rộng */
        max-width: 100%;
        margin: 0;
        display: block;
    }

</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div >
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
                            <a href="${pageContext.request.contextPath}/manage/order-out/list" class="btn btn-primary ms-2"><i class="mdi mdi-arrow-left"></i>
                            </a>
                    </form>
                </div>

            </div>
        </div>

    </div>

    <div class="row  pt-1 ">
        <div class="col-sm-7" >
            <div class="card">
                <div class="card-body">
                    <div class="productList" id="productList">
                        <div class="row ">
                            <div class="container pt-1" id="categoryList">
                                <div class="btn-group btn-group-sm mb-1" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" name="btnradio" id="category-all" value="all" checked>
                                    <label class="btn btn-outline-secondary" for="category-all">Tất cả sản phẩm</label>
                                </div>
                                <c:forEach items="${category}" var="categorys">
                                    <div class="btn-group btn-group-sm mb-1" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check" name="btnradio" id="category-${categorys.categoryId}" value="${categorys.categoryId}">
                                        <label class="btn btn-outline-secondary" for="category-${categorys.categoryId}">${categorys.categoryName}</label>
                                    </div>
                                </c:forEach>
                            </div>
                            <hr style="height: 2px">
                            <c:forEach items="${products}" var="product">
                                <div class="col-2 g-2 product-card" data-category-id="${product.category.categoryId}">
                                    <div class="card shadow-sm img-thumbnail card-product" style="width: 100%; height: 80%;" onclick="showProductDetails('${product.productId}','${product.productName}','${product.price}','${product.image}', 1)">
                                        <% String urlImage = StringConstrant.URL_IMAGE_PRODUCT;
                                            pageContext.setAttribute("urlImage", urlImage);
                                        %>
                                        <td><img src="<c:url value="${urlImage}${product.image}"/>"
                                                 class="card-img-top"
                                                 alt="..."
                                                 style="object-fit: cover; height: 90px;">
                                            <div class="card-body text-center">
                                                <p class="card-title text-truncate">${product.productName}</p>
                                                <p class="card-text fw-bold">${product.price}</p>
                                            </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
<%--                    <div class="mb-3">--%>
<%--                        <label for="exampleFormControlTextarea1" class="form-label">Ghi chú</label>--%>
<%--                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="card">
                <div class="card-body">
                    <div class="row" >
                        <div class="col ">
                            <form id="order-form" action="${pageContext.request.contextPath}/manage/order-out/save-order" method="POST">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Tên</th>
                                        <th class="text-center">Quantity</th>
                                        <th class="text-center">Giá</th>
                                        <th class="text-center">Tổng</th>
                                        <th class="text-center">Xóa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <input type="hidden" name="username" value="<%=SecurityUtils.getPrincipal().getUsername()%>">
                                    <c:if test="${orderEdits.orderId != 0}">
                                        <input type="hidden" name="orderId" value="${orderEdits.orderId }">
                                        <input type="hidden" name="orderOut" value="${orderEdits.orderId }">
                                    </c:if>
                                    <tr>
                                        <td colspan="5">
                                            <div class="scrollable-tbody">
                                                <table class="table table-hover">
                                                    <tbody id="product-list">
                                                    <!-- Các hàng sản phẩm sẽ được thêm vào đây -->
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>

                                </table>
                                <div class="container">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="customerCheck">
                                        <label class="form-check-label" for="customerCheck">Khách hàng tiềm năng</label>
                                    </div>
                                    <!-- Form to show/hide -->
                                    <div id="customerForm" style="display:none;">
                                        <!-- Nội dung form danh sách khách hàng và mã giảm giá -->
                                        <div class="mb-3 pt-3">
                                            <label for="customerSelect" class="form-label">Khách hàng</label>
                                            <select id="customerSelect" class="select2 form-control select2-multiple" data-toggle="select2"  data-placeholder="Khách hàng ..." name="customerId">
                                                <option value="0"></option>
                                                <c:forEach items="${customers}" var="customer" >
                                                    <option value="${customer.customerId}">${customer.phoneCustomer}-${customer.nameCustomer}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <select id="voucherSelect" class="form-select" aria-label="Default select example">
                                            <option selected disabled>Chọn mã giảm giá</option>
                                        </select>
                                    </div>
                                    <div class="row pt-3">
                                        <div class="border p-3 mt-4 mt-lg-0 rounded">
                                            <h4 class="header-title mb-3">Order Summary</h4>

                                            <div class="table-responsive">
                                                <table class="table mb-0">
                                                    <tbody>
                                                    <tr>
                                                        <td>Tổng số lượng :</td>
                                                        <td><a id="totalQuantity" name="totalQuantity"></a></td>
                                                    </tr>
                                                        <td>Tổng giá :</td>
                                                        <td><a id="total" ></a></td>
                                                    <tr>
                                                        <c:if test="${not empty orderEdits.orderTotal}">
                                                            <td>Giá trước khi sửa:</td>
                                                            <td><a><b style="color: #0c6af3">${orderEdits.orderTotal}</b></a></td>
                                                        </c:if>
                                                    </tr>
                                                    <tr>
                                                        <th>Giảm giá</th>
                                                        <th><a id="discountCalculation" style="color: green;"></a></th>
                                                    </tr>
                                                    <tr>
                                                        <td>Tổng tiền : </td>
                                                        <td><a id="orderTotal" name="orderTotal"> </a> </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!-- end table-responsive -->
                                        </div>

                                    </div>
                                    <div class="pt-3">
                                        <butotn type="submit" id="save-order" class="btn btn-success" style="display: none;">
                                            Thanh Toán <i class="bi bi-play-fill"></i>
                                        </butotn>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<script>
    function showProductDetails(id, name, price, image, quantity) {
        // Tạo dòng <tr> mới
        var tr = document.createElement('tr');
        tr.dataset.id = id; // Lưu ID sản phẩm vào thuộc tính data-id của tr
        var productTd = document.createElement('td');
        productTd.classList.add('col-sm-8', 'col-md-6');

        var mediaDiv = document.createElement('div');
        mediaDiv.classList.add('media');

        var a = document.createElement('a');
        a.classList.add('thumbnail', 'me-3');
        a.href = '#';

        var img = document.createElement('img');
        img.classList.add('media-object');
        img.src =  '/Mock-Project/resources/images/product/' + image;
        img.style.width = '40px';
        img.style.height = '40px';
        a.appendChild(img);

        var mediaBodyDiv = document.createElement('div');
        mediaBodyDiv.classList.add('media-body');

        var productNameH5 = document.createElement('h5');
        productNameH5.classList.add('media-heading');
        productNameH5.innerText = name;

        mediaBodyDiv.appendChild(productNameH5);
        mediaDiv.appendChild(a);
        mediaDiv.appendChild(mediaBodyDiv);
        productTd.appendChild(mediaDiv);

        tr.appendChild(productTd);

        // Tạo cột số lượng
        var quantityTd = document.createElement('td');
        quantityTd.classList.add('col-sm-1', 'col-md-1', 'text-center');

        var quantityInput = document.createElement('input');
        quantityInput.type = 'number';
        quantityInput.classList.add('form-control');
        quantityInput.value = quantity;
        quantityInput.min = '1'; // Đặt giới hạn số lượng tối thiểu là 1
        // Thiết lập style trực tiếp
        quantityInput.style.width = '65px';  // Điều chỉnh chiều rộng

        quantityTd.appendChild(quantityInput);
        tr.appendChild(quantityTd);

        // Tạo cột giá
        var priceTd = document.createElement('td');
        priceTd.classList.add('col-sm-1', 'col-md-1', 'text-center');
        priceTd.innerHTML = '<strong>' + price + '</strong>';
        tr.appendChild(priceTd);

        // Tạo cột tổng giá
        var totalTd = document.createElement('td');
        totalTd.classList.add('col-sm-1', 'col-md-1', 'text-center');
        var totalPrice = Math.round(price * quantityInput.value * 100) / 100;
        totalTd.innerHTML = '<strong>' + totalPrice + '</strong>';
        tr.appendChild(totalTd);

        // Thêm sự kiện lắng nghe khi thay đổi số lượng
        quantityInput.addEventListener('input', function() {
            var newQuantity = Math.max(1, quantityInput.value); // Đảm bảo số lượng không nhỏ hơn 1
            var newTotalPrice = Math.round(price * newQuantity * 100) / 100;
            totalTd.innerHTML = '<strong>' + newTotalPrice.toFixed(2) + '</strong>';
            calculateGrandTotal(); // Cập nhật tổng giá của tất cả các sản phẩm
        });

        // Tạo cột nút xóa
        var removeTd = document.createElement('td');
        removeTd.classList.add('col-sm-1', 'col-md-1');

        var removeBtn = document.createElement('button');
        removeBtn.type = 'button';
        removeBtn.classList.add('btn', 'btn-danger');
        removeBtn.innerHTML = '<i class="mdi mdi-delete"> ';

        // Xóa dòng sản phẩm khi nhấn nút Remove
        removeBtn.onclick = function () {
            tr.remove();
            calculateGrandTotal(); // Cập nhật tổng giá sau khi xóa sản phẩm
            updateSaveButtonVisibility()
        };

        removeTd.appendChild(removeBtn);
        tr.appendChild(removeTd);
        // Thêm dòng <tr> mới vào bảng
        var tbody = document.getElementById('product-list');
        tbody.appendChild(tr);

        // Cập nhật tổng giá ban đầu
        calculateGrandTotal();
    }
    // Hàm để kiểm tra và cập nhật hiển thị nút "Thêm"
    function updateSaveButtonVisibility() {
        var orderTotal = parseInt(document.getElementById("orderTotal").textContent.trim()) || 0;
        var saveOrderButton = document.getElementById("save-order");

        if (orderTotal > 0) {
            saveOrderButton.style.display = "block";
        } else {
            saveOrderButton.style.display = "none";
        }
    }
    document.getElementById('save-order').addEventListener('click', function() {
        var allRows = document.querySelectorAll('#product-list tr');
        var form = document.getElementById('order-form');

        // Lấy dữ liệu và tạo input ẩn cho form
        var productIds = [];
        var quantities = [];

        allRows.forEach(function(row) {
            var productId = row.dataset.id;
            var quantity = row.querySelector('td:nth-child(2) input').value;

            productIds.push(productId);
            quantities.push(quantity);
        });
        // Thêm input ẩn cho productIds và quantities
        productIds.forEach(function(id) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'productId';
            input.value = id;
            form.appendChild(input);
        });

        quantities.forEach(function(qty) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'quantity';
            input.value = qty;
            form.appendChild(input);
        });
        // Thêm input ẩn cho tổng số lượng
        var totalQuantityInput = document.createElement('input');
        totalQuantityInput.type = 'hidden';
        totalQuantityInput.name = 'orderTotal';
        totalQuantityInput.value = document.getElementById('orderTotal').innerText;
        form.appendChild(totalQuantityInput);
        // Gửi form
        form.submit();
    });
    // Lấy dữ liệu edit
    <c:forEach var="detail" items="${orderOutDeEdits}">
    var productId = "${detail.product.productId}";
    var productName = "${detail.product.productName}";
    var productPrice = "${detail.product.price}";
    var productImage = "${detail.product.image}";
    var quantity = "${detail.quantity}";
    // Gọi hàm showProductDetails để hiển thị thông tin sản phẩm
    showProductDetails(productId, productName, productPrice, productImage, quantity);
    </c:forEach>
    // Hiển thị sản phẩm theo loại
    document.querySelectorAll('.btn-check').forEach(button => {
        button.addEventListener('change', function() {
            const selectedCategoryId = this.value;
            // Lấy tất cả các sản phẩm
            const productCards = document.querySelectorAll('.product-card');
            // Hiển thị sản phẩm theo danh mục được chọn
            productCards.forEach(card => {
                const productCategoryId = card.getAttribute('data-category-id');
                if (selectedCategoryId === "all" || productCategoryId === selectedCategoryId) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            });
        });
    });

    // Hiển thị tất cả sản phẩm khi trang được load
    document.getElementById('category-all').dispatchEvent(new Event('change'));



    $(document).ready(function() {
        $('#customerSelect').select2();

        $('#customerSelect').on('change', function() {
            var customerId = $(this).val() || null; // Nếu không chọn thì gán giá trị là null
            console.log(customerId);  // Kiểm tra giá trị customerId

            var voucherSelect = document.getElementById('voucherSelect');
            voucherSelect.innerHTML = '<option selected disabled>Chọn mã giảm giá</option>';

            if (customerId) {
                // Lấy dữ liệu mã giảm giá tương ứng với khách hàng đã chọn
                fetch('/Mock-Project/manage/voucher/api/list/' + customerId)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(voucher => {
                            var option = document.createElement('option');
                            option.value = voucher.voucher.voucherId;
                            option.text = voucher.voucher.code + ` - ` + voucher.voucher.discount + `%`;

                            // Thêm thuộc tính data-discount
                            option.dataset.discount = voucher.voucher.discount;
                            voucherSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error:', error));
            }
        });
        $('#voucherSelect').on('change', function() {
            calculateGrandTotal(); // Cập nhật tổng giá sau khi chọn mã giảm giá
        });

        $('#customerCheck').on('change', function() {
            var customerForm = $('#customerForm');
            if (this.checked) {
                customerForm.show();
            } else {
                customerForm.hide();
            }
        });
    });
    function calculateGrandTotal() {
        var allRows = document.querySelectorAll('#product-list tr');
        var grandTotal = 0;
        var totalQuantity = 0; // Khởi tạo biến để tính tổng số lượng

        // Tính toán tổng tiền trước khi giảm giá
        allRows.forEach(function(row) {
            var priceElement = row.querySelector('td:nth-child(4) strong');
            var rowTotal = parseFloat(priceElement.innerText);
            grandTotal += rowTotal;

            var quantityElement = row.querySelector('td:nth-child(2) input');
            var quantity = parseInt(quantityElement.value);
            totalQuantity += quantity; // Cộng dồn số lượng của từng sản phẩm
        });
        var total = Math.round(grandTotal * 100) / 100; // Tính toán giá trị tổng ban đầu
        document.getElementById('total').innerHTML = '<strong>' + total.toFixed(2) + '</strong>';
        // Áp dụng giảm giá
        var voucherSelect = document.getElementById('voucherSelect');
        var selectedOption = voucherSelect.options[voucherSelect.selectedIndex];
        var discount = selectedOption ? parseFloat(selectedOption.dataset.discount) : 0;
        var discountAmount = (grandTotal * discount) / 100;
        grandTotal = Math.round((grandTotal - discountAmount) * 100) / 100;
        console.log('grandTotal:', grandTotal);
        console.log('total:', total);
        if (isNaN(grandTotal)) {
            grandTotal = total;
        }
        console.log(grandTotal, total); // Kiểm tra giá trị của grandTotal và total
        document.getElementById('discountCalculation').innerText = '-' + discountAmount.toFixed(2) + ' VND';
        document.getElementById('orderTotal').innerHTML = '<strong>' + grandTotal.toFixed(2) + '</strong>';
        console.log('grandTotal.toFixed(2):', grandTotal.toFixed(2));
        document.getElementById('totalQuantity').innerHTML =  '<strong>' + totalQuantity + '</strong>';
        updateSaveButtonVisibility();
    }
</script>