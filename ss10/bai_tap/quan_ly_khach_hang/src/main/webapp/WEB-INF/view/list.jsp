<%--
  Created by IntelliJ IDEA.
  User: theon
  Date: 29/11/2024
  Time: 4:14 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Customer List</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Birth Date</th>
            <th scope="col">Address</th>
            <th scope="col">Image</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.date}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.img}" alt="Customer Image" width="50"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

