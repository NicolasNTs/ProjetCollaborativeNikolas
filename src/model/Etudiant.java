package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the etudiant database table.
 * 
 */
//, insertable=false, updatable=false

@Entity
@NamedQuery(name="Etudiant.findAll", query="SELECT e FROM Etudiant e")
public class Etudiant implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_MEMBRE")
	private int idMembre;

	private String nom;

	//bi-directional many-to-one association to Equipe
	@OneToMany(mappedBy="etudiant")
	private List<Equipe> equipes1;

	//bi-directional many-to-many association to Equipe
	@ManyToMany(mappedBy="etudiants")
	private List<Equipe> equipes2;

	//bi-directional one-to-one association to Membre
	@OneToOne
	@JoinColumn(name="ID_MEMBRE" , insertable=false, updatable=false)
	private Membre membre;

	//bi-directional many-to-many association to Promotion
	@ManyToMany
	@JoinTable(
		name="membre_promotion"
		, joinColumns={
			@JoinColumn(name="ID_MEMBRE")
			}
		, inverseJoinColumns={
			@JoinColumn(name="ID_PROMOTION")
			}
		)
	private List<Promotion> promotions;

	public Etudiant() {
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

	public List<Equipe> getEquipes1() {
		return this.equipes1;
	}

	public void setEquipes1(List<Equipe> equipes1) {
		this.equipes1 = equipes1;
	}

	public Equipe addEquipes1(Equipe equipes1) {
		getEquipes1().add(equipes1);
		equipes1.setEtudiant(this);

		return equipes1;
	}

	public Equipe removeEquipes1(Equipe equipes1) {
		getEquipes1().remove(equipes1);
		equipes1.setEtudiant(null);

		return equipes1;
	}

	public List<Equipe> getEquipes2() {
		return this.equipes2;
	}

	public void setEquipes2(List<Equipe> equipes2) {
		this.equipes2 = equipes2;
	}

	public Membre getMembre() {
		return this.membre;
	}

	public void setMembre(Membre membre) {
		this.membre = membre;
	}

	public List<Promotion> getPromotions() {
		return this.promotions;
	}

	public void setPromotions(List<Promotion> promotions) {
		this.promotions = promotions;
	}

}