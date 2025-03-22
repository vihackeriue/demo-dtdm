<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Hóa đơn</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="header">
                <div class="" style="text-align: center">
                    <img src="/Mock-Project/template/assets/images/logo.png" alt="" height="40px" width="40px">
                    <h3>HÓA ĐƠN BÁN HÀNG</h3>
                    <h5></h5>
                </div>
            </div>
            <!-- Thêm ID cho nội dung hóa đơn -->
            <div class="modal-body" id="invoiceContent">
                <!-- Nội dung hóa đơn sẽ được hiển thị ở đây -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="printInvoice()">In hóa đơn</button>
            </div>
        </div>
    </div>
</div>

<script>
    function printInvoice() {
        var printContents = document.getElementById('invoiceContent').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
        location.reload(); // Tải lại trang để khôi phục nội dung ban đầu
    }
</script>
