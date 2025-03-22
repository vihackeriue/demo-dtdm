<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.security.SecurityUtils" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.security.core.GrantedAuthority" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid p-0">

    <div class="mb-3">


    </div>
    <c:if test="${not empty message}">
        <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
            <strong></strong>${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class=" col-xl-9">
        <div class="card">
            <div class="card-header">

                <h5 class="card-title mb-0">Thêm Nhân Viên</h5>
            </div>
            <div class="card-body h-100">
                <form id="addEmployeeForm" class="needs-validation" novalidate action="<c:url value="/manage/manager/employee/new"/>" method="post">
                    <div class="mb-3 position-relative" >
                        <label class="form-label">Tên Đăng Nhập</label>
                        <input type="text" class="form-control" name="username" placeholder="Tên Đăng Nhập" required>
                    </div>
                    <div class="mb-3 position-relative">
                        <label class="form-label">Email</label>
                        <input class="form-control" type="text" name="email" placeholder="Email"  required/>
                    </div>
                    <div class="mb-3 position-relative">
                        <label class="form-label">Số điện thoại</label>
                        <input class="form-control" type="text" name="phone" placeholder="Số điện thoại"  required/>
                    </div>
                    <div class="mb-3 position-relative">
                        <label class="form-label">Tên</label>
                        <input class="form-control" type="text" name="fullName" placeholder="Họ và tên" required />
                    </div>

                    <div class="mb-3 position-relative">
                        <label class="form-label">Mật khẩu </label>
                        <input class="form-control" type="password" id="newPassword" name="password" placeholder="Mật khẩu" required />
                    </div>
                    <div class="mb-3 position-relative">
                        <label class="form-label">Nhập lại mật khẩu</label>
                        <input class="form-control" type="password" id="confirmNewPassword" placeholder="Nhập lại mật khẩu" required/>
                        <div class="password-mismatch-error text-danger mt-1" style="display:none;">
                            Mật khẩu xác nhận không khớp!
                        </div>
                    </div>
                    <div class="mb-3 position-relative">
                        <label for="role" class="form-label">Chức vụ</label>
                        <select class="form-select" id="role"
                                name="role" required>
                            <option value="">Chức vụ</option>
                            <option value="2">Nhân Viên</option>
                            <option value="1">Quản lý</option>
                            <<%
                            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                            List<String> rolesToCheck = List.of("ROLE_ADMIN");
                            boolean isAdmin = authentication.getAuthorities().stream()
                                    .map(GrantedAuthority::getAuthority)
                                    .anyMatch(role -> rolesToCheck.contains(role));

                            pageContext.setAttribute("isAdmin", isAdmin);
                            %>
                            <c:if test="${isAdmin}">
                                <option value="0">Admin</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="mb-3 position-relative" id="managerOptionDiv" style="display: none;">
                        <label for="ManagerId" class="form-label">Quản lý</label>
                        <select class="form-select" id="ManagerId"
                                name="IDManager">
                            <option value="">Quản lý</option>
                            <c:forEach var="manager" items="${managers}">
                                <option value="${manager.userId}">
                                        ${manager.username}
                                </option>

                            </c:forEach>
                        </select>
                    </div>
                    <input type="hidden" value="1" name="status">

                    <div class="d-grid gap-2 mt-3">
                        <button type="submit" class="btn btn-sm btn-primary">Thêm </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<script>
    $(document).ready(function() {
        $('#role').change(function() {
            var selectedRole = $(this).val();

            if (selectedRole == "2") { // Nếu chọn Nhân Viên
                $('#managerOptionDiv').show(); // Hiển thị dropdown Quản lý
                $('#ManagerId').prop('required', true); // Đặt thuộc tính required cho Quản lý
            } else {
                $('#managerDiv').hide(); // Ẩn dropdown Quản lý
                $('#ManagerId').prop('required', false); // Bỏ thuộc tính required cho Quản lý
                $('#ManagerId').val(''); // Xóa giá trị đã chọn trong dropdown Quản lý
            }
            if (selectedRole != "2") { // Nếu chọn Nhân Viên
                $('#managerOptionDiv').hide(); // Hiển thị dropdown Quản lý
                $('#ManagerId').prop('required', false); // Đặt thuộc tính required cho Quản lý
            }
        });
    });

</script>

<script>
    document.getElementById('addEmployeeForm').addEventListener('submit', function(event) {
        var newPassword = document.getElementById('newPassword').value;
        var confirmNewPassword = document.getElementById('confirmNewPassword').value;
        var mismatchError = document.querySelector('.password-mismatch-error');

        // Xóa lỗi trước khi kiểm tra
        mismatchError.style.display = 'none';
        document.getElementById('confirmNewPassword').classList.remove('is-invalid');

        // Kiểm tra khớp mật khẩu
        if (newPassword !== confirmNewPassword) {
            event.preventDefault();
            event.stopPropagation();
            mismatchError.style.display = 'block';
        } else {
            mismatchError.style.display = 'none';
        }

        this.classList.add('was-validated');
    });

    document.getElementById('changeProfileForm').addEventListener('submit', function(event) {
        if (!this.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
            this.classList.add('was-validated');
        }
    });



</script>
