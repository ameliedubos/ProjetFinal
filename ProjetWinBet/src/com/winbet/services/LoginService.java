package com.winbet.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import com.winbet.config.Principal;
import com.winbet.dao.IAdminJpaRepository;
import com.winbet.dao.IClientJpaRepository;
import com.winbet.entities.Admin;
import com.winbet.entities.Client;

@Service
public class LoginService implements UserDetailsService {

    @Autowired
    private IClientJpaRepository clientRepo;

    @Autowired
    private IAdminJpaRepository adminRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	Client client = clientRepo.findByAuthentificationEmail(username);
	if (null == client) {
	    Admin admin = adminRepo.findByAuthentificationEmail(username);
	    if (null == admin) {
		throw new UsernameNotFoundException("No user found with username: " + username);
	    }
	    return new Principal(admin);
	}
	return new Principal(client);
    }
}
