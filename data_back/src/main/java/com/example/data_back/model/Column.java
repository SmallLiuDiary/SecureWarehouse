package com.example.data_back.model;

public class Column {
    private String name;
    private String type;
    private boolean notNull;

    // Constructor
    public Column(String name, String type, boolean notNull) {
        this.name = name;
        this.type = type;
        this.notNull = notNull;
    }

    // Getters
    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public boolean isNotNull() {
        return notNull;
    }

    // Setters
    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setNotNull(boolean notNull) {
        this.notNull = notNull;
    }
}
