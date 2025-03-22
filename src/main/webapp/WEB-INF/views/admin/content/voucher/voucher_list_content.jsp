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
                <h4 class="page-title">Danh sách mã giảm giá</h4>
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
                            <a href="<c:url value='/manage/voucher/new'/>" class="btn btn-primary mb-2"><i
                                    class="mdi mdi-plus-circle me-2"></i> Thêm mã giảm giá</a>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-centered display table-list"  style="width: 100%">
                            <thead class="table-light">
                            <tr>
                                <th class="d-none d-xl-table-cell">Id</th>
                                <th class="d-none d-xl-table-cell">Mã giảm giá</th>
                                <th class="d-none d-md-table-cell">Phần trăm giảm</th>

                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${vouchers}" var="voucher">
                                <tr>
                                    <td>${voucher.voucherId}</td>
                                    <td>${voucher.code}</td>
                                    <td>${voucher.discount}</td>
                                    <td class="table-action"> <a
                                            href="<c:url value='/manage/voucher/edit/${voucher.voucherId }'/>"
                                            class="action-icon"> <i class="fa-solid fa-pen"></i></a>
                                        <a
                                                href="<c:url value='/manage/voucher/delete/${voucher.voucherId }' />"
                                                class="action-icon"> <i class="fa-solid fa-trash"></i></a>
                                        <a
                                                href="<c:url value='/manage/voucher/send/${voucher.voucherId }' />"
                                                class="action-icon"> <i class="fa-solid fa-paper-plane"></i></a>
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

