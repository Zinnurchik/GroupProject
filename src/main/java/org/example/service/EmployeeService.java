package org.example.service;
import jakarta.servlet.http.HttpSession;
import org.example.model.EmployeeEntity;
import org.example.repository.EmployeeRepository;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    EmployeeRepository employeeRepository;

    public EmployeeService(EmployeeRepository employeeRepository){
        this.employeeRepository = employeeRepository;
    }

    public String  login(String username, String password, HttpSession session) {
        EmployeeEntity employee = employeeRepository.findByEmployeeName(username);
        if (employee.getPassword().equals(password)){
            session.setAttribute("employee", employee);
            return employee.getRole();
        }
        return null;
    }
}
