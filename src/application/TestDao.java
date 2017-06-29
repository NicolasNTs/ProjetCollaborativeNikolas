package application;

import java.util.List;

import dao.Dao;
import model.Formateur;
import model.Projet;
import model.Promotion;

public class TestDao {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Dao dao = new Dao() ;
		
		Formateur r ;
		r = dao.verifierFormateur("aa", "ddd");
		System.out.println(r);
		r = dao.verifierFormateur("Lepetit", "ddd");
		System.out.println(r);
		r = dao.verifierFormateur("Lepetit", "azerty");
		System.out.println(r);
		
		r = dao.verifierFormateurBis("Lepetit", "azerty");
		System.out.println(r);
		
		List<Projet> liste = dao.getProjetsParFormateur(r);
		for (Projet p : liste)
			System.out.println(p.getTitre());
		
		List<String> sujets = dao.getSujetsProjetsParFormateur(r);
		for(String s : sujets)
			System.out.println(s);
		
		Promotion p = dao.getPromotion("Promo2");
		Projet projet = new Projet() ;
		projet.setTitre("Développement en java");
		projet.setSujet("Distributeur de bières");
		projet.setDateCreation("2017-06-30");
		projet.setDateLimiteRendu("2017-07-13");
		
		dao.creerProjet(projet, r, p);
		
	}

}
