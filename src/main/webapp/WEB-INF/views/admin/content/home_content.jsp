<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp"%>
<%
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy EEEE");
    pageContext.setAttribute("formatter", formatter);
    LocalDate today = (LocalDate) request.getAttribute("today");
    pageContext.setAttribute("today", today);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<div class="container-fluid">

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <div class="page-title-right">
                    <form class="d-flex">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-light" id="dash-daterange" disabled>
                            <span class="input-group-text bg-primary border-primary text-white">
                                                    <i class="mdi mdi-calendar-range font-13"></i>
                                                </span>
                        </div>
                    </form>
                </div>
                <h4 class="page-title">Trang chủ</h4>

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">
        <div class="col-xl-12 col-lg-12">

            <div class="row">
                <div class="col-lg-3">
                    <div class="card widget-flat">
                        <div class="card-body">
                            <div class="float-end">
                                <i class="mdi mdi-cart-plus widget-icon"></i>
                            </div>
                            <h5 class="text-muted fw-normal mt-0" title="Number of Orders">Đơn hàng</h5>
                            <h4 class="mt-3 mb-3">${totalOrders}</h4>
                            <p class="mb-0 text-muted">
                                <span class="${percentageChange > 0 ? 'text-success' : 'text-danger'} me-2">
                                        <i class="${percentageChange > 0 ? 'mdi mdi-arrow-up-bold' : 'mdi mdi-arrow-down-bold'}"></i>
                                        ${percentageChange > 0 ? '+' : ''}${percentageChange}%</span>
                                <span class="text-nowrap">Với tháng trước</span>
                            </p>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->

                <div class="col-lg-3">
                    <div class="card widget-flat">
                        <div class="card-body">
                            <div class="float-end">
                                <i class="mdi mdi-cart-plus widget-icon"></i>
                            </div>
                            <h5 class="text-muted fw-normal mt-0" title="Number of Orders">Sản phẩm đã bán</h5>
                            <h4 class="mt-3 mb-3">${totalProducts}</h4>
                            <p class="mb-0 text-muted">
                                <span class="${percentageChangeProducts > 0 ? 'text-success' : 'text-danger'} me-2">
                                        <i class="${percentageChangeProducts > 0 ? 'mdi mdi-arrow-up-bold' : 'mdi mdi-arrow-down-bold'}"></i>
                                        ${percentageChangeProducts > 0 ? '+' : ''}${percentageChangeProducts}%</span>
                                <span class="text-nowrap">Với tháng trước</span>
                            </p>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->

                <div class="col-lg-3">
                    <div class="card widget-flat">
                        <div class="card-body">
                            <div class="float-end">
                                <i class="mdi mdi-currency-usd widget-icon"></i>
                            </div>
                            <h5 class="text-muted fw-normal mt-0" title="Number of Orders">Doanh thu tháng</h5>
                            <h4 class="mt-3 mb-3">${totalAmount} vnd</h4>
                            <p class="mb-0 text-muted">
                                <span class="${percentageChangeAmounts > 0 ? 'text-success' : 'text-danger'} me-2">
                                        <i class="${percentageChangeAmounts > 0 ? 'mdi mdi-arrow-up-bold' : 'mdi mdi-arrow-down-bold'}"></i>
                                        ${percentageChangeAmounts > 0 ? '+' : ''}${percentageChangeAmounts}%</span>
                                <span class="text-nowrap">Với tháng trước</span>
                            </p>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->

                <div class="col-lg-3">
                    <div class="card widget-flat">
                        <div class="card-body">
                            <div class="float-end">
                                <i class="mdi mdi-currency-usd widget-icon"></i>
                            </div>
                            <h5 class="text-muted fw-normal mt-0" title="Number of Orders">Chi phí nhập hàng</h5>
                            <h4 class="mt-3 mb-3">${totalCosst} vnd</h4>
                            <p class="mb-0 text-muted">
                                <span class="${percentageChangeCost > 0 ? 'text-success' : 'text-danger'} me-2">
                                        <i class="${percentageChangeCost > 0 ? 'mdi mdi-arrow-up-bold' : 'mdi mdi-arrow-down-bold'}"></i>
                                        ${percentageChangeCost > 0 ? '+' : ''}${percentageChangeCost}%</span>
                                <span class="text-nowrap">Với tháng trước</span>
                            </p>
                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->
            </div> <!-- end row -->

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-3">
                            <div class="d-grid">
                                <form method="post" action="<c:url value="/manage/manager/shift/roll-attendance/${shiftCurrentOfEmployee.id}"/>">
                                    <c:if test="${shiftCurrentOfEmployee.id != null}">
                                        <input type="hidden" value="${shiftCurrentOfEmployee.id}" id="shiftCurrentOfEmployee">
                                        <c:if test="${shiftCurrentOfEmployee.status == 0}">
                                            <input type="submit" class="btn btn-lg font-16 btn-danger" value="Điểm danh" />
                                        </c:if>
                                        <c:if test="${shiftCurrentOfEmployee.status == 1}">
                                            <button class="btn btn-lg font-16 btn-success" disabled>Đã Điểm danh</button>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${shiftCurrentOfEmployee.id == null}">
                                        <button class="btn btn-lg font-16 btn-danger" id="btn-roll-attendance"  disabled>Chưa đến ca</button>

                                    </c:if>

                                </form>
                            </div>
                            <div class="pt-3">

                                <div id="external-events" class="m-t-20">
                                    <br>
                                    <p class="text-muted">
                                    </p>
                                    <div class="external-event bg-success-lighten text-success" data-class="bg-success">
                                        <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Hoàn thành
                                    </div>
                                    <div class="external-event bg-info-lighten text-info" data-class="bg-info">
                                        <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Chưa làm
                                    </div>
                                    <div class="external-event bg-warning-lighten text-warning" data-class="bg-warning">
                                        <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i> Đi trễ
                                    </div>
                                    <div class="external-event bg-danger-lighten text-danger" data-class="bg-danger">
                                        <i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>Vắng
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-9">
                            <div id="weekly-view" class="schedule-content">
                                <h5>Lịch làm việc</h5>
                                <!-- Similar table structure as daily view, but adjusted for weekly view -->
                                <div class="table-responsive">
                                    <table class="table table-bordered calendar-table" style="max-height: 400px; overflow-y: auto;">
                                        <thead>
                                        <tr>
                                            <th>Thời gian</th>

                                            <c:forEach var="day" items="${daysOfWeek}">
                                                <th class="${day.equals(today) ? 'bg-warning-lighten' : ''}">
                                                        ${day.format(formatter)}
                                                </th>
                                            </c:forEach>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${shifts}" var="shift">
                                            <tr>
                                                <td>${shift.startTime}</td>
                                                <c:forEach var="item" items="${daysOfWeek}">
                                                    <td rowspan="2" class="text-center ${item.equals(today) ? "bg-warning-lighten" : ""}">
                                                        <!-- Nút End Time -->
                                                        <c:forEach var="myShift" items="${myShifts}">
                                                            <c:if test="${item.equals(myShift.date) && shift.shiftId == myShift.shift.shiftId}">
                                                                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#editModal"
                                                                        data-shift-id="${shift.shiftId}"
                                                                        data-shift-date="${item}">
                                                                        ${shift.shiftName}
                                                                </button>

                                                            </c:if>



                                                        </c:forEach>

                                                    </td>

                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <td>${shift.endTime}</td>
                                            </tr>
                                        </c:forEach>
                                        <!-- Add more rows as needed -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div> <!-- end row -->
                </div>

            </div>

        </div> <!-- end col -->

