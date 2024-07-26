package org.example.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.example.model.CustomerEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public class CustomerRepository {
    @PersistenceContext
    EntityManager entityManager;
    public List<CustomerEntity> getAllCustomers() {
        String jpql = "SELECT c FROM CustomerEntity c";
        TypedQuery<CustomerEntity> query = entityManager.createQuery(jpql, CustomerEntity.class);
        return query.getResultList();
    }

    public CustomerEntity getCustomerById(UUID id) {
        return entityManager.find(CustomerEntity.class, id);
    }
}
