package org.example.service;

import org.example.model.CustomerEntity;
import org.example.repository.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class CustomerService {
    private final CustomerRepository customerRepository;
    public CustomerService(CustomerRepository customerRepository){
        this.customerRepository = customerRepository;
    }

    public List<CustomerEntity> getAllCustomers(){
        return customerRepository.getAllCustomers();
    }

    public CustomerEntity getCustomerById(UUID id) {
        return customerRepository.getCustomerById(id);
    }
}
