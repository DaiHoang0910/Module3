<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
        .product-discount {
            width: 350px;
            height: 370px;
            border: 1px solid #CCC;
        }

        .product-discount textarea, .product-discount input {
            margin: 5px;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="product-discount">
    <h1>Product Discount Calculator</h1>
    <form method="post" action="${pageContext.request.contextPath}/discount">
        <label>
            <textarea cols="30" rows="10" name="description" placeholder="description"></textarea>
        </label>
        <input type="text" size="30" name="price" placeholder="price"/>
        <input type="text" size="30" name="discount" placeholder="discount"/>
        <input type="submit" name="calculator" value="Calculator Discount"/>
    </form>
</div>
</body>
</html>