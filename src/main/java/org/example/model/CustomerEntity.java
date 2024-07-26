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
@Table(name = "customers")
@ToString(callSuper = true)
public class CustomerEntity extends BaseEntity{
    private String name;
    private String phone1;
    private String phone2;
    private String address;
    private String source;
    private String language;
    private String type;
    private String about;
    @Column(columnDefinition = "boolean default false")
    private Boolean isDeleted;
}
