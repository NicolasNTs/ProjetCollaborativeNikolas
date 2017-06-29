package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the formateur database table.
 * 
 */
@Entity
@NamedQuery(name="Formateur.findAll", query="SELECT f FROM Formateur f")
public class Formateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_MEMBRE")
	private int idMembre;

	private String nom;

	//bi-directional one-to-one association to Membre
	@OneToOne
	@JoinColumn(name="ID_MEMBRE" , insertable=false, updatable=false)
	private Membre membre;

	//bi-directional many-to-one association to Projet
	@OneToMany(mappedBy="formateur")
	private List<Projet> projets;

	public Formateur() {
	}

	public int getIdMembre() {
		return this.idMembre;
	}

	public void setIdMembre(int idMembre) {
		this.idMembre = idMembre;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Membre getMembre() {
		return this.membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}

	public List<Projet> getProjets() {
		return this.projets;
	}

	public void setProjets(List<Projet> projets) {
		this.projets = projets;
	}

	public Projet addProjet(Projet projet) {
		getProjets().add(projet);
		projet.setFormateur(this);

		return projet;
	}

	public Projet removeProjet(Projet projet) {
		getProjets().remove(projet);
		projet.setFormateur(null);

		return projet;
	}

}