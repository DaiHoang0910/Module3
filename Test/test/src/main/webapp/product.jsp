<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.test.model.Product" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản Phẩm - Quản Lý & Bán Camera</title>
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
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link active" href="product.jsp">Sản Phẩm</a></li>
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

<!-- Main Content -->
<div class="container mt-4">
    <div class="row">
        <!-- Sidebar: Danh mục sản phẩm -->
        <aside class="col-md-3">
            <h4 class="mb-3">Danh mục sản phẩm</h4>
            <ul class="list-group">
                <li class="list-group-item"><a href="#">Camera IP Wifi</a></li>
                <li class="list-group-item"><a href="#">Camera Hành Trình</a></li>
                <li class="list-group-item"><a href="#">Camera Giám Sát</a></li>
                <li class="list-group-item"><a href="#">Camera Mini</a></li>
                <li class="list-group-item"><a href="#">Camera Chống Nước</a></li>
            </ul>
        </aside>

        <!-- Product List -->
        <div class="col-md-9">
            <h1 class="text-center mb-4">Danh Sách Sản Phẩm</h1>
            <div class="row">
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                        for (Product product : products) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="<%= product.getImage() %>" class="card-img-top" alt="<%= product.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <p class="text-primary fw-bold"><%= product.getPrice() %> VND</p>
                            <!-- Hiệu ứng ẩn/hiện mô tả sản phẩm -->
                            <button class="btn btn-info btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#description<%= product.getId() %>" aria-expanded="false" aria-controls="description<%= product.getId() %>">
                                Xem chi tiết
                            </button>
                            <div class="collapse mt-2" id="description<%= product.getId() %>">
                                <p class="card-text"><%= product.getDescription() %></p>
                            </div>
                            <a href="products?action=view&id=<%= product.getId() %>" class="btn btn-primary mt-2">Mua ngay</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-12">
                    <p class="text-center">Không có sản phẩm nào để hiển thị.</p>
                </div>
                <% } %>
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
