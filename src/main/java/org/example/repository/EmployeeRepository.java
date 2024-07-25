package org.example.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.example.model.EmployeeEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class EmployeeRepository {
    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public EmployeeEntity findByEmployeeName(String username) {
        TypedQuery<EmployeeEntity> query = entityManager.createQuery(
                "select u from EmployeeEntity u where u.username = ?1",EmployeeEntity.class
        );
        return query.setParameter(1, username).getSingleResult();
    }
}
