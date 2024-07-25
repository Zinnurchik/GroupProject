package org.example.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@ToString
@MappedSuperclass
public abstract class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    protected UUID id;
    @CreationTimestamp
    @Column(updatable = false, columnDefinition = "timestamp default current_timestamp")
    protected LocalDateTime createdDate;
    @UpdateTimestamp
    @Column(columnDefinition = "timestamp default current_timestamp")
    protected LocalDateTime updatedDate;
}
