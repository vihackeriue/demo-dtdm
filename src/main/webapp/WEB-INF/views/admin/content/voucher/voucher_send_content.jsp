<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<div class="container-fluid p-0">

    <div class="mb-3">
        <h1 class="h3 d-inline align-middle">Gửi mã giảm giá</h1>

    </div>
    <div class="card">
        <form action="<c:url value='/manage/voucher-detail/saveVoucherDetails'/>" method="post"
              class="card-body">
            <div class="row">
                <div class="col-lg-6">


                    <div class="mb-3">
                        <label for="voucherId" class="form-label">Mã giảm giá</label>
                        <select class="form-control select2" data-toggle="select2" id="voucherId"
                                name="voucherId" required>
                            <option value="" disabled selected>Chọn mã giảm giá</option>

                            <c:forEach var="voucher" items="${vouchers}">
                                <option value="${voucher.voucherId}">
                                        ${voucher.code} - ${voucher.discount}%</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3 position-relative" id="datepicker1" >
                        <label class="form-label">Ngày hết hạn</label>
                        <input type="text" class="form-control" id="shelfLife" data-provide="datepicker" data-date-container="#datepicker1" data-date-format="yyyy-mm-dd" name="shelfLife">
                    </div>



                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Gửi</button>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="mb-3">
                        <label for="customers" class="form-label">Khách hàng</label>
                    <select id="customers" class="select2 form-control select2-multiple" data-toggle="select2" multiple="multiple" data-placeholder="Khách hàng ..." name="customerIds">

                        <c:forEach items="${customers}" var="customer" >
                            <option value="${customer.customerId}">${customer.nameCustomer}</option>
                        </c:forEach>

                    </select>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Số lượng</label> <input
                            type="number" id="quantity" class="form-control"
                            name="quantity" placeholder="Số lượng" required
                            >
                    </div>



                </div>
            </div>
        </form>
    </div>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#shelfLife').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            startDate: new Date()  // Disable dates before today
        });
    });
</script>


