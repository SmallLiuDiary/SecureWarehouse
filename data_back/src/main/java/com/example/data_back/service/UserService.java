package com.example.data_back.service;

import com.example.data_back.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class UserService {

    private final JdbcTemplate jdbcTemplate;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserService(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }


    public List<User> findAll() {
        String sql = "SELECT * FROM user_warehouse.user";
        return jdbcTemplate.query(sql, new UserRowMapper());
    }

    public User findById(Long id) {
        String sql = "SELECT * FROM user_warehouse.user WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new UserRowMapper());
    }

    public User findByUsername(String username) {
        String sql = "SELECT * FROM user_warehouse.user WHERE username = ?";
        List<User> users = jdbcTemplate.query(sql, new Object[]{username}, new UserRowMapper());
        return users.isEmpty() ? null : users.get(0);
    }

    public void save(User user) {
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        String sql = "INSERT INTO user_warehouse.user (username, password, is_admin, is_enabled, organization) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.isAdmin(), user.isEnabled(), user.getOrganization());
    }

    public void update(User user) {
        String sql = "UPDATE user_warehouse.user SET username = ?, password = ?, is_admin = ?, is_enabled = ?, organization = ? WHERE id = ?";
        jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.isAdmin(), user.isEnabled(), user.getOrganization(), user.getId());
    }

    public void delete(Long id) {
        String sql = "DELETE FROM user_warehouse.user WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }



    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getLong("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setAdmin(rs.getBoolean("is_admin"));
            user.setEnabled(rs.getBoolean("is_enabled"));
            user.setOrganization(rs.getString("organization"));
            return user;
        }
    }

    public void saveUser(User user) {
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        // 保存用户到数据库的代码（省略）
    }

    public boolean checkPassword(String rawPassword, String encodedPassword) {
        System.out.println(rawPassword);
        System.out.println(encodedPassword);
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }
}