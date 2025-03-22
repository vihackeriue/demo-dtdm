<%@ page import="com.example.security.SecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="navbar-custom">
    <ul class="list-unstyled topbar-menu float-end mb-0">
        <li class="dropdown notification-list d-lg-none">
            <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                <i class="dripicons-search noti-icon"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                <form class="p-3">
                    <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                </form>
            </div>
        </li>

<%--        <li class="dropdown notification-list">--%>
<%--            <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">--%>
<%--                <i class="dripicons-bell noti-icon"></i>--%>
<%--                <span class="noti-icon-badge"></span>--%>
<%--            </a>--%>
<%--            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg">--%>

<%--                <!-- item-->--%>
<%--                <div class="dropdown-item noti-title">--%>
<%--                    <h5 class="m-0">--%>
<%--                                            <span class="float-end">--%>
<%--                                                <a href="javascript: void(0);" class="text-dark">--%>
<%--                                                    <small>Clear All</small>--%>
<%--                                                </a>--%>
<%--                                            </span>Notification--%>
<%--                    </h5>--%>
<%--                </div>--%>

<%--                <div style="max-height: 230px;" data-simplebar="">--%>
<%--                    <!-- item-->--%>
<%--                    <a href="javascript:void(0);" class="dropdown-item notify-item">--%>
<%--                        <div class="notify-icon bg-primary">--%>
<%--                            <i class="mdi mdi-comment-account-outline"></i>--%>
<%--                        </div>--%>
<%--                        <p class="notify-details">Caleb Flakelar commented on Admin--%>
<%--                            <small class="text-muted">1 min ago</small>--%>
<%--                        </p>--%>
<%--                    </a>--%>
<%--                </div>--%>

<%--                <!-- All-->--%>
<%--                <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">--%>
<%--                    Xem thêm--%>
<%--                </a>--%>

<%--            </div>--%>
<%--        </li>--%>

        <li class="dropdown notification-list">
            <a class="nav-link dropdown-toggle nav-user arrow-none me-0" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                    <span class="account-user-avatar">
                                        <img src="<c:url value="/template/assets/images/users/user.png"/> " alt="user-image" class="rounded-circle">
                                    </span>
                <span>
                                        <span class="account-user-name"><%=SecurityUtils.getPrincipal().getFullName()%></span>
                                        <span class="account-position"><%=SecurityUtils.getPrincipal().getAuthorities()%></span>
                                    </span>
            </a>
            <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                <!-- item-->
                <div class=" dropdown-header noti-title">
                    <h6 class="text-overflow m-0">Welcome!</h6>
                </div>
                <c:url var="profileUrl" value='/manage/profile'/>
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" id="profile-btn">
                    <i class="mdi mdi-account-circle me-1"></i>
                    <span>Tài khoản</span>
                </a>
                <c:url var="logoutUrl" value="/logout"/>
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" id="logout-btn">
                    <i class="mdi mdi-logout me-1"></i>
                    <span>Đăng xuất</span>

                </a>
            </div>
        </li>

    </ul>
    <button class="button-menu-mobile open-left">
        <i class="mdi mdi-menu"></i>
    </button>
<%--    <div class="app-search dropdown d-none d-lg-block">--%>
<%--        <form>--%>
<%--            <div class="input-group">--%>
<%--                <input type="text" class="form-control dropdown-toggle" placeholder="Search..." id="top-search">--%>
<%--                <span class="mdi mdi-magnify search-icon"></span>--%>
<%--                <button class="input-group-text btn-primary" type="submit">Tìm kiếm</button>--%>
<%--            </div>--%>
<%--        </form>--%>

<%--        <div class="dropdown-menu dropdown-menu-animated dropdown-lg" id="search-dropdown">--%>
<%--            <!-- item-->--%>
<%--            <div class="dropdown-header noti-title">--%>
<%--                <h5 class="text-overflow mb-2">Found <span class="text-danger">17</span> results</h5>--%>
<%--            </div>--%>

<%--            <!-- item-->--%>
<%--            <a href="javascript:void(0);" class="dropdown-item notify-item">--%>
<%--                <i class="uil-notes font-16 me-1"></i>--%>
<%--                <span>Analytics Report</span>--%>
<%--            </a>--%>



<%--        </div>--%>
<%--    </div>--%>
</div>
<script>
    // Thêm sự kiện click vào phần tử có id là "logout-btn"
    document.getElementById('logout-btn').addEventListener('click', function() {
        // Chuyển hướng đến trang đăng xuất khi click
        window.location.href = '${logoutUrl}';
    });
</script>
<script>
    // Thêm sự kiện click vào phần tử có id là "logout-btn"
    document.getElementById('profile-btn').addEventListener('click', function() {
        // Chuyển hướng đến trang đăng xuất khi click
        window.location.href = '${profileUrl}';
    });
</script>
