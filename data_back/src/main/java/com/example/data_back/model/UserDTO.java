package com.example.data_back.model;

public class UserDTO {
    private Long id;
    private String username;
    private String password;
    private boolean isAdmin;
    private boolean isEnabled;
    private String organization;

    // Getters and Setters
    // 注意：如果不需要返回密码，可以省略 getPassword 和 setPassword 方法
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
