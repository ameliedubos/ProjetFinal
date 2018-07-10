package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Pari;

public interface IPariJpaRepository extends JpaRepository<Pari, Long> {

}
