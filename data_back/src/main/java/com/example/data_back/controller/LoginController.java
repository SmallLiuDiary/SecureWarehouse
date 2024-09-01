package com.example.data_back.controller;

import com.example.data_back.model.LoginForm;
import com.example.data_back.model.User;
import com.example.data_back.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private UserHistoryController userHistoryService;

    @PostMapping("/api/login")
    public ResponseEntity<?> login(@RequestBody LoginForm loginForm, HttpServletRequest request) {
        User user = userService.findByUsername(loginForm.getUsername());
        if (user == null) {
            logger.info("登录尝试失败，用户不存在: " + loginForm.getUsername());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
        }
        if (!userService.checkPassword(loginForm.getPassword(), user.getPassword())) {
            logger.info("登录尝试失败，密码错误: " + loginForm.getUsername());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid username or password");
        }
        if (!user.isEnabled()) {
            logger.info("登录尝试失败，用户账户被禁用: " + loginForm.getUsername());
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Account is disabled");
        }
        logger.info("用户登录成功: " + loginForm.getUsername());

        // 将用户组织信息存储在会话中
        request.getSession().setAttribute("organization", user.getOrganization());

        userHistoryService.recordLogin(user.getUsername(), user.isAdmin(),user.getOrganization());
        // 返回用户组织信息
        Map<String, Object> response = new HashMap<>();
        response.put("organization", user.getOrganization());
        response.put("redirectUrl", user.isAdmin() ? "/admin" : "/home");

        return ResponseEntity.ok(response);
    }
}
