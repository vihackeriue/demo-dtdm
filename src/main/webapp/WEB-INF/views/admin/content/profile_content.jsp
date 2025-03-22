<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.security.SecurityUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    input:invalid {
        border-color: red;
    }

    input:invalid + .invalid-feedback {
        display: block;
        color: red;
    }
    .invalid-feedback {
        display: none;
    }
    .was-validated .form-control:invalid ~ .invalid-feedback {
        display: block;
    }
</style>


<div class="container-fluid p-0">
    <c:if test="${not empty message}">
        <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
            <strong></strong>${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>


        <div class="mb-3">
        </div>
        <div class="row">
            <div class="col-md-4 col-xl-3">
                <div class="card mb-3">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Thông tin cá nhân</h5>
                    </div>
                    <div class="card-body text-center">
                        <img src="<c:url value="/template/assets/images/users/user.png"/> " alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128" height="128" />
                        <h5 class="card-title mb-0"><%=SecurityUtils.getPrincipal().getFullName()%></h5>
                        <div class="text-muted mb-2"><%=SecurityUtils.getPrincipal().getAuthorities()%></div>

                        <div>
                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                                Đổi Mật Khẩu
                            </button>

                        </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                        <h5 class="h6 card-title">Thông tin</h5>
                        <ul class="list-unstyled mb-0">
                            <li class="mb-1"><span data-feather="home" class="feather-sm me-1"></span> Điện thoại: <a href="#"></a><%=SecurityUtils.getPrincipal().getPhone()%></li>
                            <li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span> Email: <a href="#"><%=SecurityUtils.getPrincipal().getEmail()%></a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-8 col-xl-9">
                <div class="card">
                    <div class="card-header">

                        <h5 class="card-title mb-0">Chỉnh sửa</h5>
                    </div>
                    <div class="card-body h-100">
                        <form id="changeProfileForm" class="needs-validation" novalidate action="<c:url value="/manage/change-profile"/>" method="post">
                            <div class="mb-3">
                                <label class="form-label">Tên Đăng Nhập</label>
                                <input class="form-control" type="text"  placeholder="Tên Đăng Nhập" value="<%=SecurityUtils.getPrincipal().getUsername()%>" disabled/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input class="form-control" type="text" name="email" placeholder="Email" value="<%=SecurityUtils.getPrincipal().getEmail()%>" required/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số điện thoại</label>
                                <input class="form-control" type="text" name="phone" placeholder="Số điện thoại" value="<%=SecurityUtils.getPrincipal().getPhone()%>" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tên</label>
                                <input class="form-control" type="text" name="fullName" placeholder="Họ và Tên" value="<%=SecurityUtils.getPrincipal().getFullName()%>" required/>
                            </div>
                            <div class="d-grid gap-2 mt-3">
                                <button type="submit" class="btn  btn-primary">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- Modal Đổi Mật Khẩu -->
    <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changePasswordModalLabel">Đổi Mật Khẩu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="changePasswordForm" novalidate action="<c:url value="/manage/change-password"/>" method="post">

                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                            <input class="form-control" type="password" placeholder="Mật khẩu hiện tại" name="currentPassword"  id="currentPassword" required/>
                            <div class="invalid-feedback">
                                Vui lòng nhập mật khẩu hiện tại!
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">Đổi mật khẩu mới</label>
                            <input class="form-control" type="password" placeholder="Mật khẩu mới" name="newPassword"  id="newPassword" required/>
                            <div class="invalid-feedback">
                                Vui lòng nhập mật khẩu mới!
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="confirmNewPassword" class="form-label">Nhập lại Mật Khẩu Mới</label>
                            <input class="form-control" type="password" placeholder="Nhập lại Mật Khẩu Mới"  id="confirmNewPassword" required/>
                            <div class="invalid-feedback">
                                Vui lòng nhập mật khẩu mới!
                            </div>

                            <div class="password-mismatch-error text-danger mt-1" style="display:none;">
                                Mật khẩu xác nhận không khớp!
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Xác Nhận</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    </div>

<script>
    $(".alert").alert('close')
</script>
<script>
    document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>