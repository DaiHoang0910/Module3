<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <div class="dropdown">
                    <a class="btn btn-outline-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        Tài khoản
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="login.jsp">Đăng nhập</a></li>
                        <li><a class="dropdown-item" href="register.jsp">Đăng ký</a></li>
                    </ul>
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
                        <h5 class="card-title"><%= product[0] %></h5>
                        <p class="card-text"><%= product[2] %></p>
                        <p class="text-primary fw-bold"><%= product[1] %></p>
                        <a href="cart.jsp?product=<%= product[0] %>" class="btn btn-primary">Thêm vào giỏ</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>

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
