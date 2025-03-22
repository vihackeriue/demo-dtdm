<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid p-0">
    <div class="mb-3 mt-3 d-flex justify-content-between align-items-center">
        <h1 class="h3 d-inline align-middle">Cập nhật nguyên liệu</h1>
        <a href="${pageContext.request.contextPath}/manage/material/list" class="btn btn-secondary">Quay lại</a>
    </div>
    <div class="row">
        <form action="${pageContext.request.contextPath}/manage/material/edit" class="col-12" method="post">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-3 mt-3">Tên nguyên liệu</h5>
                </div>
                <div class="card-body">
                    <input type="text" name="materialName" class="form-control"
                           required value="${material.materialName}">
                </div>
            </div>
            <!-- Đơn vị đếm -->
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Đơn vị đếm</h5>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <select class="form-control" id="unitsOfMeasurement" name="unitsOfMeasurement">
                            <option value="g" ${material.unitsOfMeasurement == 'g' ? 'selected' : ''}>Gram (g)</option>
                            <option value="kg" ${material.unitsOfMeasurement == 'kg' ? 'selected' : ''}>Kilogram (kg)</option>
                            <option value="l" ${material.unitsOfMeasurement == 'l' ? 'selected' : ''}>Liter (l)</option>
                            <option value="ml" ${material.unitsOfMeasurement == 'ml' ? 'selected' : ''}>Milliliter (ml)</option>
                            <option value="packet" ${material.unitsOfMeasurement == 'packet' ? 'selected' : ''}>Gói</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- Số Lượng -->
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Số Lượng</h5>
                </div>
                <div class="card-body">
                    <input type="number" name="quantity" class="form-control"
                           required value="${material.quantity}">
                </div>
            </div>
            <input type="text" name="materialId" class="form-control" hidden="hidden" value="${material.materialId}">
            <input type="submit" class="btn btn-primary" value="Cập nhật">
        </form>
    </div>
</div>
