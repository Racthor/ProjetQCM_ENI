package fr.eni.ecole.projetqcm.bean;

import java.io.Serializable;

public class Section implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4554009607901063466L;
	private int numeroSection;
	private Theme theme;
	private int nbQuestions;
	//	Pour chaque section, il faut définir le numéro de la section, le nom (c’est-à-dire le thème), 
//	le nombre de questions posées au stagiaire (Il s'agit du nombre de questions affichées lors du 
//	passage du test ; le nombre de questions saisies dans cette série devra être supérieur ou 
//	égal).
	
	public Section() {

	}

	public int getNumeroSection() {
		return numeroSection;
	}

	public void setNumeroSection(int numeroSection) {
		this.numeroSection = numeroSection;
	}

	public Theme getTheme() {
		return theme;
	}

	public void setTheme(Theme theme) {
		this.theme = theme;
	}

	public int getNbQuestions() {
		return nbQuestions;
	}

	public void setNbQuestions(int nbQuestions) {
		this.nbQuestions = nbQuestions;
	}
	
}
