package com.example.data_back.service;

import com.example.data_back.Crypto.CryptoUtil;
import com.example.data_back.Type.BackupStatus;
import com.example.data_back.Type.BackupType;
import com.example.data_back.model.BackupHistory;
import com.example.data_back.model.Column;
import com.example.data_back.model.Warehouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class WarehouseService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void createWarehouse(Warehouse warehouse) throws Exception {
        String sql = String.format(
                "CREATE DATABASE `%s` CHARACTER SET %s COLLATE %s;",
                warehouse.getName(), warehouse.getCharset(), warehouse.getCollation()
        );
        jdbcTemplate.execute(sql);
    }

    public List<String> listWarehouses() {
        return jdbcTemplate.query(
                "SHOW DATABASES LIKE 'warehouse%';",
                (rs, rowNum) -> rs.getString(1)
        );
    }

    public void deleteWarehouse(String name) throws Exception {
        String sql = String.format("DROP DATABASE `%s`;", name);
        jdbcTemplate.execute(sql);
    }

    public List<String> getTables(String dbName) {
        return jdbcTemplate.query(
                String.format("SHOW TABLES FROM `%s`;", dbName),
                (rs, rowNum) -> rs.getString(1)
        );
    }

    public void createTable(String dbName, String tableName, List<Column> columns) throws Exception {
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE `").append(dbName).append("`.`").append(tableName).append("` (");
        for (int i = 0; i < columns.size(); i++) {
            Column col = columns.get(i);
            sb.append("`").append(col.getName()).append("` ").append(col.getType());
            if (col.isNotNull()) {
                sb.append(" NOT NULL");
            }
            if (i < columns.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append(");");
        jdbcTemplate.execute(sb.toString());
    }

    public void deleteTable(String dbName, String tableName) {
        jdbcTemplate.execute(String.format("DROP TABLE `%s`.`%s`;", dbName, tableName));
    }

    public Map<String, Object> getTableDetails(String dbName, String tableName) {
        // 获取加密数据
        List<Map<String, Object>> encryptedData = jdbcTemplate.queryForList(String.format("SELECT * FROM `%s`.`%s`;", dbName, tableName));
        // 获取列名
        List<String> columns = jdbcTemplate.query(
                String.format("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '%s' AND TABLE_NAME = '%s';", dbName, tableName),
                (rs, rowNum) -> rs.getString("COLUMN_NAME")
        );

        // 解密数据
        List<Map<String, String>> decryptedData = new ArrayList<>();
        if (!encryptedData.isEmpty()) {
            for (Map<String, Object> row : encryptedData) {
                Map<String, String> decryptedRow = new HashMap<>();
                for (String column : columns) {
                    String encryptedValue = row.get(column) != null ? row.get(column).toString() : null;
                    String decryptedValue = null;
                    try {
                        decryptedValue = encryptedValue != null ? CryptoUtil.decrypt(encryptedValue) : null;
                    } catch (Exception e) {

                        decryptedValue = "Decryption error"; // Optionally return an error message
                    }
                    decryptedRow.put(column, decryptedValue);
                }
                decryptedData.add(decryptedRow);
            }
        }
        System.out.println(encryptedData);
        System.out.println(decryptedData);
        // 准备结果
        Map<String, Object> result = new HashMap<>();
        result.put("columns", columns);
        result.put("data", decryptedData);
        return result;
    }

    // 存储加密数据到数据库
    public void insertData(String dbName, String tableName, Map<String, String> rowData) throws Exception {
        // 加密数据
        Map<String, String> encryptedData = new HashMap<>();
        for (Map.Entry<String, String> entry : rowData.entrySet()) {
            System.out.println(entry.getValue());
            // String encryptedValue = CryptoUtil.encrypt(entry.getValue());
            System.out.println(entry.getValue());
            encryptedData.put(entry.getKey(), entry.getValue());
        }

        // 构建 SQL 语句
        String columnNames = String.join(", ", encryptedData.keySet());
        String placeholders = encryptedData.keySet().stream().map(k -> "?").collect(Collectors.joining(", "));
        String sql = String.format("INSERT INTO `%s`.`%s` (%s) VALUES (%s);", dbName, tableName, columnNames, placeholders);

        // 使用 PreparedStatementSetter 来安全地设置 SQL 参数
        jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                int index = 1;
                for (String value : encryptedData.values()) {
                    ps.setString(index++, value);
                }
            }
        });
    }

    private String buildInsertSql(String dbName, String tableName, Map<String, Object> rowData) {
        String columnNames = String.join(", ", rowData.keySet());
        String placeholders = rowData.keySet().stream().map(k -> "?").collect(Collectors.joining(", "));
        return String.format("INSERT INTO `%s`.`%s` (%s) VALUES (%s);", dbName, tableName, columnNames, placeholders);
    }

    public Map<String, Object> getDatabaseStats(String dbName) {
        // 查询表数量
        Integer tableCount = jdbcTemplate.queryForObject(
                String.format("SELECT COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA = '%s';", dbName),
                Integer.class
        );

        // 查询每个表的大小
        List<Map<String, Object>> tableSizes = jdbcTemplate.queryForList(
                String.format("SELECT TABLE_NAME, ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024, 2) AS SIZE_MB FROM information_schema.TABLES WHERE TABLE_SCHEMA = '%s' ORDER BY SIZE_MB DESC;", dbName)
        );


        return Map.of("tableCount", tableCount, "tableSizes", tableSizes);
    }

    public List<BackupHistory> getBackupHistory(String warehouseName) {
        return jdbcTemplate.query(
                "SELECT * FROM history_warehouse.backup_history WHERE warehouse_name = ?",
                new Object[]{warehouseName},
                (rs, rowNum) -> {
                    try {
                        BackupHistory history = new BackupHistory();
                        history.setId(rs.getLong("id"));
                        history.setWarehouseName(rs.getString("warehouse_name"));
                        history.setBackupType(BackupType.valueOf(rs.getString("backup_type")));
                        history.setBackupTime(rs.getTimestamp("backup_time"));
                        history.setStatus(BackupStatus.valueOf(rs.getString("status")));
                        return history;
                    } catch (SQLException e) {
                        System.out.println("Error mapping row: " + e.getMessage());
                        throw e;
                    }
                }
        );
    }
}