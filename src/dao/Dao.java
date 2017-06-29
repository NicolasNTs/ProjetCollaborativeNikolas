package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import model.Formateur;
import model.Membre;
import model.Projet;
import model.Promotion;

public class Dao {
	private EntityManager em;

	public Dao() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("formation");
		em = factory.createEntityManager();
	}

	public Promotion getPromotion(String nom) {
		String requete = "SELECT g FROM Promotion g where g.nomPromo = ";
		requete = requete + "'" + nom + "'";
		TypedQuery<Promotion> query = em.createQuery(requete, Promotion.class);
		if (query.getResultList().size() != 0) {
			Promotion p = query.getSingleResult();
			System.out.println("Promotion trouvée:" + p.getNomPromo());
			return p;
		} else
			return null;
	}
	public List<Promotion> getLesPromotions() {
		String requete = "SELECT g FROM Promotion g" ;
		TypedQuery<Promotion> query = em.createQuery(requete, Promotion.class);
		List<Promotion> liste= query.getResultList();
		return liste ;
	}

	public boolean creerProjet(Projet p, Formateur f, Promotion pro) {
		System.out.println("Création projet");
		p.setFormateur(f);
		p.setPromotion(pro);
		em.getTransaction().begin();
		em.persist(p);
		em.getTransaction().commit();
		return true;
	}

	public List<Projet> getProjetsParFormateur(Formateur formateur) {
		List<Projet> lesprojets = null;
		Query q = em.createQuery("SELECT s FROM Projet s WHERE s.formateur = :var");
		q.setParameter("var", formateur);
		lesprojets = q.getResultList();
		return lesprojets;
	}

	public List<String> getSujetsProjetsParFormateur(Formateur formateur) {
		List<String> lessujets = null;
		Query q = em.createQuery("SELECT s.sujet FROM Projet s WHERE s.formateur = :var");
		q.setParameter("var", formateur);
		lessujets = q.getResultList();
		return lessujets;
	}

	public Formateur verifierFormateur(String nom, String mdp) {
		String requete = "SELECT g FROM Formateur g where g.nom = ";
		requete = requete + "'" + nom + "'";
		Formateur i1 = null;
		TypedQuery<Formateur> query = em.createQuery(requete, Formateur.class);
		if (query.getResultList().size() != 0) {
			i1 = query.getSingleResult();
			System.out.println("Formateur trouvé:" + i1.getNom());
			requete = "SELECT g FROM Membre g where g.nom = ";
			requete = requete + "'" + nom + "'";
			requete = requete + " and g.motdepasse = " + "'" + mdp + "'";
			TypedQuery<Membre> query1 = em.createQuery(requete, Membre.class);
			if (query1.getResultList().size() != 0) {
				System.out.println("Mot de passe ok");
				Formateur f = query.getSingleResult();
				return f;
			} else {
				System.out.println("Mot de passe faux");
				return null;
			}
		} else {
			System.out.println("Pas trouvé");
			return null;
		}
	}

	public Formateur verifierFormateurBis(String nom, String mdp) {
		String requete = "SELECT f FROM Formateur f, Membre m where m.motdepasse=";
		requete += "'" + mdp + "'" + " and m.nom =" + "'" + nom + "'";
		requete += " and m.nom = f.nom";
		Formateur i1 = null;
		TypedQuery<Formateur> query = em.createQuery(requete, Formateur.class);
		if (query.getResultList().size() != 0) {
			i1 = query.getSingleResult();
			System.out.println("Formateur vérifié:" + i1.getNom());
			return i1;
		} else
			return null;
	}
}