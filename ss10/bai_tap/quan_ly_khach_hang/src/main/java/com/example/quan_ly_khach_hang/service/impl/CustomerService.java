package com.example.quan_ly_khach_hang.service.impl;

import com.example.quan_ly_khach_hang.model.Customer;
import com.example.quan_ly_khach_hang.repository.CustomerRepository;
import com.example.quan_ly_khach_hang.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private static final CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> getAll() {
        return customerRepository.getAll();
    }
}
