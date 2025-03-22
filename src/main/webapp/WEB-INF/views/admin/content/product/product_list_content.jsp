<%@ page import="com.example.constant.StringConstrant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    .action-icon {
        padding: 0 6px;
    }
</style>
<script src="https://kit.fontawesome.com/6f5caf640a.js" crossorigin="anonymous"></script>
<div class="container-fluid ">
    <h4 class="page-title">Danh sách danh mục</h4>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-4">
                            <a href="<c:url value='/manage/product/new'/>" class="btn btn-primary mb-2"><i
                                    class="mdi mdi-plus-circle me-2"></i> Thêm danh mục mới</a>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-centered display table-list">
                            <thead>
                            <tr>

                                <th class="d-none d-xl-table-cell">Id</th>
                                <th class="d-none d-xl-table-cell">Sản phẩm</th>

                                <th class="d-none d-md-table-cell">Danh mục</th>
                                <th class="d-none d-md-table-cell">Giá</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="product">
                                <tr>

                                    <td>${product.productId}</td>
                                    <% String urlImage = StringConstrant.URL_IMAGE_PRODUCT;
                                        pageContext.setAttribute("urlImage", urlImage);
                                    %>
                                    <td><img src="<c:url value="${urlImage}${product.image}"/>"
                                             alt="contact-img" title="contact-img" class="rounded me-3"
                                             height="50" width="50" style="object-fit: cover">
                                        <p class="m-0 d-inline-block align-middle font-16">
                                            <a href="apps-ecommerce-products-details.html"
                                               class="text-body">${product.productName }</a>

                                        </p></td>
                                    <td>${product.category.categoryName}</td>

                                    <td>${product.price}</td>



                                    <td class="table-action">
                                        <a href="<c:url value='/manage/product/edit/${product.productId}' />"
                                           class="action-icon"> <i class="fa-solid fa-pen"></i></a>
                                        <a href="<c:url value='/manage/product/delete/${product.productId}' />"
                                           class="action-icon"> <i class="fa-solid fa-trash"></i></a></td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
