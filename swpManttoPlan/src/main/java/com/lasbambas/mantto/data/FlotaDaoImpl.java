package com.lasbambas.mantto.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.data.projection.vEquipoFormat;
import com.lasbambas.mantto.model.Flota;
import com.lasbambas.mantto.model.Proceso;

@Repository
@Transactional
public class FlotaDaoImpl implements FlotaDao{
	@Autowired
    private EntityManager em;

	@Override
	public Flota findById(long id) {
		return em.find(Flota.class,id);
	}

	@Override
	public Flota findByFlota(String name) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Flota> criteria = cb.createQuery(Flota.class);
        Root<Flota> flota = criteria.from(Flota.class);

        criteria.select(flota).where(cb.equal(flota.get("flota"), name));
        return em.createQuery(criteria).getSingleResult();
	}

	@Override
	public List<Flota> findAllOrderedByFlota() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Flota> criteria = cb.createQuery(Flota.class);
        Root<Flota> flota = criteria.from(Flota.class);
        
        criteria.select(flota).orderBy(cb.asc(flota.get("flota")));
        return em.createQuery(criteria).getResultList();
	}

	@Override
	public List<Flota> findAllByProceso(Proceso proceso) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Flota> criteria = cb.createQuery(Flota.class);
        Root<Flota> flota = criteria.from(Flota.class);
        
        criteria.select(flota).where(cb.equal(flota.get("proceso"), proceso)).orderBy(cb.asc(flota.get("flota")));
        return em.createQuery(criteria).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<vEquipoFormat> findAllFormat() {		
		Query query = em.createNativeQuery("select ROW_NUMBER()OVER (ORDER BY proceso_id,socio_id,flota,equipo) AS id, * from EQU.vEquipoFormat ORDER BY proceso_id,socio_id,flota,equipo",
				vEquipoFormat.class);
		return query.getResultList();		
	}
	
}
