package fr.eni.ecole.projetqcm.bean;

import java.io.Serializable;

public class Candidat implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6048218697648799161L;
	private String prenom;
	private String nom;
	private String email;
	private String password;
	
	public Candidat() {}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
