package com.winbet.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import com.winbet.config.Principal;
import com.winbet.dao.IAuthentificationJpaRepository;
import com.winbet.dao.IClientJpaRepository;
import com.winbet.entities.Authentification;
import com.winbet.entities.Client;

@Service
public class LoginService implements UserDetailsService {

    @Autowired
    private IAuthentificationJpaRepository authentificationRepo;

    @Override
    public UserDetails loadUserByUsername(String username)
	    throws UsernameNotFoundException {
	Authentification authentification = authentificationRepo.findByEmail(username);
	if (null == authentification) {
	    throw new UsernameNotFoundException(
		    "No user found with username: " + username);
	}
	return new Principal(authentification);
    }
}