<%--        <div class="col-xl-7 col-lg-6">--%>
<%--            <div class="card card-h-100">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="dropdown float-end">--%>
<%--                        <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                            <i class="mdi mdi-dots-vertical"></i>--%>
<%--                        </a>--%>
<%--                        <div class="dropdown-menu dropdown-menu-end">--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Export Report</a>--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Profit</a>--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Action</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <h4 class="header-title mb-3">Projections Vs Actuals</h4>--%>

<%--                    <div dir="ltr">--%>
<%--                        <div id="high-performing-product" class="apex-charts" data-colors="#727cf5,#e3eaef"></div>--%>
<%--                    </div>--%>

<%--                </div> <!-- end card-body-->--%>
<%--            </div> <!-- end card-->--%>

<%--        </div> <!-- end col -->--%>
    </div>
    <!-- end row -->

    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <div class="dropdown float-end">
                        <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="mdi mdi-dots-vertical"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">Export Report</a>
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">Profit</a>
                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">Action</a>
                        </div>
                    </div>
                    <h4 class="header-title mb-3">Doanh thu</h4>

                    <div class="chart-content-bg">
                        <div class="row text-center">
                            <div class="col-md-6">
                                <p class="text-muted mb-0 mt-3">Tuần này</p>
                                <h2 class="fw-normal mb-3">
                                    <small class="mdi mdi-checkbox-blank-circle text-primary align-middle me-1"></small>
                                    <span>${amountCurrentWeek}</span>
                                </h2>
                            </div>
                            <div class="col-md-6">
                                <p class="text-muted mb-0 mt-3">Tuần trước</p>
                                <h2 class="fw-normal mb-3">
                                    <small class="mdi mdi-checkbox-blank-circle text-success align-middle me-1"></small>
                                    <span>${amountLastWeek}</span>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <div id="lineChartContainer" style="height: 370px; width: 100%;"></div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->
        </div> <!-- end col-->

        <div class="col-lg-4">

                <div class="card">
                    <div class="card-body">
                        <div id="pieChartContainer" style="height: 370px; width: 100%;"></div>
                    </div> <!-- end card-body-->
                </div> <!-- end card-->


