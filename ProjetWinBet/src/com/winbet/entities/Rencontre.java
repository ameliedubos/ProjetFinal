package com.winbet.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Rencontre {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	private Equipe equipe1;
	@OneToOne
	private Equipe equipe2;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateDebut;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateFin;
	//@NotEmpty(message = "{error.admin.score}")
	private String score;
	private String cote1;
	private String cote2;
	private Long vainqueur;

	public Rencontre() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Equipe getEquipe1() {
		return equipe1;
	}

	public void setEquipe1(Equipe equipe1) {
		this.equipe1 = equipe1;
	}

	public Equipe getEquipe2() {
		return equipe2;
	}

	public void setEquipe2(Equipe equipe2) {
		this.equipe2 = equipe2;
	}

	public Date getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public String getCote1() {
		return cote1;
	}

	public void setCote1(String cote1) {
		this.cote1 = cote1;
	}

	public String getCote2() {
		return cote2;
	}

	public void setCote2(String cote2) {
		this.cote2 = cote2;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Long getVainqueur() {
		return vainqueur;
	}

	public void setVainqueur(Long vainqueur) {
		this.vainqueur = vainqueur;
	}

	public String toString() {
		return "Rencontre [id=" + id + ", equipe1=" + equipe1 + ", equipe2=" + equipe2 + ", dateDebut=" + dateDebut
				+ ", dateFin=" + dateFin + ", score=" + score + ", cote1=" + cote1 + ", cote2=" + cote2 + ", vainqueur="
				+ vainqueur + "]";
	}

}
