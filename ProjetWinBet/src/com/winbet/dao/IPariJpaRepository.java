package com.winbet.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.winbet.entities.Pari;

public interface IPariJpaRepository extends JpaRepository<Pari, Long> {
	
	public List<Pari> findByClientId(Long id);

}
