package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Authentification;

public interface IAuthentificationJpaRepository extends JpaRepository<Authentification, Long> {

    public Authentification findByEmail(String email);

}
