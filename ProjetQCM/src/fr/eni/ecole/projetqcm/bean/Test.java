package fr.eni.ecole.projetqcm.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

public class Test implements Serializable, Comparable<Test> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6669553564565721897L;
	private String nom;
	private Set<Section> section; // TreeSet
	private Date tempsPassage;
	private int seuilAcquis;
	private int seuilEnCours;
	private Set<Candidat> candidats;
	
	
	//	Chaque test est parfaitement identifié par son nom. Pour chaque test il est possible de définir
//	de une à n sections. Chaque section correspond à un thème particulier abordé dans le test et peut 
//	contenir un nombre quelconque de questions avec un minimum de un.

	//	Pour chaque test, il faut définir un temps de passage et deux seuils (exprimé en pourcentage de
//	bonnes réponses). Les deux seuils séparent les trois résultats possibles : « acquis », « en cours
//	d’acquisition » et « non acquis ».


	//	Il est possible qu’un test utilise pour l’une de ses sections un thème qui a été créé pour un 
//	autre test. Le nombre de questions posées au stagiaire ne sera pas forcément le même.
	
	public Test(){
		section = new TreeSet<Section>();
		candidats = new TreeSet<Candidat>();
	}
	
	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public Set<Section> getSection() {
		return section;
	}


	public void setSection(Set<Section> section) {
		this.section = section;
	}


	public Date getTempsPassage() {
		return tempsPassage;
	}


	public void setTempsPassage(Date tempsPassage) {
		this.tempsPassage = tempsPassage;
	}


	public int getSeuilAcquis() {
		return seuilAcquis;
	}


	public void setSeuilAcquis(int seuilAcquis) {
		this.seuilAcquis = seuilAcquis;
	}


	public int getSeuilEnCours() {
		return seuilEnCours;
	}


	public void setSeuilEnCours(int seuilEnCours) {
		this.seuilEnCours = seuilEnCours;
	}
	
	public Set<Candidat> getCandidats() {
		return candidats;
	}


	public void setCandidats(Set<Candidat> candidats) {
		this.candidats = candidats;
	}

	@Override
	public int compareTo(Test o) {
		// TODO Auto-generated method stub
		return this.nom.compareTo(o.getNom());
	}
	
	
}
