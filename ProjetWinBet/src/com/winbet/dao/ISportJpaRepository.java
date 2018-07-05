package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Sport;

public interface ISportJpaRepository extends JpaRepository<Sport, Long> {

}
