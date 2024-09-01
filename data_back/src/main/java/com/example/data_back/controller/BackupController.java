package com.example.data_back.controller;

import com.example.data_back.service.BackupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.sql.SQLException;

@RestController
public class BackupController {
    @Autowired
    private BackupService backupService;

    @PostMapping("/api/backup/full/{dbName}")
    public ResponseEntity<String> performFullBackup(@PathVariable String dbName) {
        try {
            backupService.performFullBackup(dbName);

            return ResponseEntity.ok("Full backup performed successfully");
        } catch (IOException | InterruptedException e) {
            return ResponseEntity.status(500).body("Error performing full backup: " + e.getMessage());
        }
    }

    @PostMapping("/api/backup/incremental/{dbName}")
    public ResponseEntity<String> performIncrementalBackup(@PathVariable String dbName) {
        try {
            backupService.performIncrementalBackup(dbName);
            return ResponseEntity.ok("Incremental backup performed successfully");
        } catch (IOException e) {
            return ResponseEntity.status(500).body("Error performing incremental backup: " + e.getMessage());
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
