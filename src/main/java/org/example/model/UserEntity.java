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
@Table(name = "users")
@ToString(callSuper = true)
public class UserEntity extends BaseEntity {
    private String name;
    @Column(unique = true)
    private String username;
    private String password;
    private Double balance = 2500.0;
    private String role;
}
