<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/11/2024
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="shortcut icon" href="<c:url value='/template/assets/img/icons/icon-48x48.png'/>" />

    <link rel="canonical" href="https://demo-basic.adminkit.io/pages-sign-in.html" />

    <title>Sign In | AdminKit Demo</title>

    <link href="<c:url value='/template/assets/css/app.min.css'/>" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <main class="d-flex w-100">
        <div class="container d-flex flex-column">
            <div class="row vh-100">
                <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 mx-auto d-table h-100">
                    <div class="d-table-cell align-middle">

                        <div class="text-center mt-4">
                            <h1 class="h2">Xin Chào!</h1>
                            <p class="lead">
                                Đăng nhập để tiếp tục
                            </p>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <div class="m-sm-3">
                                    <form action="${pageContext.request.contextPath}/login" method="post">
                                        <div class="mb-3">
                                            <label class="form-label">Tên Đăng Nhập/Email</label>
                                            <input class="form-control form-control-lg" type="text" name="username" placeholder="Nhập Tên Đăng Nhập/Email" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mật Khẩu</label>
                                            <input class="form-control form-control-lg" type="password" name="password" placeholder="Nhập Mật Khẩu" />
                                        </div>
                                        <div>
                                            <div class="form-check align-items-center">
                                                <input id="customControlInline" type="checkbox" class="form-check-input" value="remember-me" name="remember-me" checked>
                                                <label class="form-check-label text-small" for="customControlInline">Ghi nhớ</label>
                                            </div>
                                        </div>
                                        <div class="d-grid gap-2 mt-3">
                                            <button type="submit" class="btn btn-lg btn-primary">Đăng Nhập</button>
                                        </div>
                                    </form>
                                </div>
                                <c:if test="${param.error != null}">
                                    <div class="alert alert-danger" style="color: red">
                                        *Username or password incorrect
                                    </div>
                                </c:if>
                                <c:if test="${param.accessDenied != null}">
                                    <div class="alert alert-danger">
                                        you Not authorize
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="text-center mb-3">
<%--                        Don't have an account? <a href="pages-sign-up.html">Sign up</a>--%>
                            <p>Liên hệ quản lý của hàng để tạo tài khoản</p>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <script src="<c:url value='/template/assets/js/app.js'/>"></script>

</body>
</html>
