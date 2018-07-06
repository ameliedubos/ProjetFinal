package com.winbet.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

@Entity
public class Client {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message = "{error.client.obligatoire}")
	private String nom;
	@NotEmpty(message = "{error.client.obligatoire}")
	private String prenom;
	@OneToOne(cascade=CascadeType.ALL)
	private Authentification authentification;
	@NotEmpty(message = "{error.client.obligatoire}")
	private String age;
	@Embedded
	private Adresse adresse;
	private String telephone;
	@OneToMany
	private List<Sport> listeSport;
	// @NotEmpty(message = "{error.client.obligatoire}")
	@Min(value=0 , message = "{error.client.obligatoire}")
	private int montantMax;
	
	public Client() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Authentification getAuthentification() {
		return authentification;
	}

	public void setAuthentification(Authentification authentification) {
		this.authentification = authentification;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Adresse getAdresse() {
		return adresse;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public List<Sport> getListeSport() {
		return listeSport;
	}

	public void setListeSport(List<Sport> listeSport) {
		this.listeSport = listeSport;
	}

	public int getMontantMax() {
		return montantMax;
	}

	public void setMontantMax(int montantMax) {
		this.montantMax = montantMax;
	}

	public String toString() {
		return "Client [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", authentification=" + authentification
				+ ", age=" + age + ", adresse=" + adresse + ", telephone=" + telephone + ", listeSport=" + listeSport
				+ ", montantMax=" + montantMax + "]";
	}    

}
