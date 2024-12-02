<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String errorMessage = null;

    // Kiểm tra mật khẩu và xác nhận mật khẩu
    if (!password.equals(confirmPassword)) {
        errorMessage = "Mật khẩu và xác nhận mật khẩu không khớp!";
        response.sendRedirect("register.jsp?error=" + errorMessage);
        return;
    }

    // Xử lý đăng ký
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Kết nối CSDL (chỉnh sửa theo thông tin CSDL của bạn)
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/camera_shop", "root", "password");

        String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, password);

        int result = stmt.executeUpdate();

        if (result > 0) {
            response.sendRedirect("login.jsp");
        } else {
            errorMessage = "Đăng ký không thành công!";
            response.sendRedirect("register.jsp?error=" + errorMessage);
        }
    } catch (Exception e) {
        e.printStackTrace();
        errorMessage = "Đã có lỗi xảy ra! Vui lòng thử lại sau.";
        response.sendRedirect("register.jsp?error=" + errorMessage);
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
