<%--
  Created by IntelliJ IDEA.
  User: TDTrung
  Date: 8/14/2024
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container-fluid">

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">Danh sách hóa đơn bán hàng</h4>
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
                            <a href="<c:url value='/manage/manager/shift/new'/>" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-2"></i> Tạo ca làm việc</a>
                        </div>
<%--                        <div class="col-sm-8">--%>
<%--                            <div class="text-sm-end">--%>
<%--                                <button type="button" class="btn btn-success mb-2 me-1"><i class="mdi mdi-cog-outline"></i></button>--%>
<%--                                <button type="button" class="btn btn-success mb-2 me-1" data-bs-toggle="modal" data-bs-target="#addEmployeeToShiftModal">Thêm nhân viên vào ca</button>--%>
<%--                            </div>--%>
<%--                        </div><!-- end col-->--%>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-centered table-list" >
                            <thead class="table-light">

                            <tr>
                                <th>STT</th>
                                <th>Ca làm việc</th>
                                <th class="d-none d-xl-table-cell">Thời gian bắt đầu</th>
                                <th class="d-none d-xl-table-cell">Thời gian kết thúc</th>
                                <th>Lương</th>
                                <th class="d-none d-md-table-cell"></th>
                            </tr>

                            </thead>
                            <tbody>

                            <c:forEach var="shift" items="${shifts}">
                                <tr>
                                    <td></td>
                                    <td>${shift.shiftName}</td>
                                    <td>${shift.startTime}</td>


                                    <td>${shift.endTime}</td>
                                    <td>${shift.salary}</td>


                                        <%--                <td>${order.orderType}</td>--%>
                                        <%-- <td>${order.userId}</td> --%>
                                        <%-- <td>${order.customerId}</td> --%>
                                    <!-- Điều chỉnh theo thuộc tính thực tế -->
                                    <!-- Điều chỉnh theo thuộc tính thực tế -->

                                    <td class="table-action">
<%--                                        <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-eye"></i></a>--%>
<%--                                        <a href="<c:url value='/manage/order/edit/${shift.shiftId}' />" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>--%>
                                        <a href="<c:url value='/manage/order/delete/${shift.shiftId }' />" class="action-icon"> <i class="mdi mdi-delete"></i></a>
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
    <!-- end row -->
</div>
<div class="modal fade" id="addEmployeeToShiftModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
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



<!-- third party js -->

