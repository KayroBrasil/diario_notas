package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import util.JPAUtil;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class GenericJPADAO implements GenericDAO{

	public enum QueryType { JPQL, NATIVE, NAMED }
	
	private EntityManagerFactory emf;
	
	public GenericJPADAO() {
		//setEmf(Persistence.createEntityManagerFactory("jpa-hibernate-sqlserver"));
	}
	
	public EntityManagerFactory getEmf() {
		return emf;
	}

	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	
	public Object save(Object entity) {
		EntityManager em = JPAUtil.getCurrentEntityManager(); //emf.createEntityManager();
		try {
			Object obj = em.merge(entity);
			return obj;
		} catch (Exception e) {
			throw new DAOException("A operação não foi realizada com sucesso.", e);
		} 
	}

	public void delete(Object entity) {
		EntityManager em = JPAUtil.getCurrentEntityManager(); //emf.createEntityManager();
		try {
			//em.getTransaction().begin();
			em.remove(em.merge(entity));
			//em.getTransaction().commit();
		} catch (Exception e) {
			//em.getTransaction().rollback();
			throw new DAOException("A operação não foi realizada com sucesso.", e);
		} 
	}

	public Object find(Class entityClass, Object id) {
		Object result = null;
		EntityManager em = JPAUtil.getCurrentEntityManager(); //emf.createEntityManager();
		try {
			result = em.find(entityClass, id);
		} finally {
			//em.close();
		}
		return result;
	}

	public List find(Class entityClass) {
		return find(entityClass, -1, -1);
	}
	
	public List find(Class entityClass, int firstResult, int maxResults) {
		List result = null;
		EntityManager em = JPAUtil.getCurrentEntityManager(); //emf.createEntityManager();
		Query q = em.createQuery("select obj from " + entityClass.getSimpleName() + " obj");
		if (firstResult >= 0 && maxResults >= 0) {
			q = q.setFirstResult(firstResult).setMaxResults(maxResults);
		}
	    result = q.getResultList();   
		return result;
	}

	public List find(String queryName, Map<String,Object> namedParams) {
		return find(QueryType.NAMED, queryName, namedParams);
	}
	
	public List find(QueryType type, String query, Map<String,Object> namedParams) {
		return find(type, query, namedParams, -1, -1);
	}
	
	public List find(String queryName, Map<String,Object> namedParams, int firstResult, int maxResults) {
		return find(QueryType.NAMED, queryName, namedParams, firstResult, maxResults);
	}
	
	public List find(QueryType type, String query, Map<String,Object> namedParams, int firstResult, int maxResults) {
		
		List result = null;
		EntityManager em = JPAUtil.getCurrentEntityManager(); //emf.createEntityManager();

		Query q;
		if (type == QueryType.JPQL) {
			q = em.createQuery(query);
		} else if (type == QueryType.NATIVE) {
			q = em.createNativeQuery(query);
		} else if (type == QueryType.NAMED) {
			q = em.createNamedQuery(query); 
		} else {
			throw new IllegalArgumentException("Tipo de Query inválido: " + type);
		}
		
		// Define os parametros da consulta
		Set<String> keys = namedParams.keySet();
		for (String key : keys) {
			q.setParameter(key, namedParams.get(key));
		}
		
		// Define paginação ou não
		if (firstResult >= 0 && maxResults >= 0) {
			q = q.setFirstResult(firstResult).setMaxResults(maxResults);
		}

		// Executa a consulta
	    result = q.getResultList();
		    
		return result;
	}

	public List find(String queryName) {
		// TODO Auto-generated method stub
		return find(queryName, new HashMap<String, Object>());
	}
	
	public int execute(String comando){
		
		EntityManager em = JPAUtil.getCurrentEntityManager(); //emf.createEntityManager();
		Query q = em.createQuery(comando);
		
		try {
			int c = q.executeUpdate();
			return c;
		} catch (Exception e) {
			throw new DAOException("A operação não foi realizada com sucesso.", e);
		}
		
	}

}
