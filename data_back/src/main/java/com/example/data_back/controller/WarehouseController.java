package com.example.data_back.controller;

import com.example.data_back.Crypto.CryptoUtil;
import com.example.data_back.model.TableRequest;
import com.example.data_back.model.Warehouse;
import com.example.data_back.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class WarehouseController {

    @Autowired
    private WarehouseService warehouseService;

    @PostMapping("/api/warehouses")
    public ResponseEntity<String> createWarehouse(@RequestBody Warehouse warehouse) {
        try {
            warehouseService.createWarehouse(warehouse);
            return ResponseEntity.ok("Warehouse created successfully.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error creating warehouse: " + e.getMessage());
        }
    }
    @GetMapping("/api/getwarehouses")
    public ResponseEntity<List<String>> listWarehouses() {
        try {
            List<String> warehouses = warehouseService.listWarehouses();
            //System.out.println(warehouses);
            return ResponseEntity.ok(warehouses);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    @DeleteMapping("/api/deletewarehouses/{name}")
    public ResponseEntity<String> deleteWarehouse(@PathVariable String name) {
        try {
            warehouseService.deleteWarehouse(name);
            return ResponseEntity.ok("Warehouse deleted successfully.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error deleting warehouse: " + e.getMessage());
        }
    }
    @GetMapping("/api/warehouses/{dbName}/tables")
    public ResponseEntity<List<String>> getTables(@PathVariable String dbName) {
        try {
            List<String> tables = warehouseService.getTables(dbName);
            return ResponseEntity.ok(tables);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

//    @PostMapping("/api/warehouses/{dbName}/tables/{tableName}")
//    public ResponseEntity<String> createTable(@PathVariable String dbName, @PathVariable String tableName) {
//        try {
//            warehouseService.createTable(dbName, tableName);
//            return ResponseEntity.ok("Table created successfully.");
//        } catch (Exception e) {
//            return ResponseEntity.badRequest().body("Error creating table: " + e.getMessage());
//        }
//    }

    @PostMapping("/api/warehouses/{dbName}/tables")
    public ResponseEntity<String> createTable(@PathVariable String dbName, @RequestBody TableRequest request) {
        try {
            //System.out.println(request.getTableName());
            warehouseService.createTable(dbName, request.getTableName(), request.getColumns());
            return ResponseEntity.ok("Table created successfully.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error creating table: " + e.getMessage());
        }
    }
    @DeleteMapping("/api/warehouses/{dbName}/tables/{tableName}")
    public ResponseEntity<String> deleteTable(@PathVariable String dbName, @PathVariable String tableName) {
        try {
            warehouseService.deleteTable(dbName, tableName);
            return ResponseEntity.ok("Table deleted successfully.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error deleting table: " + e.getMessage());
        }
    }
    @GetMapping("/api/warehouses/{dbName}/tables/{tableName}")
    public ResponseEntity<?> getTableDetails(@PathVariable String dbName, @PathVariable String tableName) {
        try {
            Map<String, Object> details = warehouseService.getTableDetails(dbName, tableName);
            return ResponseEntity.ok(details);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error retrieving table details: " + e.getMessage());
        }
    }
    @PostMapping("/api/warehouses/{dbName}/tables/{tableName}/data")
    public ResponseEntity<String> insertData(@PathVariable String dbName, @PathVariable String tableName, @RequestBody Map<String, String> rowData) {
        try {
            Map<String, String> encryptedData = new HashMap<>();
            for (Map.Entry<String, String> entry : rowData.entrySet()) {
                encryptedData.put(entry.getKey(), CryptoUtil.encrypt(entry.getValue()));
            }
            warehouseService.insertData(dbName, tableName, encryptedData);
            return ResponseEntity.ok("Data inserted successfully.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error inserting data: " + e.getMessage());
        }
    }

    @GetMapping("/api/warehouses/{dbName}/stats")
    public ResponseEntity<?> getDatabaseStats(@PathVariable String dbName) {
        try {
            Map<String, Object> stats = warehouseService.getDatabaseStats(dbName);
            return ResponseEntity.ok(stats);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error retrieving database stats: " + e.getMessage());
        }
    }
}