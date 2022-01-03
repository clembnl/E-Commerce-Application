package com.educative.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.educative.ecommerce.dto.user.SignInDto;
import com.educative.ecommerce.dto.user.SignInResponseDto;
import com.educative.ecommerce.dto.user.SignUpDto;
import com.educative.ecommerce.dto.user.SignUpResponseDto;
import com.educative.ecommerce.exception.AuthenticationFailException;
import com.educative.ecommerce.exception.CustomException;
import com.educative.ecommerce.service.UserService;

@RequestMapping("user")
@RestController
public class UserController {
	
    @Autowired
    UserService userService;

    @PostMapping("/signup")
    public SignUpResponseDto Signup(@RequestBody SignUpDto signupDto) throws CustomException {
        return userService.signUp(signupDto);
    }

    @PostMapping("/signIn")
    public SignInResponseDto Signup(@RequestBody SignInDto signInDto) throws CustomException, AuthenticationFailException {
        return userService.signIn(signInDto);
    }

}
