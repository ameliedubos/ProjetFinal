package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Admin;

public interface IAdminJpaRepository extends JpaRepository<Admin, Long> {

    public Admin findByAuthentificationEmail(String username);

}
