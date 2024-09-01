package com.example.data_back.controller;

import com.example.data_back.model.User;
import com.example.data_back.model.UserDTO;
import com.example.data_back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public List<UserDTO> getAllUsers() {
        List<User> users = userService.findAll();
        return users.stream().map(this::convertToDto).collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable Long id) {
        User user = userService.findById(id);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        return ResponseEntity.ok(convertToDto(user));
    }

    @PostMapping
    public ResponseEntity<UserDTO> createUser(@RequestBody UserDTO userDto) {
        User user = convertToEntity(userDto);
        userService.save(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(convertToDto(user));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> updateUser(@PathVariable Long id, @RequestBody UserDTO userDto) {
        User existingUser = userService.findById(id);
        if (existingUser == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        userDto.setId(id);
        User updatedUser = convertToEntity(userDto);
        userService.update(updatedUser);
        return ResponseEntity.ok(convertToDto(updatedUser));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userService.delete(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    private UserDTO convertToDto(User user) {
        UserDTO userDto = new UserDTO();
        userDto.setId(user.getId());
        userDto.setUsername(user.getUsername());
        userDto.setAdmin(user.isAdmin());
        userDto.setEnabled(user.isEnabled());
        userDto.setOrganization(user.getOrganization());
        // 不返回密码
        return userDto;
    }

    private User convertToEntity(UserDTO userDto) {
        User user = new User();
        user.setId(userDto.getId());
        user.setUsername(userDto.getUsername());
        user.setPassword(userDto.getPassword()); // 只有在创建和更新时使用
        user.setAdmin(userDto.isAdmin());
        user.setEnabled(userDto.isEnabled());
        user.setOrganization(userDto.getOrganization());
        return user;
    }
}
