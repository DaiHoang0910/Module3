package com.example.test.service.impl;

import com.example.test.model.Product;
import com.example.test.repository.ProductRepository;
import com.example.test.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private static final ProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> getAll() {
        return productRepository.getProducts();
    }
}
