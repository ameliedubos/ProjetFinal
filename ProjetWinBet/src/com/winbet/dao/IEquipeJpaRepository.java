package com.winbet.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.winbet.entities.Equipe;
import java.util.List;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

public interface IEquipeJpaRepository extends JpaRepository<Equipe, Long>{

	 @Query("select e from Equipe e where e.sport.id = :id")
	    public List<Equipe> findbySport(@Param("id") Long id);
}