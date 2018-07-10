package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.winbet.entities.Authentification;

public interface IAuthentificationJpaRepository extends JpaRepository<Authentification, Long> {

    public Authentification findByEmail(String email);
    
    @Query("select c from Client c where c.id <> :id and c.authentification.email = :email")
    public Authentification findAuthentificationByIdNotAndAuthentificationEmail(@Param("email") String email, @Param("id") Long AuthentificationId);

}
