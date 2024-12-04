<%--
  Created by IntelliJ IDEA.
  User: theon
  Date: 03/12/2024
  Time: 4:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product details</h1>
<p>
  <a href="${pageContext.request.contextPath}/products">Back to Product list</a>
</p>
<table>
  <tr>
    <td>Tên sản phẩm: </td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Giá: </td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td>Số lượng: </td>
    <td>${requestScope["product"].getQuantity()}</td>
  </tr>
  <tr>
    <td>Mô tả: </td>
    <td>${requestScope["product"].getDescription()}</td>
  </tr>
</table>
</body>
</html>
