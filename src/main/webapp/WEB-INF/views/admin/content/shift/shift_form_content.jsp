<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container-fluid pt-3">

    <c:if test="${not empty message}">
        <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
            <strong></strong>${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>



    <div class="mb-3">
        <h1 class="h3 d-inline align-middle">Thêm ca làm việc mới</h1>
    </div>
    <div class="row">
       <div class="col-11">
           <form action="<c:url value="/manage/manager/shift/new"/>" class="needs-validation " method="post" id="ShiftForm" novalidate >
               <div class="card">
                   <div class="card-header">
                       <h5 class="card-title mb-0">Tên ca làm việc</h5>
                   </div>
                   <div class="card-body">
                       <input type="text"  name="shiftName" class="form-control" required>
                   </div>
               </div>
               <div class="card">
                   <div class="card-header">
                       <h5 class="card-title mb-0">Thời gian bắt đầu</h5>
                   </div>
                   <div class="card-body">
                       <input type="time" id="startTime" name="startTime" class="form-control" required>
                   </div>
               </div>
               <div class="card">
                   <div class="card-header">
                       <h5 class="card-title mb-0">Thời gian kết thúc</h5>
                   </div>
                   <div class="card-body">
                       <input type="time" id="endTime" name="endTime" class="form-control" required>
                   </div>

                   <div class="alert alert-danger d-none container" id="timeError">
                       Thời gian bắt đầu phải nhỏ hơn thời gian kết thúc.
                   </div>
               </div>
               <div class="card">
                   <div class="card-header">
                       <h5 class="card-title mb-0">Lương</h5>
                   </div>
                   <div class="card-body">
                       <input type="number" name="salary" class="form-control" required>
                   </div>
               </div>
               <div class="text-end">
                   <input type="submit" class="btn btn-primary " value="Thêm"></input>
               </div>

           </form>
       </div>
    </div>
</div>

<script>


    document.getElementById('ShiftForm').addEventListener('submit', function(event) {
        var startTime = document.getElementById('startTime').value;
        var endTime = document.getElementById('endTime').value;
        var timeError = document.getElementById('timeError');

        timeError.classList.add('d-none'); // Ẩn thông báo lỗi trước khi kiểm tra

        if (!this.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
            this.classList.add('was-validated');
        } else {
            if (startTime >= endTime) {
                event.preventDefault();
                event.stopPropagation();
                timeError.classList.remove('d-none'); // Hiện thông báo lỗi
            }
        }
    });



</script>