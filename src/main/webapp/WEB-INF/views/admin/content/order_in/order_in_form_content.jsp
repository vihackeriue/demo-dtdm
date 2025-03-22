<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm đợt nhập hàng</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .order-in-item {
            margin-bottom: 15px;
            position: relative; /* Thêm vị trí tương đối để định vị nút xóa */
        }
        .remove-item {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            color: red;
        }
    </style>
</head>
<body>
<div class="container-fluid p-0">
    <div class="mb-3 mt-3 d-flex justify-content-between align-items-center">
        <h1 class="h3 d-inline align-middle">Thêm đợt nhập hàng</h1>
        <a href="${pageContext.request.contextPath}/manage/order-in/list" class="btn btn-secondary">Quay lại</a>
    </div>
    <div class="row">
        <form action="${pageContext.request.contextPath}/manage/order-in/new" method="post">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-3 mt-3">Ngày nhập hàng</h5>
                </div>
                <div class="card-body">
                    <input type="datetime-local" name="orderDate" class="form-control" required>
                </div>

            </div>
            <div id="order-in-items-container">
                <div class="card order-in-item">
                    <div class="card-header">
                        <h5 class="card-title">Hàng nhập vào</h5>
                        <span class="remove-item" onclick="removeItem(this)">&#x2715;</span>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="material">Nguyên liệu</label>
                            <select id="material" class="form-control" name="orderInDetails[0].material.materialId">
                                <c:forEach items="${materials}" var="material">
                                    <option value="${material.materialId}">
                                        <c:out value="${material.materialName}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="quantity">Số lượng</label>
                            <input id="quantity" type="number" name="orderInDetails[0].quantity" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Tổng tiền</label>
                            <input id="price" type="number" name="orderInDetails[0].price" class="form-control" required>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" style="width: 100%;" id="add-order-in-item" class="btn btn-secondary mb-3">Thêm hàng nhập vào</button>
            <input type="submit" class="btn btn-primary" value="Xác nhận"/>
        </form>

    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var counter = 1;
        const addButton = document.getElementById('add-order-in-item');
        const container = document.getElementById('order-in-items-container');

        addButton.addEventListener('click', function () {
            const newItem = document.createElement('div');
            newItem.classList.add('card', 'order-in-item');
            newItem.innerHTML = `
                <div class="card-header">
                    <h5 class="card-title">Hàng nhập vào ` + counter + `</h5>
                    <span class="remove-item" onclick="removeItem(this)">&#x2715;</span>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="material` + counter + `">Nguyên liệu</label>
                        <select class="form-control" name="orderInDetails[` + counter + `].material.materialId">
                            <c:forEach items="${materials}" var="material">
                                <option value="${material.materialId}">
                                    <c:out value="${material.materialName}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity` + counter + `">Số lượng</label>
                        <input type="number" name="orderInDetails[` + counter + `].quantity" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="price` + counter + `">Tổng tiền</label>
                        <input type="number" name="orderInDetails[` + counter + `].price" class="form-control" required>
                    </div>
                </div>
                `;
            container.appendChild(newItem);
            counter++;
        });
    });

    function removeItem(element) {
        const itemToRemove = element.closest('.order-in-item');
        itemToRemove.remove();
    }
</script>
</body>
</html>
