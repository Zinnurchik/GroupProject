package org.example.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.example.model.CustomerEntity;
import org.example.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/customers")
public class CustomerController {

    private final CustomerService customerService;
    public CustomerController(CustomerService customerService){
        this.customerService = customerService;
    }
    @GetMapping
    public String getCustomerPage(HttpServletRequest httpServletRequest){
        List<CustomerEntity> allCustomers = customerService.getAllCustomers();
        httpServletRequest.setAttribute("customers", allCustomers);
        return "customers";
    }

    @GetMapping("/view")
    public String getCustomerProfile(@RequestParam("id") UUID id, HttpServletRequest request){
        CustomerEntity customerEntity = customerService.getCustomerById(id);
        request.setAttribute("customer", customerEntity);
        return "customer_profile";
    }
}
