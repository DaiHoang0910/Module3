package com.example.quan_ly_san_pham.service.impl;

import com.example.quan_ly_san_pham.model.Product;
import com.example.quan_ly_san_pham.service.IProductService;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/product_manager";
    private String jdbcUsername = "root";
    private String jdbcPassword = "âđđê";

//    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product(name,price,quantity,description) values(?,?,?,?)";
//    private static final String SELECT_ALL_PRODUCT_SQL = "SELECT * FROM product";
//    private static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT id,name,price,quantity,description from product WHERE id=?";
//    private static final String DELETE_PRODUCT_SQL = "DELETE FROM product WHERE id=?";
//    private static final String UPDATE_PRODUCT_SQL = "UPDATE product SET name=?,price=?,quantity=?,description=? WHERE id=?";

    public ProductService() {

    }

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Kiểm tra lại class này
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver không tìm thấy: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối CSDL: " + e.getMessage());
        }
        return connection;
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                products.add(mapResultSetToProduct(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public void saveProduct(Product product) {
        String query = "INSERT INTO products (name, price, quantity, description) VALUES (?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getDescription());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        String query = "DELETE FROM products WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProduct(int id, Product product) {
        String query = "UPDATE products SET name = ?, price = ?, quantity = ?, description = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getDescription());
            statement.setInt(5, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product findProduct(String name) {
        Product product = null;
        String query = "SELECT * FROM products WHERE name LIKE ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, "%" + name + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    product = mapResultSetToProduct(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public Product findProductById(int id) {
        Product product = null;
        String query = "SELECT * FROM products WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    product = mapResultSetToProduct(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    private Product mapResultSetToProduct(ResultSet resultSet) throws SQLException {
        return new Product(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getDouble("price"),
                resultSet.getInt("quantity"),
                resultSet.getString("description")
        );
    }

}
