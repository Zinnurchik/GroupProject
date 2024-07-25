package org.example.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.example.model.UserEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public class UserRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public UserEntity add(UserEntity built) {
        entityManager.persist(built);
        System.out.println(built);
        return built;
    }

    @Transactional
    public Optional<UserEntity> findByUserName(String username) {
        TypedQuery<UserEntity> query = entityManager.createQuery(
                "select u from UserEntity u where u.username = ?1", UserEntity.class
        );
        List<UserEntity> resultList = query.setParameter(1, username).getResultList();
        if(!resultList.isEmpty()){
            UserEntity userEntity = resultList.get(0);
            return Optional.of(userEntity);
        }
        return Optional.empty();
    }
}
