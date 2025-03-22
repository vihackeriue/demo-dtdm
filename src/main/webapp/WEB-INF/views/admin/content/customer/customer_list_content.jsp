<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<style>
    .action-icon {
        padding: 0 6px;
    }
</style>
<script src="https://kit.fontawesome.com/6f5caf640a.js" crossorigin="anonymous"></script>


<div class="container-fluid">
    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">Danh sách khách hàng</h4>
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
                            <a href="<c:url value='/manage/customer/new'/>" class="btn btn-primary mb-2"><i
                                    class="mdi mdi-plus-circle me-2"></i> Thêm khách hàng</a>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table  class="table table-centered display table-list" style="width: 100%">
                            <thead class="table-light">
                            <tr>

                                <th class="d-none d-xl-table-cell">Id</th>
                                <th class="d-none d-xl-table-cell">Khách hàng</th>

                                <th class="d-none d-md-table-cell">Email</th>
                                <th class="d-none d-md-table-cell">SĐT</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customers}" var="customer">
                                <tr>

                                    <td>${customer.customerId}</td>
                                    <td>${customer.nameCustomer}</td>


                                    <td>${customer.emailCustomer}</td>
                                    <td>${customer.phoneCustomer}</td>


                                    <td class="table-action">
                                        <a href="<c:url value='/manage/customer/detail/${customer.customerId }' />" class="action-icon"> <i class="mdi mdi-eye"></i></a>
                                        <a
                                                href="<c:url value='/manage/customer/edit/${customer.customerId }' />"
                                                class="action-icon"> <i class="fa-solid fa-pen"></i></a>
                                        <a
                                                href="<c:url value='/manage/customer/delete/${customer.customerId }' />"
                                                class="action-icon"> <i class="fa-solid fa-trash"></i></a>

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
</div>

