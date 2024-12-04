<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giỏ Hàng - Quản Lý & Bán Camera</title>
  <!-- Link Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Link Custom CSS -->
  <link href="../css/style.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="../view/index.jsp">Quản Lý & Bán Camera</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
              aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"><a class="nav-link" href="../view/index.jsp">Trang Chủ</a></li>
          <li class="nav-item"><a class="nav-link" href="../product/product.jsp">Sản Phẩm</a></li>
          <li class="nav-item active"><a class="nav-link" href="cart.jsp">Giỏ Hàng</a></li>
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

<!-- Giỏ Hàng -->
<div class="container py-5">
  <h2 class="text-center mb-5">Giỏ Hàng</h2>
  <%
    // Lấy giỏ hàng từ session
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart == null) {
      cart = new ArrayList<>();
      session.setAttribute("cart", cart); // Tạo giỏ hàng mới nếu chưa có
    }

    if (cart.isEmpty()) {
  %>
  <div class="alert alert-info" role="alert">
    Giỏ hàng của bạn hiện tại trống. Hãy quay lại <a href="../product/product.jsp" class="alert-link">mua sắm</a>.
  </div>
  <%
  } else {
  %>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th scope="col">Tên Sản Phẩm</th>
      <th scope="col">Giá</th>
      <th scope="col">Số Lượng</th>
      <th scope="col">Tổng</th>
      <th scope="col">Hành Động</th>
    </tr>
    </thead>
    <tbody>
    <% double total = 0; %>
    <% for (Map<String, String> item : cart) { %>
    <tr>
      <td><%= item.get("name") %></td>
      <td><%= item.get("price") %></td>
      <td><%= item.get("quantity") %></td>
      <td>
        <%
          double price = Double.parseDouble(item.get("price").replaceAll("[^0-9]", ""));
          total += price * Integer.parseInt(item.get("quantity"));
        %>
        <%= item.get("quantity") %> x <%= item.get("price") %>
      </td>
      <td>
        <a href="remove-from-cart.jsp?product=<%= item.get("name") %>" class="btn btn-danger">Xóa</a>
      </td>
    </tr>
    <% } %>
    <tr>
      <td colspan="3" class="text-end"><strong>Tổng Cộng:</strong></td>
      <td><%= String.format("%,.0f VNĐ", total) %></td>
      <td></td>
    </tr>
    </tbody>
  </table>

  <div class="text-center">
    <a href="checkout.jsp" class="btn btn-success">Thanh Toán</a>
    <a href="products.jsp" class="btn btn-primary">Tiếp Tục Mua Sắm</a>
  </div>
  <% } %>
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
