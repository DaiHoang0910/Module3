<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Xóa thông tin sản phẩm</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="${pageContext.request.contextPath}/products">Trở lại danh sách sản phẩm</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Giá:</td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Số lượng:</td>
                <td>${requestScope["product"].getQuantity()}</td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td>${requestScope["product"].getDescription()}</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Delete product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
