package com.example.calculator.repository;

import com.example.calculator.model.Product;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoty {
    private static List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1,"Mai Văn Hoàn", LocalDate.of(1983,8,20),"Hà Nội",""));
        products.add(new Product(2,"Nguyễn Văn Nam", LocalDate.of(1983,8,21),"Bắc Giang",""));
        products.add(new Product(3,"Nguyễn Thái Hòa", LocalDate.of(1983,8,22),"Nam Định",""));
        products.add(new Product(4,"Trần Đăng Khoa", LocalDate.of(1983,8,17),"Hà Tây",""));
        products.add(new Product(5,"Nguyễn Đình Thi", LocalDate.of(1983,8,19),"Hà Nội",""));
    }

    public List<Product> getAll() {
        return products;
    }
}
