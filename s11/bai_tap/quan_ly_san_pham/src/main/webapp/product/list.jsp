<%--
  Created by IntelliJ IDEA.
  User: theon
  Date: 03/12/2024
  Time: 4:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="${pageContext.request.contextPath}/products?action=create">Tạo mới sản phẩm</a>
</p>
<table border="1">
    <tr>
        <td>Tên sản phẩm</td>
        <td>Giá</td>
        <td>Số lượng</td>
        <td>Mô tả</td>
        <td>Cập nhật</td>
        <td>Xóa</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="${pageContext.request.contextPath}/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td>${product.getDescription()}</td>
            <td><a href="${pageContext.request.contextPath}/products?action=update&id=${product.getId()}">Cập nhật</a></td>
            <td><a href="${pageContext.request.contextPath}/products?action=delete&id=${product.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
