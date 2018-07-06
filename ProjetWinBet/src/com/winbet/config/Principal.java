package com.winbet.config;

import java.util.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.winbet.entities.Admin;
import com.winbet.entities.Authentification;
import com.winbet.entities.Client;

public class Principal implements UserDetails {

    private static final long serialVersionUID = -5270061614463868043L;

    private Authentification authentification;

    private Admin admin;

    private Client client;

    public Principal(Admin admin) {
	this.authentification = admin.getAuthentification();
	this.admin = admin;
    }

    public Principal(Client client) {
	this.authentification = client.getAuthentification();
	this.client = client;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
	Collection<GrantedAuthority> authorities = new ArrayList<>();
	authorities.add(new SimpleGrantedAuthority(authentification.getRole().name()));
	return authorities;
    }

    @Override
    public String getPassword() {
	return authentification.getMotDePasse();
    }

    @Override
    public String getUsername() {
	return authentification.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
	return true;
    }

    @Override
    public boolean isAccountNonLocked() {
	return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
	return true;
    }

    @Override
    public boolean isEnabled() {
	return true;
    }

    public boolean isAdministrateur() {
	return null != admin;
    }

    public Client getClient() {
	return client;
    }

    public Admin getAdmin() {
	return admin;
    }

    public Authentification getAuthentification() {
	return authentification;
    }
}
