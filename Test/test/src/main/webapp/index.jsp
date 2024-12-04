<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ - Quản Lý & Bán Camera</title>
    <!-- Link Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Link Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<header>
    <!-- Navigation Menu -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Quản Lý & Bán Camera</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="product.jsp">Sản Phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="cart.jsp">Giỏ Hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên Hệ</a></li>
                </ul>
                <div class="d-flex">
                    <!-- Tài khoản -->
                    <a class="btn btn-outline-light" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Đăng Nhập</a>
                    <a class="btn btn-outline-light ms-2" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Đăng Ký</a>
                    <a class="btn btn-outline-light ms-2" href="#" data-bs-toggle="modal" data-bs-target="#accountModal">Tài Khoản</a>
                </div>
            </div>
        </div>
    </nav>
</header>

<!-- Banner -->
<div class="banner text-white text-center">
    <div>
        <h2 class="mb-3">Bảo vệ gia đình bạn với những chiếc camera tốt nhất!</h2>
        <p class="mb-4">Khám phá ngay bộ sưu tập camera an ninh, hành trình, và giám sát chất lượng cao.</p>
        <a href="product.jsp" class="btn btn-warning btn-lg">Khám phá ngay</a>
    </div>
</div>

<!-- Product Section -->
<section class="product-section py-5">
    <div class="container">
        <h2 class="text-center mb-5">Sản Phẩm Nổi Bật</h2>
        <div class="row g-4">
            <%-- Mô phỏng sản phẩm động --%>
            <%
                String[][] products = {
                        {"Camera IP Wifi", "1.200.000 VNĐ", "Giám sát 24/7", "https://via.placeholder.com/200"},
                        {"Camera Hành Trình", "2.500.000 VNĐ", "Ghi lại hành trình của bạn", "https://via.placeholder.com/200"},
                        {"Camera Giám Sát", "3.000.000 VNĐ", "Độ phân giải cao", "https://via.placeholder.com/200"}
                };
                for (String[] product : products) {
            %>
            <div class="col-md-4">
                <div class="card">
                    <img src="<%= product[3] %>" class="card-img-top" alt="<%= product[0] %>">
                    <div class="card-body text-center">
                        <h5 class="card-title"><%= product[0] %>
                        </h5>
                        <p class="card-text"><%= product[2] %>
                        </p>
                        <p class="text-primary fw-bold"><%= product[1] %>
                        </p>
                        <a href="cart.jsp?product=<%= product[0] %>" class="btn btn-primary">Thêm vào giỏ</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<!-- Modal Đăng Nhập -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Đăng Nhập</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="login" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Đăng Nhập</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Đăng Ký -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registerModalLabel">Đăng Ký</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="register" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email1" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password1" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-success">Đăng Ký</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Quản Lý Tài Khoản -->
<div class="modal fade" id="accountModal" tabindex="-1" aria-labelledby="accountModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accountModalLabel">Quản Lý Tài Khoản</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5>Chào, <%= session.getAttribute("user.name") %>!</h5>
                <a href="account.jsp" class="btn btn-info">Thông Tin Tài Khoản</a>
                <a href="logout" class="btn btn-danger mt-2">Đăng Xuất</a>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<footer>
    <div class="container text-center py-3">
        <p>&copy; 2024 Quản Lý & Bán Camera | <a href="#">Chính sách bảo mật</a></p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
``
