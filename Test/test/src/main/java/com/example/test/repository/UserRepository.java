package com.example.test.repository;

import com.example.test.model.User;

import java.sql.*;

public class UserRepository {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/your_database_name";
    private final String jdbcUsername = "your_username";
    private final String jdbcPassword = "your_password";

    public void save(User user) throws SQLException {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.executeUpdate();
        }
    }

    public User findByEmailAndPassword(String email, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new User(rs.getString("name"), rs.getString("email"), rs.getString("password"));
            }
        }
        return null;
    }
}
