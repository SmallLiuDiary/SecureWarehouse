package com.example.data_back.controller;

import com.example.data_back.model.BackupHistory;

import com.example.data_back.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/backup-history")
public class BackupHistoryController {
    @Autowired
    private WarehouseService warehouseService;

    @GetMapping("/{warehouseName}")
    public ResponseEntity<List<BackupHistory>> getBackupHistoryByWarehouse(@PathVariable String warehouseName) {
        List<BackupHistory> histories = warehouseService.getBackupHistory(warehouseName);
       // System.out.println(histories);
        return ResponseEntity.ok(histories);
    }
}