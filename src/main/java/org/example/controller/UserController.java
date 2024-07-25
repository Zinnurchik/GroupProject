package org.example.controller;

import jakarta.servlet.http.HttpSession;
import org.example.model.UserEntity;
import org.example.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class UserController {
    UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password, HttpSession session) {
        UserEntity user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            if (user.getRole().equals("USER"))
                return "home";
            else
                return "admin_home";
        } else {
            return "login";
        }
    }

    @GetMapping("/register")
    public String getRegisterPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute UserEntity user, HttpSession session) {
        UserEntity userEntity = userService.register(user);
        session.setAttribute("user", userEntity);
        if (userEntity.getRole().equals("USER"))
            return "home";
        else
            return "admin_home";
    }
}