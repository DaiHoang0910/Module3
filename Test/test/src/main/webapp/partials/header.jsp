<%--
  Created by IntelliJ IDEA.
  User: theon
  Date: 04/12/2024
  Time: 10:59 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <li class="nav-item"><a class="nav-link active" href="../view/index.jsp">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="../product/product.jsp">Sản Phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="../cart/cart.jsp">Giỏ Hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên Hệ</a></li>
                </ul>
                <div class="d-flex">
                    <a class="btn btn-outline-light" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Đăng Nhập</a>
                    <a class="btn btn-outline-light ms-2" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Đăng Ký</a>
                    <a class="btn btn-outline-light ms-2" href="#" data-bs-toggle="modal" data-bs-target="#accountModal">Tài Khoản</a>
                </div>
            </div>
        </div>
    </nav>
</header>

