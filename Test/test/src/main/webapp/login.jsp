<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập - Quản Lý & Bán Camera</title>
    <!-- Link Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Link Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<header>
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
                    <li class="nav-item"><a class="nav-link" href="products.jsp">Sản Phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="cart.jsp">Giỏ Hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên Hệ</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Login Form -->
<div class="container py-5">
    <h2 class="text-center mb-5">Đăng Nhập</h2>

    <%-- Kiểm tra nếu có thông báo lỗi --%>
    <%
        String errorMessage = request.getParameter("error");
        if (errorMessage != null) {
    %>
    <div class="alert alert-danger" role="alert">
        <%= errorMessage %>
    </div>
    <% } %>

    <form action="login-action.jsp" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Đăng Nhập</button>
    </form>

    <p class="mt-3">Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
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
