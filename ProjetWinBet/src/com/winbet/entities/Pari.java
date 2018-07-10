package com.winbet.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.Min;

@Entity
public class Pari {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private Client client;
    @OneToOne
    private Rencontre rencontre;
    @Min(value = 1, message = "{error.pari.obligatoire}")
    private int somme;
    private Long vainqueur;

    public Pari() {

    }

    public Client getClient() {
	return client;
    }

    public void setClient(Client client) {
	this.client = client;
    }

    public Rencontre getRencontre() {
	return rencontre;
    }

    public void setRencontre(Rencontre rencontre) {
	this.rencontre = rencontre;
    }

    public int getSomme() {
	return somme;
    }

    public void setSomme(int somme) {
	this.somme = somme;
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public Long getVainqueur() {
	return vainqueur;
    }

    public void setVainqueur(Long vainqueur) {
	this.vainqueur = vainqueur;
    }

    @Override
    public String toString() {
	return "Pari [client=" + client + ", rencontre=" + rencontre + ", somme=" + somme + ", id=" + id
		+ ", vainqueur=" + vainqueur + "]";
    }

}
