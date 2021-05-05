package com.ogya.hilal.service;

import javax.validation.Valid;

import com.ogya.hilal.model.User;

public interface UserService {
	public User findUserByEmail(String email);
	public void saveUser(@Valid User user);
}
