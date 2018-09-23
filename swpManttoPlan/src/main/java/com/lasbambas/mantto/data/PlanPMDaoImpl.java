package com.lasbambas.mantto.data;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.model.PlanEquipo;
import com.lasbambas.mantto.model.PlanPM;
@Repository
@Transactional
public class PlanPMDaoImpl implements PlanPMDao {
	@Autowired
    private EntityManager em;
	public PlanPM findById(long id) {
		return em.find(PlanPM.class,id);
	}
	@Override
	public void register(PlanPM planPM) {
		em.persist(planPM);
		return;		
	}
	@Override
	public void merge(PlanPM planPM) {
		em.merge(planPM);
		return;		
	}
	@Override
	public PlanPM findByPlanEquipoAndDate(PlanEquipo planEquipo, Date date) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<PlanPM> criteria = cb.createQuery(PlanPM.class);        
        Root<PlanPM> planPM = criteria.from(PlanPM.class);
        
        criteria.select(planPM).where(cb.equal(planPM.get("planEquipo"), planEquipo), cb.equal(planPM.get("fecha"), date));
        return em.createQuery(criteria).getSingleResult();
	}

}
