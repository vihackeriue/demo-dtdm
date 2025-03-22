<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<div class="container-fluid p-0">

    <div class="mb-3">
        <h1 class="h3 d-inline align-middle">${voucher.voucherId == null ? 'Thêm mã giảm giá' : 'Chỉnh sửa mã giảm giá'}</h1>

    </div>
    <div class="card">
        <form action="<c:url value='/manage/voucher/save'/>" method="post"
              class="card-body">
            <div class="row">
                <div class="col-lg-6">

                    <c:if test="${voucher.voucherId != null}">
                        <input type="hidden" name="voucherId" value="${voucher.voucherId}">
                    </c:if>
                    <div class="mb-3">
                        <label for="code" class="form-label">Mã giảm giá</label> <input
                            type="text" id="code" class="form-control"
                            name="code" placeholder="Mã giảm giá" required
                            value="${voucher.code}">
                    </div>

                    <div class="mb-3">
                        <label for="discount" class="form-label">Phần trăm giảm</label> <input
                            type="number" id="discount" class="form-control"
                            name="discount"  required
                            value="${voucher.discount}">
                    </div>



                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">${voucher.voucherId != null ? 'Cập nhật' : 'Thêm'}</button>
                    </div>
                </div>

                <div class="col-lg-6">






                </div>
            </div>
        </form>
    </div>

</div>
