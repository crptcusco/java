package com.lasbambas.mantto.data;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.model.PlanAdicional;
import com.lasbambas.mantto.model.PlanEquipo;
import com.lasbambas.mantto.model.UserMantto;
@Repository
@Transactional
public class PlanAdicionalDaoImpl implements PlanAdicionalDao {
	@Autowired
    private EntityManager em;
	@Override
	public PlanAdicional findById(long id) {
		return em.find(PlanAdicional.class, id);
	}

	@Override
	public void register(PlanAdicional planAdicional) {
		em.persist(planAdicional);
		return;
	}

	@Override
	public void merge(PlanAdicional planAdicional) {
		em.merge(planAdicional);
		return;
		
	}

	@Override
	public PlanAdicional findByPlanEquipoAndDate(PlanEquipo planEquipo,
			Date fecha) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<PlanAdicional> criteria = cb.createQuery(PlanAdicional.class);        
        Root<PlanAdicional> planAdicional = criteria.from(PlanAdicional.class);        
        criteria.select(planAdicional).where(cb.equal(planAdicional.get("planEquipo"), planEquipo), cb.equal(planAdicional.get("fecha"), fecha));
        return em.createQuery(criteria).getSingleResult();
	}

	@Override
	public void remove(PlanAdicional planAdd) {
		em.remove(planAdd);
		return;
	}

	@Override
	public void removeById(long id) {
		em.remove(em.find(PlanAdicional.class, id));
		return;
	}
	

}
