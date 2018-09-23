package com.lasbambas.mantto.data;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.model.PlanComponente;
@Repository
@Transactional
public class PlanComponenteDaoImpl implements PlanComponenteDao {
	@Autowired
    private EntityManager em;

	@Override
	public PlanComponente findById(long id) {
		return em.find(PlanComponente.class,id);
	}

}
