<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    .full-width {
        display: block;
        width: 100%;
        height: 100%;
        text-align: center;
        padding: 0;
        box-sizing: border-box; /* Đảm bảo padding và border không vượt ra ngoài chiều rộng của ô */
    }

    /* Tùy chỉnh thêm cho nút để có chiều cao phù hợp */
    .table td {
        vertical-align: middle;
    }
    .bg-warning-lighten {
        background-color: rgba(255, 193, 7, 0.5); /* Màu vàng của Bootstrap warning với 50% opacity */
    }

</style>
<%
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy EEEE");
    pageContext.setAttribute("formatter", formatter);
    LocalDate today = (LocalDate) request.getAttribute("today");
    pageContext.setAttribute("today", today);
%>
<!-- Start Content-->
<div class="container-fluid">

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">Lịch làm việc</h4>
                <!-- Navigation buttons -->

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">
        <div class="col-12">

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-2">
<%--                            <div class="d-grid">--%>
<%--                                <button class="btn btn-lg font-16 btn-danger" id="btn-new-event"><i class="mdi mdi-plus-circle-outline"></i> Create New Event</button>--%>
<%--                            </div>--%>
                            <div id="event-list" class="m-t-20">

                                <ul class="list-group">

                                    <li class="list-group-item bg-success-lighten text-success" id="btn-weekly-view">
                                        <b>Lịch tuần</b>
                                    </li>
                                    <li class="list-group-item bg-info-lighten text-info" id="btn-daily-view">
                                        <b>Lịch ngày Hôm nay</b>
                                    </li>
                                    <li class="list-group-item bg-warning-lighten text-info" id="btn-today-employees">
                                        <b>Ca hôm nay</b>
                                    </li>

                                </ul>
                            </div>
                        </div> <!-- end col-->

                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-5">
                                    <div class="btn-group" role="group" aria-label="View Switcher">
                                        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/manage/manager/shift/calendar?weekOffset=${weekOffset - 1}&currentWeekStart=${currentWeekStart}'">Tuần trước</button>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <h5>${today.format(formatter)}</h5>
                                </div>
                                <div class="col-4" style="display: flex; justify-content: flex-end;">
                                    <div class="btn-group" role="group" aria-label="View Switcher">
<%--                                        <button type="button" class="btn btn-primary" id="btn-daily-view">Ngày</button>--%>
<%--                                        <button type="button" class="btn btn-primary" id="btn-weekly-view">Tuần</button>--%>
<%--                                        <button type="button" class="btn btn-primary" id="btn-today-employees">Ca</button>--%>
                                            <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/manage/manager/shift/calendar?weekOffset=${weekOffset + 1}&currentWeekStart=${currentWeekStart}'">Tuần Sau</button>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4 mt-lg-0 pt-3">

                                <!-- Calendar-like Grid -->
                                <div id="schedule-view" class="calendar-view">
                                    <!-- Daily View -->
                                    <div id="daily-view" class="schedule-content d-none">
                                        <h5>Ca làm việc Ngày: </h5>
                                        <div class="table-responsive">
                                            <table class="table table-bordered calendar-table">
                                                <thead>
                                                <tr>
                                                    <th>Thời gian</th>
                                                    <th>Ca Làm việc</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>08:00 - 09:00</td>
                                                    <td class="calendar-cell" data-day="Monday" data-time="08:00 - 09:00">Shift 1</td>
                                                </tr>
                                                <tr>
                                                    <td>09:00 - 10:00</td>
                                                    <td class="calendar-cell" data-day="Monday" data-time="08:00 - 09:00">Shift 1</td>
                                                </tr>
                                                <!-- Add more rows as needed -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Weekly View -->
                                    <div id="weekly-view" class="schedule-content ">
                                        <h5>Tuần</h5>
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
                                                                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#editModal"
                                                                        data-shift-id="${shift.shiftId}"
                                                                        data-shift-date="${item}"
                                                                >${shift.shiftName}</button>
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

                                    <!-- Today's Employees -->
                                    <div id="today-employees" class="schedule-content d-none">
                                        <h5>Nhân viên làm việc hôm nay</h5>
                                        <!-- Example list of employees -->
                                        <ul class="list-group pt-3">
                                            <c:set var="previousShift" value="" />
                                            <c:forEach var="item" items="${listShiftToDay}">
                                                <c:if test="${item.shift.shiftId != previousShift}">
                                                    <c:set var="previousShift" value="${item.shift.shiftId}" />
                                                    <hr>
                                                </c:if>
                                                <li class="list-group-item bg-warning-lighten"><b>(${item.shift.startTime} - ${item.shift.endTime}) </b>: ${item.user.username} - ${item.shift.shiftName}</li>


                                            </c:forEach>


                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end col -->

                    </div> <!-- end row -->
                </div> <!-- end card body-->
            </div> <!-- end card -->

            <!-- Add New Event MODAL -->
            <!-- Modal -->
            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Chỉnh sửa nhân viên trong ca làm việc</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="editForm" action="<c:url value="/manage/manager/shift/edit-employees"/>" method="post">
                                <!-- Danh sách nhân viên hiện tại trong ca -->
                                <div class="mb-3">
                                    <label class="form-label">Nhân viên trong ca:</label>
                                    <table class="table table-striped" id="employeeTable">
                                        <thead>
                                        <tr>
                                            <th>Tên</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody id="employeeList">
                                        <!-- Các hàng nhân viên sẽ được thêm vào đây -->
                                        </tbody>
                                    </table>
                                </div>


                                <!-- Thêm nhân viên mới vào ca -->

                                    <div class="mb-3" id="addemployeeForm" style="display: none;">
                                        <label for="newEmployee" class="form-label">Thêm nhân viên:</label>

                                        <select class="form-select" aria-label="Default select example" id="newEmployee">

                                        </select>
                                    </div>



                                <input type="hidden" id="shiftId" name="shiftId" value="${shiftId}">
                                <input type="hidden" id="shiftDate" name="shiftId" value="${shiftDate}">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end modal-->
        </div>
        <!-- end col-12 -->
    </div> <!-- end row -->

