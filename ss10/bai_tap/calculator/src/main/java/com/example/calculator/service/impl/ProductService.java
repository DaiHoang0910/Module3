package com.example.calculator.service.impl;

import com.example.calculator.model.Product;
import com.example.calculator.repository.ProductRepositoty;
import com.example.calculator.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private static final ProductRepositoty productRepositoty = new ProductRepositoty();
    @Override
    public List<Product> getAll() {
        return productRepositoty.getAll();
    }
}
