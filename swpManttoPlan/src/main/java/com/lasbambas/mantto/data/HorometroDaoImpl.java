package com.lasbambas.mantto.data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lasbambas.mantto.data.projection.spPaginacionHorometro;
@Repository
@Transactional
public class HorometroDaoImpl implements HorometroDao {
	@Autowired
    private EntityManager em;

	public Date getCurrentData() {
//		CriteriaBuilder cb = em.getCriteriaBuilder();
//        CriteriaQuery<Horometro> criteria = cb.createQuery(Horometro.class);        
//        Root<Horometro> horometro  = criteria.from(Horometro.class);
        
//        criteria.select(horometro).where(cb.equal(horometro.get("nombre"), name));
//        return em.createQuery(criteria).getSingleResult();
		return em.createQuery("select max(h.fecha) from Horometro h",Date.class).getSingleResult();
        
	}

	@Override
	public long getSizeRecords() {
		// TODO Auto-generated method stub
		return em.createQuery("select count(*) from Horometro h",Long.class).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getPageData(int nPage, int rgPorPage, String colOrder, int typeOrder) {
		Query query = em.createNativeQuery("{call spPaginacionHorometro(?,?,?,?)}",
				spPaginacionHorometro.class)           
                .setParameter(1, nPage)
                .setParameter(2, rgPorPage)
                .setParameter(3, colOrder)
                .setParameter(4, typeOrder);
		return query.getResultList();
	}

}
