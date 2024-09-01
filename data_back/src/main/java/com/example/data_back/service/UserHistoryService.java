package com.example.data_back.service;

import com.example.data_back.model.UserHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class UserHistoryService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void recordLogin(String username, boolean isAdmin,String organization) {
        String sql = "INSERT INTO user_warehouse.user_history (username, is_admin,organization, login_time) VALUES (?, ?, ?,?)";
        jdbcTemplate.update(sql, username, isAdmin, organization,LocalDateTime.now());
    }

    public List<UserHistory> getUserHistory() {
        String sql = "SELECT * FROM user_warehouse.user_history ORDER BY login_time DESC";
        return jdbcTemplate.query(sql, new RowMapper<UserHistory>() {
            @Override
            public UserHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
                UserHistory history = new UserHistory();
                history.setId(rs.getInt("id"));
                history.setUsername(rs.getString("username"));
                history.setAdmin(rs.getBoolean("is_admin"));
                history.setOrganization(rs.getString("organization"));
                history.setLoginTime(rs.getTimestamp("login_time").toLocalDateTime());
                return history;
            }
        });
    }
}