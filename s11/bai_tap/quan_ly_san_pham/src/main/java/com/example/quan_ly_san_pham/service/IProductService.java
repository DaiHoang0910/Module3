package com.example.quan_ly_san_pham.service;

import com.example.quan_ly_san_pham.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    List<Product> getAllProducts() throws SQLException;

    void saveProduct(Product product);

    void deleteProduct(int id);

    void updateProduct(int id, Product product);

    Product findProduct(String name);

    Product findProductById(int id);
}
