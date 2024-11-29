package com.example.calculator.controller;

import com.example.calculator.model.Product;
import com.example.calculator.service.IProductService;
import com.example.calculator.service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="productController", urlPatterns = "/products")
public class ProductController extends HttpServlet {
    private static IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<Product> products = iProductService.getAll();
        req.setAttribute("products", products);
        req.getRequestDispatcher("webapp/WEB-INF/view_product/list.jsp").forward(req, resp);
    }
}
