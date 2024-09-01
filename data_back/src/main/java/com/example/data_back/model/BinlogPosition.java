package com.example.data_back.model;

public class BinlogPosition {
    private String filename;
    private long position;

    public BinlogPosition(String filename, long position) {
        this.filename = filename;
        this.position = position;
    }

    public String getFilename() {
        return filename;
    }

    public long getPosition() {
        return position;
    }
}