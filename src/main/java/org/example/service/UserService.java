package org.example.service;
import org.example.model.UserEntity;
import org.example.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    UserRepository userRepository;

    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }

    public UserEntity login(String username, String password) {
        Optional<UserEntity> user = userRepository.findByUserName(username);
        return user.orElse(null);
    }

    public UserEntity register(UserEntity userEntity) {
        return userRepository.add(userEntity);
    }
}
