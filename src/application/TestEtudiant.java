package application;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import model.Etudiant;
import model.Formateur;
import model.Membre;

public class TestEtudiant {

	public static void main(String[] args) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("formation");
		EntityManager em;
		em = factory.createEntityManager();
		////////////////////////////////////////
		Membre dupond = new Membre() ;
		dupond.setNom("Repondu");
		dupond.setPrenom("Jean");
		dupond.setMail("jrepondu@yahoo.com");
		dupond.setMotdepasse("azerty");
		
		em.getTransaction().begin();
		em.persist(dupond);
		em.getTransaction().commit();
		
		em.getTransaction().begin();
		Etudiant dupondE = new Etudiant() ;
		dupondE.setIdMembre(dupond.getIdMembre());
		dupondE.setNom(dupond.getNom());
		em.persist(dupondE);
		em.getTransaction().commit();
		////////////////////////////////////
		Membre legrand = new Membre() ;
		legrand.setNom("Lepetit");
		legrand.setPrenom("luis");
		legrand.setMail("louislepetit@yahoo.com");
		legrand.setMotdepasse("azerty");
		em.getTransaction().begin();
		em.persist(legrand);
		em.getTransaction().commit();
		
		em.getTransaction().begin();
		Formateur legrandF = new Formateur() ;
		legrandF.setIdMembre(legrand.getIdMembre());
		legrandF.setNom(legrand.getNom());
		em.persist(legrandF);
		em.getTransaction().commit();
		
	}

}
