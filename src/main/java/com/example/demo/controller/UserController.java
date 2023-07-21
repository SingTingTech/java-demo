package com.example.demo.controller;

import com.example.demo.domain.User;
import com.example.demo.exceptions.NotFound;
import com.example.demo.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("user")
@AllArgsConstructor
public class UserController {

    private final UserRepository userRepository;

    @GetMapping("{userId}")
    public User getUserById(@PathVariable Integer userId){
        Optional<User> user = userRepository.findById(userId);
        return user.orElseThrow(NotFound::new);
    }

}
