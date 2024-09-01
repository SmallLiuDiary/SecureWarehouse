package com.example.data_back.model;

public class User {
    private Long id;
    private String username;
    private String password;
    private boolean isAdmin;
    private boolean isEnabled;
    private String organization;

    // Getters
    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    public String getOrganization() {
        return organization;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public void setEnabled(boolean enabled) {
        isEnabled = enabled;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }
}
