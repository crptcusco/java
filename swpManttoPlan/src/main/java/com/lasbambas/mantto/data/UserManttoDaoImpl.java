package com.lasbambas.mantto.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.model.Application;
import com.lasbambas.mantto.model.UserMantto;

@Repository
@Transactional
public class UserManttoDaoImpl implements UserManttoDao {
	
	@Autowired
    private EntityManager em;

	public UserMantto findById(Long id) {		
		 return em.find(UserMantto.class, id);
	}

	public UserMantto findByUserName(String userName) {		
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<UserMantto> criteria = cb.createQuery(UserMantto.class);        
        Root<UserMantto> userMantto = criteria.from(UserMantto.class);
        
        criteria.select(userMantto).where(cb.equal(userMantto.get("userName"), userName));
        return em.createQuery(criteria).getSingleResult();
	}

	public UserMantto findByEmail(String email) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<UserMantto> criteria = cb.createQuery(UserMantto.class);        
        Root<UserMantto> userMantto = criteria.from(UserMantto.class);
        
        criteria.select(userMantto).where(cb.equal(userMantto.get("email"), email));
        return em.createQuery(criteria).getSingleResult();
	}
	
	public UserMantto findByUserPass(String userName, String pass) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<UserMantto> criteria = cb.createQuery(UserMantto.class);        
        Root<UserMantto> userMantto = criteria.from(UserMantto.class);
        
        criteria.select(userMantto).where(cb.equal(userMantto.get("userName"), userName), cb.equal(userMantto.get("pass"), pass));
        return em.createQuery(criteria).getSingleResult();
	}


	public List<UserMantto> findAllOrderedByName() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<UserMantto> criteria = cb.createQuery(UserMantto.class);        
        Root<UserMantto> userMantto = criteria.from(UserMantto.class);
        
        criteria.select(userMantto).orderBy(cb.asc(userMantto.get("name")));
        return em.createQuery(criteria).getResultList();
	}

	public void register(UserMantto userMantto) {
		em.persist(userMantto);
        return;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Application> getApplications(UserMantto userMantto) {
		return em.createQuery("select distinct a from AccessApp aa"
							+ " inner join aa.application a"
							+ " inner join aa.group g"							
							+ " inner join g.userManttos um"
							+ " where um.id="+userMantto.getId()).getResultList();
	}

	
}