</div> <!-- container -->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var dailyView = document.getElementById('daily-view');
        var weeklyView = document.getElementById('weekly-view');
        var todayEmployeesView = document.getElementById('today-employees');

        document.getElementById('btn-daily-view').addEventListener('click', function () {
            dailyView.classList.remove('d-none');
            weeklyView.classList.add('d-none');
            todayEmployeesView.classList.add('d-none');
        });

        document.getElementById('btn-weekly-view').addEventListener('click', function () {
            dailyView.classList.add('d-none');
            weeklyView.classList.remove('d-none');
            todayEmployeesView.classList.add('d-none');
        });

        document.getElementById('btn-today-employees').addEventListener('click', function () {
            dailyView.classList.add('d-none');
            weeklyView.classList.add('d-none');
            todayEmployeesView.classList.remove('d-none');
        });

        <%--// Add click event to cells--%>
        <%--var calendarCells = document.querySelectorAll('.calendar-cell');--%>
        <%--calendarCells.forEach(cell => {--%>
        <%--    cell.addEventListener('click', function () {--%>
        <%--        var day = this.getAttribute('data-day');--%>
        <%--        var time = this.getAttribute('data-time');--%>
        <%--        var employeeId = prompt(`Assign employee to ${day} ${time}:`);--%>
        <%--        if (employeeId) {--%>
        <%--            // Make API call to assign employee (Update this URL as needed)--%>
        <%--            $.post(`/Mock-Project/manage/manager/shift/${day}/${time}/assign`, { employeeId: employeeId }, function () {--%>
        <%--                alert('Employee assigned successfully!');--%>
        <%--            });--%>
        <%--        }--%>
        <%--    });--%>
        <%--});--%>


        // Lắng nghe sự kiện khi modal được hiển thị
        $('#editModal').on('show.bs.modal', function(event) {
            // Lấy thông tin từ nút đã kích hoạt modal
            var button = $(event.relatedTarget);
            var shiftId = button.data('shift-id'); // Lấy shiftId từ thuộc tính data của nút
            var shiftDate = button.data('shift-date');
            var today = new Date().toISOString().split('T')[0];
            console.log(today)
            console.log(shiftDate)
            // So sánh shiftDate với ngày hiện tại
            if (shiftDate >= today) {
                $('#addemployeeForm').show();
            } else {
                $('#addemployeeForm').hide();
            }
            console.log(shiftId)
            // Gọi API để lấy danh sách nhân viên trong ca
            fetch(`/Mock-Project/manage/manager/shift/api/detail/`+ shiftId + "/" + shiftDate)
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    // Làm trống danh sách nhân viên hiện tại
                    $('#employeeList').empty();

                    // Thêm các nhân viên vào danh sách
                    data.forEach(employee => {
                        const username = employee.user.username || 'Chưa có tên';
                        const status = employee.status === 1 ? 'Đã làm' : 'Chưa làm';
                        const userId = employee.user.id || '#';
                        const checkDisable = employee.status === 1 ? 'disabled' : '';
                        const $row = $('<tr></tr>');
                        $row.append(`<td>`+ username +`</td>`);
                        $row.append(`<td>`+ status + `</td>`);
                        $row.append(
                            `<td>
                                <button type="button" class="btn btn-danger btn-sm" onclick="showEmployeeDetails(`+userId + `)"`+checkDisable+`>Xóa</button>
                            </td>`
                        );

                        $('#employeeList').append($row);

                        // Gán giá trị shiftId vào input ẩn

                    });

                    $('#shiftId').val(shiftId);
                    $('#shiftDate').val(shiftDate)


                })
                .catch(error => {
                    console.error('Error fetching employee data:', error);
                });
            fetch(`/Mock-Project/manage/manager/employee/api/employee/` + shiftId + "/" + shiftDate)
                .then(response => response.json())
                .then(data => {
                    // Cập nhật các tùy chọn trong select
                    $('#newEmployee').empty().append('<option value="" disabled selected>Chọn nhân viên</option>');
                    data.forEach(employee => {
                        $('#newEmployee').append(`<option value="` + employee.id + `">`+ employee.username +`</option>`);
                    });
                }).catch(error => {
                console.error('Error fetching employee data:', error);
            });
        });



    });

    // Hàm để xóa nhân viên khỏi danh sách
    function removeEmployee(employeeId) {
        $('#employee-' + employeeId).remove(); // Xóa nhân viên khỏi danh sách
    }

    function addEmployee() {
        var newEmployeeId = $('#newEmployee').val(); // Lấy ID nhân viên mới từ select
        var newEmployeeName = $('#newEmployee option:selected').text(); // Lấy tên nhân viên mới

        var currentShiftId = $('#shiftId').val()
        var currentShiftDate = $('#shiftDate').val()
        console.log(currentShiftId)
        console.log(newEmployeeId)
        console.log(newEmployeeName)
        // Kiểm tra xem nhân viên đã có trong danh sách hay chưa
        if ($('#employee-' + newEmployeeId).length == 0) {
            // Gửi yêu cầu thêm nhân viên mới vào cơ sở dữ liệu
            fetch('/Mock-Project/manage/manager/shift/api/add-employee', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    userID: newEmployeeId,  // Truyền ID nhân viên
                    shiftID: currentShiftId,
                    date: currentShiftDate,// Truyền ID ca làm việc (phải có biến `currentShiftId` lưu trữ ID ca làm việc hiện tại)
                    // Bạn có thể thêm các thuộc tính khác nếu cần
                })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // Nếu thêm vào cơ sở dữ liệu thành công, thêm nhân viên vào danh sách
                    const username = newEmployeeName || 'Chưa có tên';
                    const status = 'Chưa làm';
                    const userId = newEmployeeId || '#';

                    const $row = $('<tr></tr>');
                    $row.append(`<td>`+ username +`</td>`);
                    $row.append(`<td>`+ status + `</td>`);
                    $row.append(
                        `<td>
                                <button type="button" class="btn btn-danger btn-sm" onclick="showEmployeeDetails(`+userId +`)">Xóa</button>
                            </td>`
                    );

                    $('#employeeList').append($row);

                    $('#shiftId').val(currentShiftId);
                    $('#shiftDate').val(currentShiftDate)
                })
                .catch(error => {
                    console.error('There was a problem with your fetch operation:', error);
                    alert('Đã xảy ra lỗi khi thêm nhân viên.');
                });
        } else {
            alert('Nhân viên này đã có trong ca.');
        }
    }


    // Gọi hàm addEmployee() khi submit form
    $('#editForm').on('submit', function(event) {
        event.preventDefault();
        addEmployee();
    });


</script>
