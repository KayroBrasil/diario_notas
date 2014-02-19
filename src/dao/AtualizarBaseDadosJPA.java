package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AtualizarBaseDadosJPA {
	
	public static void main(String[] args) {
		
		EntityManagerFactory emf = 
				Persistence.createEntityManagerFactory("jpa-hibernate-mysql");
		
		EntityManager em = emf.createEntityManager();
		
		System.out.println("Base atualizada");
		
		em.close();
		emf.close();
		
	}

}
