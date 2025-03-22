
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid p-0">
    <div class="mb-3 mt-3 d-flex justify-content-between align-items-center">
        <h1 class="h3 d-inline align-middle">Thêm nguyên liệu mới</h1>
        <a href="${pageContext.request.contextPath}/manage/material/list" class="btn btn-secondary">Quay lại</a>
    </div>
    <div class="row">
        <form action="${pageContext.request.contextPath}/manage/material/new" class="col-12" method="post">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-3 mt-3">Tên nguyên liệu</h5>
                </div>
                <div class="card-body">
                    <input type="text" name="materialName" class="form-control" required>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Đơn vị đếm</h5>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <select class="form-control" id="unitsOfMeasurement" name="unitsOfMeasurement">
                            <option value="g">Gram (g)</option>
                            <option value="kg">Kilogram (kg)</option>
                            <option value="l">Liter (l)</option>
                            <option value="ml">Milliliter (ml)</option>
                            <option value="packet">Gói</option>
                        </select>
                    </div>
                </div>
            </div>
            <input type="number" name="quantity" class="form-control" value="0" hidden>

            <input type="submit" class="btn btn-primary" value="Thêm nguyên liệu mới"/>
        </form>
    </div>
</div>