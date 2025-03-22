<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Dashboard | Hyper - Responsive Bootstrap 5 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">

    <!-- App favicon -->
    <link rel="shortcut icon" href="<c:url value='/template/assets/images/favicon.ico'/>">

    <!-- Third party CSS -->
    <link href="<c:url value='/template/assets/css/vendor/jquery-jvectormap-1.2.2.css'/>" rel="stylesheet" type="text/css">
<%--    <link href="<c:url value='/template/assets/css/vendor/dataTables.bootstrap5.css'/>" rel="stylesheet" type="text/css">--%>
    <link href="<c:url value='/template/assets/css/vendor/responsive.bootstrap5.css'/>" rel="stylesheet" type="text/css">


    <!-- App CSS -->
    <link href="<c:url value='/template/assets/css/icons.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/template/assets/css/app.min.css'/>" rel="stylesheet" type="text/css" id="light-style">
    <link href="<c:url value='/template/assets/css/app-dark.min.css'/>" rel="stylesheet" type="text/css" id="dark-style">



    <link href="https://cdn.datatables.net/2.1.4/css/dataTables.bootstrap5.css" rel="stylesheet" type="text/css">


    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<%--    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>--%>
<%--    <script src="https://cdn.datatables.net/2.1.3/js/jquery.dataTables.min.js"></script>--%>
<%--    <script src="https://cdn.datatables.net/2.1.3/js/dataTables.bootstrap5.min.js"></script>--%>


<%--    --%>
    <link href="<c:url value='/template/assets/css/vendor/fullcalendar.min.css'/>" rel="stylesheet" type="text/css">
</head>

<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
<div class="wrapper">
    <%@include file="/common/admin/menu.jsp" %>

    <div class="main">
        <%@include file="/common/admin/header.jsp" %>
        <div class="content-page">
            <main>
                <div class="content">
                    <div class="pt-3">
                        <c:if test="${not empty message}">
                            <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
                                <strong></strong>${message}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </div>

                    <jsp:include page="${body}" />
                </div>
            </main>
        </div>

        <%@include file="/common/admin/footer.jsp" %>
    </div>


</div>

<script src="<c:url value='/template/assets/js/vendor.min.js'/>"></script>
<script src="<c:url value='/template/assets/js/app.min.js'/>"></script>

<!-- Third party JS -->

<script src="<c:url value='/template/assets/js/vendor/apexcharts.min.js'/>"></script>
<script src="<c:url value='/template/assets/js/vendor/jquery-jvectormap-1.2.2.min.js'/>"></script>
<script src="<c:url value='/template/assets/js/vendor/jquery-jvectormap-world-mill-en.js'/>"></script>

<!-- Demo app -->
<script src="<c:url value='/template/assets/js/pages/demo.dashboard.js'/>"></script>

<%--table--%>
<%--<script src="<c:url value='/template/assets/js/vendor/jquery.dataTables.min.js'/>"></script>--%>
<%--<script src="<c:url value='/template/assets/js/vendor/dataTables.bootstrap5.js'/>"></script>--%>
<script src="<c:url value='/template/assets/js/vendor/dataTables.responsive.min.js'/>"></script>
<script src="<c:url value='/template/assets/js/vendor/responsive.bootstrap5.min.js'/>"></script>
<script src="<c:url value='/template/assets/js/vendor/dataTables.checkboxes.min.js'/>"></script>


<script src="https://cdn.datatables.net/2.1.3/js/jquery.dataTables.min.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.7.1.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>--%>
<script src="https://cdn.datatables.net/2.1.3/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.1.3/js/dataTables.bootstrap5.js"></script>

<!-- third party js ends -->
<script src="<c:url value='/template/assets/js/vendor/fullcalendar.min.js'/>"></script>

<!-- demo app --><script src="<c:url value='/template/assets/js/pages/demo.calendar.js'/>"></script>


<script>
    $(document).ready(function() {
        $('.table-list').DataTable({
            "language": {
                "sEmptyTable": "Không có dữ liệu trong bảng",
                "sInfo": "Đang hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang hiển thị từ 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(lọc từ tổng số _MAX_ mục)",
                "sLengthMenu": "Hiển thị _MENU_ mục",
                "sLoadingRecords": "Đang tải...",
                "sProcessing": "Đang xử lý...",
                "sSearch": "Tìm kiếm:",
                "sZeroRecords": "Không tìm thấy kết quả",
                "oAria": {
                    "sSortAscending": ": Sắp xếp cột theo thứ tự tăng dần",
                    "sSortDescending": ": Sắp xếp cột theo thứ tự giảm dần"
                }
            },
            "rowCallback": function(row, data, index) {
                // Gán giá trị STT
                $('td:eq(0)', row).html(index + 1); // Cột đầu tiên là STT
            }
        });
    });
</script>
</body>

</html>




