package org.example.controller;

import jakarta.servlet.http.HttpSession;
import org.example.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
    EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password, HttpSession session) {
        String employeeStatus = employeeService.login(username, password, session);
        switch (employeeStatus){
            case "ADMIN" -> {
                return "admin_home";
            }
            default -> throw new IllegalStateException("Unexpected value: " + employeeStatus);
        }
    }

//    @GetMapping("/register")
//    public String getRegisterPage() {
//        return "register";
//    }
//
//    @PostMapping("/register")
//    public String register(@ModelAttribute UserEntity user, HttpSession session) {
//        UserEntity userEntity = userService.register(user);
//        session.setAttribute("user", userEntity);
//        if (userEntity.getRole().equals("USER"))
//            return "home";
//        else
//            return "admin_home";
//    }
}