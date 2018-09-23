package com.lasbambas.mantto.data;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.model.PlanEquipo;
@Repository
@Transactional
public class PlanEquipoDaoImpl implements PlanEquipoDao{
	@Autowired
    private EntityManager em;

	public PlanEquipo findById(long id) {
		return em.find(PlanEquipo.class,id);
	}
}
