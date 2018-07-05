package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Client;

public interface IClientJpaRepository extends JpaRepository<Client, Long> {

}
