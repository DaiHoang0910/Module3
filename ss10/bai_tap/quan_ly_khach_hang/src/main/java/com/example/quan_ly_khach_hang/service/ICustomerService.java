package com.example.quan_ly_khach_hang.service;

import java.util.List;

public interface ICustomerService<T> {
    List<T> getAll();
}
