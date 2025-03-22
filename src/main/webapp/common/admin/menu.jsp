<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.GrantedAuthority" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="leftside-menu">

    <!-- LOGO -->
    <a href="<c:url value="/manage/home"/> " class="logo text-center logo-light">
                    <span class="logo-lg">
                        <img src="<c:url value="/template/assets/images/logo.png"/> " alt="" height="64">
                    </span>
        <span class="logo-sm">
                        <img src="<c:url value="/template/assets/images/logo.png"/>" alt="" height="64">
                    </span>
    </a>

    <!-- LOGO -->
    <a href="<c:url value="/manage/home"/>" class="logo text-center logo-dark">
                    <span class="logo-lg">
                        <img src="<c:url value="/template/assets/images/logo.png"/>" alt="" height="16">
                    </span>
                    <span class="logo-sm">
                        <img src="<c:url value="/template/assets/images/logo.png"/>" alt="" height="16">
                    </span>
    </a>

    <div class="h-100" id="leftside-menu-container" data-simplebar="">

        <!--- Sidemenu -->
        <ul class="side-nav">
            <li class="side-nav-item">
                <a  href="<c:url value='/manage/home'/>"  class="side-nav-link">
                    <i class="uil-home-alt"></i>
                    <span> Trang chủ </span>
                </a>
            </li>
            <li class="side-nav-title side-nav-item">Cửa hàng</li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarOrderIn" aria-expanded="false" aria-controls="sidebarOrderIn" class="side-nav-link">
                    <i class="uil-envelope"></i>
                    <span> Bán hàng </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarOrderIn">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/order-out/new"/>">Đặt hàng</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/order-out/list"/>">Danh sách đơn hàng</a>
                        </li>

                    </ul>
                </div>
            </li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarMaterial" aria-expanded="false" aria-controls="sidebarOrderOut" class="side-nav-link">
                    <i class="uil-envelope"></i>
                    <span>Nguyên liệu</span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarMaterial">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/material/new"/>">Thêm nguyên liệu</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/material/list"/>">Danh sách nguyên liệu</a>
                        </li>

                    </ul>
                </div>
            </li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarOrderOut" aria-expanded="false" aria-controls="sidebarOrderOut" class="side-nav-link">
                    <i class="uil-envelope"></i>
                    <span>Nhập hàng </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarOrderOut">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/order-in/new"/>">Nhập hàng</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/order-in/list"/>">Danh sách đơn hàng nhập</a>
                        </li>

                    </ul>
                </div>
            </li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarProduct" aria-expanded="false" aria-controls="sidebarProduct" class="side-nav-link">
                    <i class="uil-envelope"></i>
                    <span>Sản phẩm</span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarProduct">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/product/list"/>">Danh sách sản phẩm</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/product/new"/>">Thêm sản phẩm</a>
                        </li>

                    </ul>
                </div>
            </li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarCategory" aria-expanded="false" aria-controls="sidebarCategory" class="side-nav-link">
                    <i class="uil-envelope"></i>
                    <span>Danh mục</span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarCategory">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/category/list"/>">Danh sách danh mục</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/category/new"/>">Thêm Danh mục</a>
                        </li>

                    </ul>
                </div>
            </li>

            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarCustomer" aria-expanded="false" aria-controls="sidebarCustomer" class="side-nav-link">
                    <i class="uil-user"></i>
                    <span>Khách hàng</span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarCustomer">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/customer/list"/>">Danh sách khách hàng</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/customer/new"/>">Thêm khách hàng</a>
                        </li>

                    </ul>
                </div>
            </li>

            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarVoucher" aria-expanded="false" aria-controls="sidebarVoucher" class="side-nav-link">
                    <i class="uil-user"></i>
                    <span>Mã giảm giá</span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarVoucher">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/voucher/list"/>">Danh sách mã giảm giá</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/voucher/new"/>">Thêm mã giảm giá</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/voucher-detail/send"/>">Gửi mã giảm giá</a>
                        </li>
                    </ul>
                </div>
            </li>

            <%
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                List<String> rolesToCheck = List.of("ROLE_MANAGER", "ROLE_ADMIN");
                boolean isManager = authentication.getAuthorities().stream()
                        .map(GrantedAuthority::getAuthority)
                        .anyMatch(role -> rolesToCheck.contains(role));

                pageContext.setAttribute("isManager", isManager);
            %>
            <c:if test="${isManager}">
            <li class="side-nav-title side-nav-item">Nhân viên</li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarEmployee" aria-expanded="false" aria-controls="sidebarEmployee" class="side-nav-link">
                    <i class="uil-briefcase"></i>
                    <span> Nhân viên </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarEmployee">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/manager/employee/list"/>">Danh sách nhân viên</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/manager/employee/new"/>">Thêm nhân viên</a>
                        </li>
                    </ul>
                </div>
            </li>
<%--            <li class="side-nav-item">--%>
<%--                <a href="apps-social-feed.html" class="side-nav-link">--%>
<%--                    <i class="uil-rss"></i>--%>
<%--                    <span> Social Feed </span>--%>
<%--                </a>--%>
<%--            </li>--%>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarTasks" aria-expanded="false" aria-controls="sidebarTasks" class="side-nav-link">
                    <i class="uil-clipboard-alt"></i>
                    <span> Ca làm việc </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarTasks">
                    <ul class="side-nav-second-level">
                        <li>
                            <a href="<c:url value="/manage/manager/shift/calendar"/>">Lịch làm việc</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/manager/shift/list"/>">Danh sách ca làm việc</a>
                        </li>
                        <li>
                            <a href="<c:url value="/manage/manager/shift/new"/>">Thêm ca làm việc</a>
                        </li>
                    </ul>
                </div>
            </li>

            </c:if>
<%--            <li class="side-nav-item">--%>
<%--                <a href="" class="side-nav-link">--%>
<%--                    <i class="uil-folder-plus"></i>--%>
<%--                    <span> File Manager </span>--%>
<%--                </a>--%>
<%--            </li>--%>

<%--            <li class="side-nav-title side-nav-item">Kho</li>--%>

        </ul>
        <!-- end Help Box -->
        <!-- End Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->
</div>
