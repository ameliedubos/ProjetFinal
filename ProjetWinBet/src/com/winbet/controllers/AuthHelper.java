package com.winbet.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.winbet.entities.Admin;
import com.winbet.entities.Client;
import com.winbet.entities.ERole;

/**
 * Une classe qui facilite l'accès aux informations d'authentification. Aide à
 * récupérer l'utilisateur connecté et son rôle.
 */
public class AuthHelper {

    /**
     * Retourne le rôle de l'utilisateur connecté.
     *
     * @return le role de l'utilisateur connecté
     */
    public static ERole getRole() {
	return getPrincipal().getAuthentification().getRole();
    }

    /**
     * Retourne le client connecté.
     *
     * @return le client connecté ou null
     */
    public static Client getClient() {
	return getPrincipal().getClient();
    }

    /**
     * Retourne l'administrateur connecté.
     *
     * @return l'administrateur connecté ou null
     */
    public static Admin getAdmin() {
	return getPrincipal().getAdmin();
    }

    public static boolean isAuthenticated() {
	boolean authenticated = false;
	Collection<? extends GrantedAuthority> authorities = getAuthorities();
	ERole[] roles = ERole.values();
	List<String> stringRoles = new ArrayList<>();
	for (ERole role : roles) {
	    stringRoles.add(role.name());
	}
	for (GrantedAuthority authority : authorities) {
	    if (stringRoles.contains(authority.getAuthority())) {
		authenticated = true;
		break;
	    }
	}
	return authenticated;
    }

    public static com.winbet.config.Principal getPrincipal() {
	return (com.winbet.config.Principal) getAuthentication().getPrincipal();
    }

    public static Collection<? extends GrantedAuthority> getAuthorities() {
	return getAuthentication().getAuthorities();
    }

    public static Authentication getAuthentication() {
	return SecurityContextHolder.getContext().getAuthentication();
    }
}
