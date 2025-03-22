<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    .action-icon {
        padding: 0 6px;
    }
</style>
<script src="https://kit.fontawesome.com/6f5caf640a.js" crossorigin="anonymous"></script>
<!-- Start Content-->
<div class="container-fluid">

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">

                <h4 class="page-title">Danh sách nhân sự</h4>
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
                            <a href="<c:url value='/manage/manager/employee/new' />" class="btn btn-primary mb-2"><i
                                    class="mdi mdi-plus-circle me-2"></i> Thêm nhân viên mới</a>
                        </div>

                    </div>

                    <div class="table-responsive">
                        <table class="table table-centered display table-list" style="width: 100%">
                            <thead class="table-light">

                            <tr>
                                <th class="d-none d-xl-table-cell">STT</th>
                                <th class="d-none d-xl-table-cell">Tên Đăng nhập</th>

                                <th class="d-none d-md-table-cell">Họ và tên</th>
                                <th class="d-none d-md-table-cell">Email</th>
                                <th class="d-none d-md-table-cell">Số điện thoại</th>
                                <th class="d-none d-md-table-cell">Chức vụ</th>
                                <th class="d-none d-md-table-cell">Trạng thái</th>
                                <th class="d-none d-md-table-cell">Quản lý</th>

                                <th style="width: 85px;">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users}" var="user">

                                <tr>

                                    <td>${user.userId}</td>
                                    <td>
                                        <%
                                            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                                            String username = authentication.getName();
                                            pageContext.setAttribute("username", username);
                                        %>
                                        <p class="m-0 d-inline-block align-middle font-16">
                                            <a href="apps-ecommerce-products-details.html"
                                               class="text-body">${user.username}</a>
                                        </p>
                                    </td>
                                    <td>${user.fullName}</td>

                                    <td>${user.email}</td>

                                    <td>${user.phone}</td>

                                    <td>
                                        <c:if test="${user.role == 2}">
                                           <div class="text-info mb-2">Nhân viên</div>
                                        </c:if>
                                        <c:if test="${user.role == 1}">
                                            <div class="text-primary">Quản lý</div>
                                        </c:if>
                                        <c:if test="${user.role == 0}">
                                            <div class="text-warning mb-2">Admin</div>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${user.status == 1}">
                                            <div class="text-success">Đang sử dụng</div>
                                        </c:if>
                                        <c:if test="${user.status == 0}">
                                            <div class="text-danger">Đang khóa</div>
                                        </c:if>
                                    </td>

                                    <c:if test="${user.IDManager == null}">
                                        <td>Không có</td>
                                    </c:if>
                                    <c:if test="${user.IDManager != null}">
                                        <c:forEach items="${users}" var="item">

                                            <c:if test="${item.userId == user.IDManager}">
                                                <td>${item.username}</td>
                                            </c:if>
                                        </c:forEach>


                                    </c:if>



                                    <td class="table-action">

                                        <c:if test="${username != user.username}">
                                            <a class="action-icon" data-bs-toggle="modal" data-bs-target="#editModal"
                                                    data-user-id="${user.userId}" data-username="${user.username}"
                                                    data-role="${user.role}"> <i class="fa-solid fa-pen" ></i></a>
                                            <a href="<c:url value='/manage/manager/employee/lock/${user.userId}' />"
                                               class="action-icon"> <i class="fa-solid fa-trash"></i></a>
                                        </c:if>
                                        <c:if test="${username == user.username}">
                                            <b>.bạn</b>
                                        </c:if>

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
    <!-- Modal HTML -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Chỉnh sửa người dùng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm" action="<c:url value="/manage/manager/employee/edit-role"/>" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label">Chức vụ</label>
                            <select class="form-select" id="role" name="role">

                                <c:if test="${user.role == 0}">
                                    <option value="0">Admin</option>
                                </c:if>

                                <option value="1">Quản lý</option>
                                <option value="2">Nhân viên</option>
                            </select>
                        </div>
                        <input type="hidden" id="userId" name="userId">
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary" id="saveButton">Lưu thay đổi</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- container -->
<script>
    $(document).ready(function () {
        $('#editModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var userId = button.data('user-id'); // Extract info from data-* attributes
            var username = button.data('username');
            var role = button.data('role');

            var modal = $(this);
            modal.find('#username').val(username);
            modal.find('#role').val(role);
            modal.find('#userId').val(userId);
        });
    });
</script>

<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function() {--%>
<%--        new DataTable('#example', {--%>
<%--            "rowCallback": function(row, data, index) {--%>
<%--                // Gán giá trị STT--%>
<%--                $('td:eq(0)', row).html(index + 1); // Cột đầu tiên là STT--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>




