package com.example.test.controller;

import com.example.test.model.Product;
import com.example.test.repository.ProductRepository;
import com.example.test.service.IProductService;
import com.example.test.service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "productController", urlPatterns = "/products")
public class ProductController extends HttpServlet {
    private static final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                showProductPage(req, resp);
                break;
            default:
                showProductPage(req, resp);
                break;
        }
    }

    private void showProductPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getAll();
        req.setAttribute("products", products);

        RequestDispatcher dispatcher = req.getRequestDispatcher("product.jsp");
        dispatcher.forward(req, resp);
    }
}
