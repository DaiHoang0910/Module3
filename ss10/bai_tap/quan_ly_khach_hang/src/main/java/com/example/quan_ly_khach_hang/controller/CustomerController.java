package com.example.quan_ly_khach_hang.controller;

import com.example.quan_ly_khach_hang.model.Customer;
import com.example.quan_ly_khach_hang.service.ICustomerService;
import com.example.quan_ly_khach_hang.service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "customerController", urlPatterns = "/customers")
public class CustomerController extends HttpServlet {
    private static ICustomerService iCustomerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<Customer> products = iCustomerService.getAll();
        req.setAttribute("customers", products);
        req.getRequestDispatcher("/WEB-INF/view/list.jsp").forward(req, resp);
    }
}
