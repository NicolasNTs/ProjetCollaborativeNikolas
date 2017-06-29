package beans;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import dao.Dao;
import model.Formateur;
import model.Projet;
import model.Promotion;

public class LoginBean {
	private Dao dao ;	
	private String nom ;
	private String motdepasse ;
	private Formateur formateur; 
	
	private List<Projet> lesProjets;
	private Projet leProjet ;
	
	private String nomprojet ;
	private List<Promotion> lesPromotions;
	private String nomPromotion ;
	
	private String selectedItem; // +getter +setter
    private Map<String, String> availableItems; // +getter
	 
	public LoginBean() {
		dao = new Dao() ;
		setLesPromotions(dao.getLesPromotions()) ;
		availableItems = new LinkedHashMap<String, String>();
        availableItems.put("Formateur", "Formateur");
        availableItems.put("Etudiant", "Etudiant");
	}
	public String creerProjet() {
		System.out.println("1: "+nomPromotion+ "  "+leProjet.getSujet());
		for (Promotion p : lesPromotions) {
			if (p.getNomPromo().equals(nomPromotion))
				dao.creerProjet(leProjet, formateur, p);
		}
		return "succescreationprojet" ;
	}
	public Map<String, String> getAvailableItems() {
		return availableItems;
	}
	public void setAvailableItems(Map<String, String> availableItems) {
		this.availableItems = availableItems;
	}
	
	public void setSelectedItem(String selectedItem) {
		this.selectedItem = selectedItem;
	}
	public String getSelectedItem() {
		return selectedItem;
	}
	public String validationMembre() {
		String selectedLabel = availableItems.get(selectedItem);
		System.out.println(selectedLabel);
		setFormateur(dao.verifierFormateur(nom, motdepasse));
		if (formateur != null) {
			lesProjets = dao.getProjetsParFormateur(formateur);
			leProjet = new Projet() ;
			return "inviteFormateur";
		}
		else return "inconnu" ;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getMotdepasse() {
		return motdepasse;
	}

	public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
	public List<Projet> getLesProjets() {
		return lesProjets;
	}
	public void setLesProjets(List<Projet> lesProjets) {
		this.lesProjets = lesProjets;
	}
	public Projet getLeProjet() {
		return leProjet;
	}
	public void setLeProjet(Projet leProjet) {
		this.leProjet = leProjet;
	}
	public String getNomprojet() {
		return nomprojet;
	}
	public void setNomprojet(String nomprojet) {
		this.nomprojet = nomprojet;
	}
	public List<Promotion> getLesPromotions() {
		return lesPromotions;
	}
	public void setLesPromotions(List<Promotion> lesPromotions) {
		this.lesPromotions = lesPromotions;
	}
	public String getNomPromotion() {
		return nomPromotion;
	}
	public void setNomPromotion(String nomPromotion) {
		this.nomPromotion = nomPromotion;
	}
	public Formateur getFormateur() {
		return formateur;
	}
	public void setFormateur(Formateur formateur) {
		this.formateur = formateur;
	}
}