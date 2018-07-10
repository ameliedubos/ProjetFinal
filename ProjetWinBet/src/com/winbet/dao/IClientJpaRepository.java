package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.winbet.entities.Client;

public interface IClientJpaRepository extends JpaRepository<Client, Long> {

    public Client findByAuthentificationEmail(String email);
    
    @Query("select c from Client c where c.id <> :id and c.authentification.email = :email")
    public Client findClientByIdNotAndAuthentificationEmail(@Param("email") String email, @Param("id") Long id);

}
