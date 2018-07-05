package com.winbet.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

@Entity
public class Authentification {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message = "{error.authentification.obligatoire}")
	@Email(message = "{error.authentification.email.malforme}")
	private String email;
	@NotEmpty(message = "{error.authentification.obligatoire}")
	private String motDePasse;
	private ERole role;
	
	public Authentification() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	public ERole getRole() {
		return role;
	}

	public void setRole(ERole role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Authentification [id=" + id + ", email=" + email + ", motDePasse=" + motDePasse + ", role=" + role
				+ "]";
	}
	
	
	
	
	
	
	


}
