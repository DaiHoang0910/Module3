<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String errorMessage = null;

    // Xử lý đăng nhập
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Kết nối CSDL (chỉnh sửa theo thông tin CSDL của bạn)
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/camera_shop", "root", "password");

        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // Đăng nhập thành công, lưu thông tin vào session
            HttpSession session1 = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            // Đăng nhập thất bại
            errorMessage = "Tên đăng nhập hoặc mật khẩu không đúng!";
            response.sendRedirect("login.jsp?error=" + errorMessage);
        }
    } catch (Exception e) {
        e.printStackTrace();
        errorMessage = "Đã có lỗi xảy ra! Vui lòng thử lại sau.";
        response.sendRedirect("login.jsp?error=" + errorMessage);
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
