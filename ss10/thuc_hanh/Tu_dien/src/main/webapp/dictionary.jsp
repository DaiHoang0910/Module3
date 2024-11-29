<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<h1>Simple Dictionary</h1>
<form method="get">
    <input type="text" name="search" placeholder="Enter a word">
    <button type="submit">Search</button>
</form>
<hr>
<%
    Map<String, String> dic = new HashMap<>();
    dic.put("hello", "Xin chào");
    dic.put("how", "Thế nào");
    dic.put("book", "Quyển vở");
    dic.put("computer", "Máy tính");

    String search = request.getParameter("search");
    if (search != null && !search.trim().isEmpty()) {
        String result = dic.get(search);
        if (result != null) {
%>
<p>Word: <strong><%= search %>
</strong></p>
<p>Result: <strong><%= result %>
</strong></p>
<%
} else {
%>
<p style="color: red;">Not found</p>
<%
    }
} else if (search != null) {
%>
<p style="color: red;">Please enter a valid word to search.</p>
<%
    }
%>
</body>
</html>
