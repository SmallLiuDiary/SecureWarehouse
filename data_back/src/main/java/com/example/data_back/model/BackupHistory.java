package com.example.data_back.model;

import com.example.data_back.Type.BackupStatus;
import com.example.data_back.Type.BackupType;
import jakarta.persistence.*;

import java.util.Date;
@Entity
@Table(name = "backup_history")
public class BackupHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @jakarta.persistence.Column(name = "warehouse_name")
    public String warehouseName;

    @jakarta.persistence.Column(name = "backup_type")
    @Enumerated(EnumType.STRING)
    public BackupType backupType;

    @jakarta.persistence.Column(name = "backup_time")
    @Temporal(TemporalType.TIMESTAMP)
    public Date backupTime;

    @jakarta.persistence.Column(name = "status")
    @Enumerated(EnumType.STRING)
    public BackupStatus status;

    // Getters and Setters
    public BackupHistory() {
    }

    public BackupHistory(Long id, String warehouseName, BackupType backupType, Date backupTime, BackupStatus status) {
        this.id = id;
        this.warehouseName = warehouseName;
        this.backupType = backupType;
        this.backupTime = backupTime;
        this.status = status;
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public BackupType getBackupType() {
        return backupType;
    }

    public Date getBackupTime() {
        return backupTime;
    }

    public BackupStatus getStatus() {
        return status;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public void setBackupType(BackupType backupType) {
        this.backupType = backupType;
    }

    public void setBackupTime(Date backupTime) {
        this.backupTime = backupTime;
    }

    public void setStatus(BackupStatus status) {
        this.status = status;
    }
}