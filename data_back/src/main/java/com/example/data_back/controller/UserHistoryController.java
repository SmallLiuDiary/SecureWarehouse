package com.example.data_back.controller;

import com.example.data_back.model.UserHistory;
import com.example.data_back.service.UserHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserHistoryController {

    @Autowired
    private UserHistoryService userHistoryService;

    @GetMapping("/api/user-history")
    public List<UserHistory> getUserHistory() {
        return userHistoryService.getUserHistory();
    }

    public void recordLogin(String username, boolean isAdmin, String organization) {
        userHistoryService.recordLogin(username,isAdmin,organization);
    }
}