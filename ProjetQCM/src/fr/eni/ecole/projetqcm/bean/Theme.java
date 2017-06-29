package fr.eni.ecole.projetqcm.bean;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

public class Theme implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5781550454447364756L;
	private String nomTheme;
	private Set<Question> questions; // TreeSet
	
	public Theme() {
		this.questions = new TreeSet<Question>();
	}
	
	public String getNomTheme() {
		return nomTheme;
	}
	public void setNomTheme(String nomTheme) {
		this.nomTheme = nomTheme;
	}
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	
	
}
