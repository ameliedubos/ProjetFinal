package com.winbet.entities;

import javax.persistence.Embeddable;

@Embeddable
public class Adresse {
	
	private String rue;
	private String code;
	private String ville;
	private String pays;
	
	public Adresse() {
	}
	
	public String getRue() {
		return rue;
	}
	public void setRue(String rue) {
		this.rue = rue;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	@Override
	public String toString() {
		return "Adresse [rue=" + rue + ", code=" + code + ", ville=" + ville + ", pays=" + pays + "]";
	}
	
	
}
