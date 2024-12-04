package com.example.test.controller;

import com.example.test.model.User;
import com.example.test.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    private final UserRepository userRepository = new UserRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try {
            User user = new User(name, email, password);
            userRepository.save(user);
            request.setAttribute("success", "Đăng ký thành công! Hãy đăng nhập.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Email đã tồn tại hoặc lỗi hệ thống.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}