<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="dropdown float-end">--%>
<%--                        <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                            <i class="mdi mdi-dots-vertical"></i>--%>
<%--                        </a>--%>
<%--                        <div class="dropdown-menu dropdown-menu-end">--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Export Report</a>--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Profit</a>--%>
<%--                            <!-- item-->--%>
<%--                            <a href="javascript:void(0);" class="dropdown-item">Action</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <h4 class="header-title">Revenue By Location</h4>--%>
<%--                    <div class="mb-4 mt-4">--%>
<%--                        <div id="world-map-markers" style="height: 224px"></div>--%>
<%--                    </div>--%>

<%--                    <h5 class="mb-1 mt-0 fw-normal">New York</h5>--%>
<%--                    <div class="progress-w-percent">--%>
<%--                        <span class="progress-value fw-bold">72k </span>--%>
<%--                        <div class="progress progress-sm">--%>
<%--                            <div class="progress-bar" role="progressbar" style="width: 72%;" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <h5 class="mb-1 mt-0 fw-normal">San Francisco</h5>--%>
<%--                    <div class="progress-w-percent">--%>
<%--                        <span class="progress-value fw-bold">39k </span>--%>
<%--                        <div class="progress progress-sm">--%>
<%--                            <div class="progress-bar" role="progressbar" style="width: 39%;" aria-valuenow="39" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <h5 class="mb-1 mt-0 fw-normal">Sydney</h5>--%>
<%--                    <div class="progress-w-percent">--%>
<%--                        <span class="progress-value fw-bold">25k </span>--%>
<%--                        <div class="progress progress-sm">--%>
<%--                            <div class="progress-bar" role="progressbar" style="width: 39%;" aria-valuenow="39" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <h5 class="mb-1 mt-0 fw-normal">Singapore</h5>--%>
<%--                    <div class="progress-w-percent mb-0">--%>
<%--                        <span class="progress-value fw-bold">61k </span>--%>
<%--                        <div class="progress progress-sm">--%>
<%--                            <div class="progress-bar" role="progressbar" style="width: 61%;" aria-valuenow="61" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div> <!-- end card-body-->--%>
<%--            </div> <!-- end card-->--%>
        </div> <!-- end col-->

        <div class="col-xl-12 col-lg-10">
            <div class="card card-h-100">
                <div class="card-body">

                    <div dir="ltr">
                        <body>
                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                        </body>
                    </div>

                </div> <!-- end card-body-->
            </div> <!-- end card-->

        </div> <!-- end col -->
    </div>
    <!-- end row -->




</div>
<script>
    window.onload = function () {
        // Line Chart
        var dataPoints = [];
        <c:forEach var="entry" items="${revenueData}">
        dataPoints.push({ label: "${entry.key}", y: ${entry.value}});
        </c:forEach>
        var lineChart = new CanvasJS.Chart("lineChartContainer", {
            animationEnabled: true,
            theme: "light2",
            title: {
                text: "Doanh thu cho tuần hiện tại"
            },
            axisY: {
                title: "Doanh thu (tính bằng VND)",
                gridThickness: 1,
                tickColor: "#4F81BC",
                labelFontColor: "rgba(3,3,3,0.79)"
            },
            axisX: {
                labelFontColor: "rgba(3,3,3,0.79)"
            },
            data: [{
                type: "spline",
                color: "#2665c5",
                markerSize: 10,
                markerColor: "#2665c5",
                dataPoints: dataPoints
            }],
            toolTip: {
                content: "{label}: {y} VND"
            }
        });
        lineChart.render();

        // Pie Chart
        var pieChart = new CanvasJS.Chart("pieChartContainer", {
            animationEnabled: true,
            exportEnabled: true,
            title: {
                text: "Sản phẩm ",
                fontFamily: "Arial, Helvetica, sans-serif" // Thay thế font chữ tùy ý
            },
            data: [{
                type: "pie",
                startAngle: 240,
                yValueFormatString: "#,###\" ly\"",
                showInLegend: true,
                indexLabel: "{y}",
                indexLabelPlacement: "inside",
                dataPoints: [
                    <c:forEach var="data" items="${salesData}">
                    {y: ${data.totalQuantity}, label: "${data.productName}"},
                    </c:forEach>
                ]
            }]

        });

        pieChart.render();

        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
            theme: "light2",
            title: {
                text: "Doanh thu hàng tháng"
            },
            axisY: {
                title: "Doanh thu",

            },
            axisX: {
                title: "Tháng"
            },
            data: [{
                type: "column",
                yValueFormatString: "#,##0.00 vnd",
                dataPoints: [
                    <c:forEach items="${monthlyRevenue}" var="entry">
                    { label: "${entry.key}", y: ${entry.value}},
                    </c:forEach>
                ]
            }]
        });
        chart.render();
    }

</script>