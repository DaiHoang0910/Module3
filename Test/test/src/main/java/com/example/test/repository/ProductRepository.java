package com.example.test.repository;

import com.example.test.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    private static List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1, "Camera IP Wifi", 1200000, "Giám sát từ xa, độ phân giải cao", "https://via.placeholder.com/200"));
        products.add(new Product(2, "Camera Hành Trình", 2500000, "Ghi lại hành trình của bạn với chất lượng HD", "https://via.placeholder.com/200"));
        products.add(new Product(3, "Camera Giám Sát", 3000000, "Tăng cường an ninh, bảo vệ ngôi nhà bạn", "https://via.placeholder.com/200"));
        products.add(new Product(4, "Camera Mini", 1500000, "Nhỏ gọn, dễ dàng giấu kín", "https://via.placeholder.com/200"));
        products.add(new Product(5, "Camera Chống Nước", 3200000, "Phù hợp cho môi trường ngoài trời", "https://via.placeholder.com/200"));
        products.add(new Product(6, "Camera PTZ", 5000000, "Xoay 360 độ, phóng to/thu nhỏ", "https://via.placeholder.com/200"));
        products.add(new Product(7, "Camera Nhiệt", 8000000, "Phát hiện nhiệt độ, sử dụng trong công nghiệp", "https://via.placeholder.com/200"));
        products.add(new Product(8, "Camera 4K", 6000000, "Hình ảnh siêu nét với độ phân giải 4K", "https://via.placeholder.com/200"));
        products.add(new Product(9, "Camera Đeo Ngực", 4000000, "Phù hợp cho phóng viên hoặc người điều tra", "https://via.placeholder.com/200"));
        products.add(new Product(10, "Camera Dome", 2200000, "Kiểu dáng hiện đại, dễ lắp đặt trong nhà", "https://via.placeholder.com/200"));
        products.add(new Product(11, "Camera Speed Dome", 7500000, "Quay tốc độ cao, chất lượng tuyệt vời", "https://via.placeholder.com/200"));
        products.add(new Product(12, "Camera Hồng Ngoại", 3800000, "Quan sát ban đêm rõ nét", "https://via.placeholder.com/200"));
    }
    public List<Product> getProducts() {
        return products;
    }
}
