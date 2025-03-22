<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid p-0">
    <div class="mb-3 mt-3 d-flex justify-content-between align-items-center">
        <h1 class="h3 d-inline align-middle">Cập nhật hàng nhập vào</h1>
        <a href="${pageContext.request.contextPath}/manage/order-in/${orderId}" class="btn btn-secondary">Quay lại</a>
    </div>
    <div class="row">
        <form action="${pageContext.request.contextPath}/manage/order-in/${orderId}/edit" class="col-12" method="post">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Nguyên liệu</h5>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <select class="form-control" id="material" name="material">
                            <c:forEach items="${materials}" var="material">
                                <option value="${material.materialId}"
                                        <c:if test="${material.materialId == orderin.material.materialId}">selected</c:if>>
                                    <c:out value="${material.materialName}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Số lượng</h5>
                </div>
                <div class="card-body">
                    <input type="number" name="quantity" class="form-control" value="${orderin.quantity}" required>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Tổng tiền</h5>
                </div>
                <div class="card-body">
                    <input type="number" name="price" class="form-control" value="${orderin.price}" required>
                </div>
            </div>
            <input type="hidden" name="did" value="${orderin.id}"/>
            <input type="submit" class="btn btn-primary" value="Cập nhật"/>
        </form>
    </div>
</div>
