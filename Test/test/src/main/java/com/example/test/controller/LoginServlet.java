package com.example.test.controller;

import com.example.test.model.User;
import com.example.test.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private final UserRepository userRepository = new UserRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userRepository.findByEmailAndPassword(email, password);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("products?action=view");
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}

