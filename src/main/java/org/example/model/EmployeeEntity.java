package org.example.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "employees")
@ToString(callSuper = true)
public class EmployeeEntity extends BaseEntity {
    private String name;
    private String surname;
    @Column(unique = true)
    private String username;
    private String password;
    private Boolean isDeleted = false;
    private String role;
}
