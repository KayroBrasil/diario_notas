package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {

	private static final EntityManagerFactory emf = Persistence
			.createEntityManagerFactory("jpa-hibernate-mysql");

	private static ThreadLocal<EntityManager> ems = new ThreadLocal<EntityManager>();

	// Fecha o EntityManager atrelado à Thread atual e retira-o da ThreadLocal.
	public static void closeCurrentEntityManager() {
		EntityManager em = ems.get();

		if (em != null && em.isOpen()){
			em.close();
		}
			
		ems.set(null);
	}

	// Obtém o EntityManager vinculado à Thread atual. Se ele ainda
	// não existir, é criado e depois, vinculado à Thread atual.
	public static EntityManager getCurrentEntityManager() {
		EntityManager em = ems.get();

		if (em == null) {
			em = emf.createEntityManager();
			ems.set(em);
		}

		return em;
	}
}
