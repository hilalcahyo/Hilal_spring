package com.ogya.hilal.service.impl;

import java.util.Arrays;
import java.util.HashSet;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ogya.hilal.model.Role;
import com.ogya.hilal.model.User;
import com.ogya.hilal.repository.RoleRepository;
import com.ogya.hilal.repository.UserRepository;
import com.ogya.hilal.service.UserService;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	 
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	 
	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public void saveUser(@Valid User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		  Role userRole = roleRepository.findByRole("SUPERUSER");
		  user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
		  userRepository.save(user);
	}

}
