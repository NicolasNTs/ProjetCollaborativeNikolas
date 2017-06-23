package application;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;



//import javamodeles.Client;
import model.Client;

public class LoginBean {
	private Client client;
	private Integer code;
	private EntityManager em;
	

	public LoginBean() {
		client = new Client();
		EntityManagerFactory factory=Persistence.createEntityManagerFactory("prjface0");
		em=factory.createEntityManager();
			}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String validationClient() {
		return "bienvenue";
	}

	public String enregistrerClient() {
		em.getTransaction().begin();
		em.persist(client);
		em.getTransaction().commit();		
		return "bienvenue";
	}
}
