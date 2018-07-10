package com.winbet.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.winbet.entities.Equipe;
import com.winbet.entities.Rencontre;

public interface IRencontreJpaRepository extends JpaRepository<Rencontre, Long>{

	 @Query("select r from Rencontre r where r.dateDebut > :now")
	    public List<Rencontre> findNextEvents(@Param("now") Date now);
}
