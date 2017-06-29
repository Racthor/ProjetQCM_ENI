package fr.eni.ecole.projetqcm.bean;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

public class EnsembleTests implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4310536293900165276L;
	private Set<Test> tests;
	
	public EnsembleTests() {
		this.tests = new TreeSet<Test>();
	}

	public Set<Test> getTests() {
		return tests;
	}

	public void setTests(Set<Test> tests) {
		this.tests = tests;
	}
	
}
