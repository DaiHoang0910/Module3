<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: theon
  Date: 03/12/2024
  Time: 4:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="${pageContext.request.contextPath}/products">Trở lại danh sách sản phẩm</a>
</p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
            </tr>
            <tr>
                <td>Giá: </td>
                <td><input type="number" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Số lượng: </td>
                <td><input type="number" name="quantity" id="quantity" value="${requestScope["product"].getQuantity()}"></td>
            </tr>
            <tr>
                <td>Mô tả: </td>
                <td><input type="text" name="des" id="des" value="${requestScope["product"].getDescription()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
