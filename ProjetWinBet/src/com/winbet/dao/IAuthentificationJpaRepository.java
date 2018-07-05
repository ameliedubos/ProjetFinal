package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Authentification;

public interface IAuthentificationJpaRepository extends JpaRepository<Authentification, Long> {

    // Requete derivee = findBy + attribut de l'entite
    public Authentification findByEmail(String email);

}
