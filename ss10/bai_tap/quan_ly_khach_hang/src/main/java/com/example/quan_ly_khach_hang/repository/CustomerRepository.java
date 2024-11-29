package com.example.quan_ly_khach_hang.repository;

import com.example.quan_ly_khach_hang.model.Customer;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {
    private static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer(1, "Mai Văn Hoàn", LocalDate.of(1983, 8, 20), "Hà Nội", "https://i.pinimg.com/736x/b1/3e/7a/b13e7aa3d557780f8fd5ad2271014c82.jpg"));
        customers.add(new Customer(2, "Nguyễn Văn Nam", LocalDate.of(1983, 8, 21), "Bắc Giang", "https://i.pinimg.com/736x/b1/3e/7a/b13e7aa3d557780f8fd5ad2271014c82.jpg"));
        customers.add(new Customer(3, "Nguyễn Thái Hòa", LocalDate.of(1983, 8, 22), "Nam Định", "https://i.pinimg.com/736x/b1/3e/7a/b13e7aa3d557780f8fd5ad2271014c82.jpg"));
        customers.add(new Customer(4, "Trần Đăng Khoa", LocalDate.of(1983, 8, 17), "Hà Tây", "https://i.pinimg.com/736x/b1/3e/7a/b13e7aa3d557780f8fd5ad2271014c82.jpg"));
        customers.add(new Customer(5, "Nguyễn Đình Thi", LocalDate.of(1983, 8, 19), "Hà Nội", "https://i.pinimg.com/736x/b1/3e/7a/b13e7aa3d557780f8fd5ad2271014c82.jpg"));
    }
    public List<Customer> getAll() {
        return customers;
    }
}
