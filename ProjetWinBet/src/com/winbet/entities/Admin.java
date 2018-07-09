package com.winbet.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String prenom;

    @OneToOne(cascade = CascadeType.ALL)
    private Authentification authentification;

    public Admin() {
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

    @Override
    public String toString() {
	return "Admin [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", authentification=" + authentification
		+ "]";
    }

}
