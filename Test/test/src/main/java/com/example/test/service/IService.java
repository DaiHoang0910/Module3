package com.example.test.service;

import java.util.List;

public interface IService<T> {
    List<T> getAll();
}
