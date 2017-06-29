package fr.eni.ecole.projetqcm.bean;

import java.io.Serializable;
import java.util.Map;
import java.util.TreeMap;

public class Question implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5284165829403197960L;
	
	private String enonce;
	private typeReponse typeReponse;
	private String image;
//	private String nomThemes;
	private Map<String, Boolean> reponses; // utilisation de TreeMap
	private int nbGReponses; // Calculé (comment ?)
	
//	Chaque question possède un énoncé et un type de réponse (1 seule bonne réponse, 2 bonnes réponses, 
//	plusieurs bonnes réponses…). Il est possible d'afficher une image en complément de l'énoncé 
//	pour chaque question. Il doit être possible de mettre en forme la question (type de caractères, 
//	indentation…).
	
//	Une question appartient obligatoirement à une section (et donc à un test). Il est nécessaire 
//	d'indiquer la ou les bonnes réponses lors de la saisie des réponses à une question. Toutes les 
//	questions sont de type QCM (une ou plusieurs bonnes réponses), pas de saisie libre possible. Il 
//	doit être possible de réorganiser le test en transférant les questions d'une section à une autre.
	
	public Question(){
		this.image = null;
		this.reponses = new TreeMap<String, Boolean>();
	}
	
	public String getEnonce() {
		return enonce;
	}

	public void setEnonce(String enonce) {
		this.enonce = enonce;
	}

	public typeReponse getTypeReponse() {
		return typeReponse;
	}

	public void setTypeReponse(typeReponse typeReponse) {
		this.typeReponse = typeReponse;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Map<String, Boolean> getReponses() {
		return reponses;
	}

	public void setReponses(Map<String, Boolean> reponses) {
		this.reponses = reponses;
	}
	
	public int getNbGReponses() {
		this.nbGReponses = 0;
		for(Map.Entry<String,Boolean> entry : this.reponses.entrySet()) {
			this.nbGReponses+=(entry.getValue())?1:0; 
		}
		return this.nbGReponses;
	}
}
