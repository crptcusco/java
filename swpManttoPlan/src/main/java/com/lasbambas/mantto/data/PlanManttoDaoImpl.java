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

import com.lasbambas.mantto.data.projection.idsPlanEquipo_Equipo;
import com.lasbambas.mantto.data.projection.spSourceDetalleEquipo;
import com.lasbambas.mantto.data.projection.spSourceDetalleFlota;
import com.lasbambas.mantto.model.PlanMantto;
import com.lasbambas.mantto.model.UserMantto;
@Repository
@Transactional
public class PlanManttoDaoImpl implements PlanManttoDao {
	@Autowired
    private EntityManager em;

	public PlanMantto findById(long id) {
		return em.find(PlanMantto.class, id);
	}

	public PlanMantto findByName(String name) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<PlanMantto> criteria = cb.createQuery(PlanMantto.class);        
        Root<PlanMantto> planMantto  = criteria.from(PlanMantto.class);
        
        criteria.select(planMantto).where(cb.equal(planMantto.get("nombre"), name));
        return em.createQuery(criteria).getSingleResult();
	}
	
	public List<PlanMantto> findAllOrderedByCreacion() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<PlanMantto> criteria = cb.createQuery(PlanMantto.class);        
        Root<PlanMantto> planMantto  = criteria.from(PlanMantto.class);
        
        criteria.select(planMantto).orderBy(cb.asc(planMantto.get("fechaCreacion")));
		return em.createQuery(criteria).getResultList();
	}

	public List<PlanMantto> findAllByUser(UserMantto user) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<PlanMantto> criteria = cb.createQuery(PlanMantto.class);        
        Root<PlanMantto> planMantto  = criteria.from(PlanMantto.class);
        
        criteria.select(planMantto).where(cb.equal(planMantto.get("userMantto"), user)).orderBy(cb.asc(planMantto.get("fechaCreacion")));
		return em.createQuery(criteria).getResultList();
	}

	public void register(PlanMantto planMantto) {
		em.persist(planMantto);		
	}

	@SuppressWarnings("unchecked")
	public List<spSourceDetalleEquipo> findSourceDetalle(long id) {
		Query query = em.createNativeQuery("{call spSourceDetalleWeb(?,?)}",
                spSourceDetalleEquipo.class)           
                .setParameter(1, id)
                .setParameter(2, spSourceDetalleEquipo.Filtro.PLAN_MANTTO.ordinal());
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<spSourceDetalleFlota> findSourceDetalleFlota(long id) {
		Query query = em.createNativeQuery("{call spMainSourceDetalleFlotaWeb(?,?)}",
                spSourceDetalleFlota.class)           
                .setParameter(1, id)
                .setParameter(2, spSourceDetalleFlota.Filtro.PLAN_MANTTO.ordinal());
		return query.getResultList();
	}
	@SuppressWarnings("unchecked")
	public List<idsPlanEquipo_Equipo> findMapPlan_idEquipo_id(long id) {
		Query query = em.createQuery("SELECT NEW com.lasbambas.mantto.data.projection.idsPlanEquipo_Equipo"
									+ "(p.id, p.manttoEquipo.equipo.id,"
									+ "CASE WHEN p.mtbf=0 THEN 1.0"
									    + " ELSE (((24 -(24*p.mttr/p.mtbf))/24)*100) END)"
								  + " FROM PlanEquipo p WHERE p.planMantto.id=:planMantto_id",
                idsPlanEquipo_Equipo.class)           
                .setParameter("planMantto_id", id);
		return query.getResultList();
	}

	
	public List<spSourceDetalleEquipo> findSourceDetalleByEquipo(long id) {		
		return null;
	}

	@Override
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByEquipo(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByFlota(long id,
			long valor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<spSourceDetalleEquipo> findSourceDetalleByFlota(long id,
			long valor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<spSourceDetalleEquipo> findSourceDetalleByProceso(long id,
			long valor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByProceso(long id,
			long valor) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<spSourceDetalleEquipo> findSourceDetalleByPlanEquipoId(long id) {
		Query query = em.createNativeQuery("{call spSourceDetalleWeb(?,?)}",
                spSourceDetalleEquipo.class)           
                .setParameter(1, id)
                .setParameter(2, spSourceDetalleEquipo.Filtro.PLAN_EQUIPO.ordinal());
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByPlanEquipoId(
			long id) {
		Query query = em.createNativeQuery("{call spMainSourceDetalleFlotaWeb(?,?)}",
                spSourceDetalleFlota.class)           
                .setParameter(1, id)
                .setParameter(2, spSourceDetalleFlota.Filtro.PLAN_EQUIPO.ordinal());
		return query.getResultList();
	}


}
