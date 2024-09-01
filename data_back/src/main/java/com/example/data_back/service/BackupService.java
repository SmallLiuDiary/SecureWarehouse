package com.example.data_back.service;

import com.example.data_back.model.BinlogPosition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class BackupService {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public BackupService(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void performFullBackup(String dbName) throws IOException, InterruptedException {
        String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String backupFileName = dbName + "_full_backup_" + timestamp + ".sql";
        String backupFilePath = System.getProperty("user.dir") + "/backups/" + backupFileName;

        createBackupDirectoryIfNeeded(backupFilePath);

        ProcessBuilder processBuilder = new ProcessBuilder(
                "mysqldump", "-u", "root", "-p" + "123456", "--databases", dbName,
                "--single-transaction", "--flush-logs", "--master-data=2", "-r", backupFilePath
        );
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        }

        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new IOException("Error performing full backup, exit code: " + exitCode);
        }

        System.out.println("Full backup completed successfully for database: " + dbName);
        afterFullBackupActions(dbName);
        recordBackupHistory(dbName,"full","success");
    }

    public void performIncrementalBackup(String dbName) throws IOException, InterruptedException {
        // 先获取上次备份的二进制日志信息
        BinlogPosition lastPosition = getLastBinlogPosition(dbName);
        // 获取当前的二进制日志信息
        BinlogPosition currentPosition = getCurrentBinlogPosition();

        if (lastPosition == null || currentPosition == null) {
            throw new IllegalStateException("Cannot retrieve binlog positions for incremental backup.");
        }

        String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String backupFileName = dbName + "_incremental_backup_" + timestamp + ".sql";
        String backupFilePath = System.getProperty("user.dir") + "/backups/" + backupFileName;

        createBackupDirectoryIfNeeded(backupFilePath);

        ProcessBuilder processBuilder = new ProcessBuilder(
                "mysqlbinlog",
                "--start-position=" + lastPosition.getPosition(),
                "--stop-position=" + currentPosition.getPosition(),
                "--host=localhost",
                "--port=3306",
                "--user=" + "root",
                "--password=" + "123456",
                lastPosition.getFilename(),
                "-r", backupFilePath
        );
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        }

        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new IOException("Error performing incremental backup, exit code: " + exitCode);
        }

        // 更新数据库中记录的最新二进制日志位置
        updateLastBinlogPosition(dbName, currentPosition);
        System.out.println("Incremental backup completed successfully for database: " + dbName);
        recordBackupHistory(dbName,"incremental","success");
    }


    private void createBackupDirectoryIfNeeded() {
        String backupDirPath = System.getProperty("user.dir") + "/backups";
        File backupDir = new File(backupDirPath);
        if (!backupDir.exists()) {
            backupDir.mkdirs();
        }
    }

    private void recordBackupHistory(String dbName, String backupType, String status) {
        jdbcTemplate.update(
                "INSERT INTO history_warehouse.backup_history (warehouse_name, backup_type, backup_time, status) VALUES (?, ?, ?, ?)",
                dbName, backupType, new Date(), status
        );
    }
    private String getLastBinlogFile(String dbName) {
        return jdbcTemplate.queryForObject(
                "SELECT binlog_file FROM history_warehouse.binlog_backup_info WHERE database_name = ? ORDER BY backup_time DESC LIMIT 1",
                new Object[]{dbName},
                String.class
        );
    }

    private void recordBinlogBackupInfo(String dbName, String binlogFile) {
        jdbcTemplate.update(
                "INSERT INTO history_warehouse.binlog_backup_info (database_name, binlog_file, backup_time) VALUES (?, ?, ?)",
                dbName, binlogFile, new Date()
        );
    }
    private String getCurrentBinlogFile() throws SQLException {
        return jdbcTemplate.queryForObject(
                "SHOW MASTER STATUS",
                (ResultSet rs, int rowNum) -> rs.getString("File")
        );
    }
    public BinlogPosition getLastBinlogPosition(String dbName) {
        return jdbcTemplate.queryForObject(
                "SELECT binlog_filename, binlog_position FROM history_warehouse.binlog_control WHERE db_name = ?",
                new Object[]{dbName},
                (rs, rowNum) -> new BinlogPosition(rs.getString("binlog_filename"), rs.getLong("binlog_position"))
        );
    }

    public void updateLastBinlogPosition(String dbName, BinlogPosition position) {
        String filename = "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\" + position.getFilename();
        jdbcTemplate.update(
                "UPDATE history_warehouse.binlog_control SET binlog_filename = ?, binlog_position = ? WHERE db_name = ?",
                filename, position.getPosition(), dbName
        );
    }

    public void recordBinlogInfo(String dbName, String filename, long position) {
        filename = "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\"+filename;

        String sql = "INSERT INTO history_warehouse.binlog_control(db_name, binlog_filename, binlog_position) " +
                "VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE " +
                "binlog_filename = VALUES(binlog_filename), " +
                "binlog_position = VALUES(binlog_position)";

        jdbcTemplate.update(sql, dbName, filename, position);
    }


    private void afterFullBackupActions(String dbName) {
        BinlogPosition position = getCurrentBinlogPosition();
        if (position != null) {
            recordBinlogInfo(dbName, position.getFilename(), position.getPosition());
        } else {
            System.out.println("Failed to retrieve binary log position after full backup.");
        }
    }

    private void createBackupDirectoryIfNeeded(String backupFilePath) {
        File backupDir = new File(backupFilePath).getParentFile();
        if (!backupDir.exists()) {
            backupDir.mkdirs();
        }
    }

    private BinlogPosition getCurrentBinlogPosition() {
        try {
            return jdbcTemplate.queryForObject(
                    "SHOW MASTER STATUS",
                    (rs, rowNum) -> new BinlogPosition(
                            rs.getString("File"),
                            rs.getLong("Position")
                    )
            );
        } catch (Exception e) {
            System.out.println("No binary log information available: " + e.getMessage());
            return null;
        }
    }



}
