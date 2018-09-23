package com.lasbambas.mantto.data;

import java.util.Date;

import com.lasbambas.mantto.model.PlanAdicional;
import com.lasbambas.mantto.model.PlanEquipo;

public interface PlanAdicionalDao {
	public PlanAdicional findById(long id);
	public void register(PlanAdicional planAdicional);
	public void merge(PlanAdicional planAdicional);
	public PlanAdicional findByPlanEquipoAndDate(PlanEquipo planEquipo,
			Date fechaEstimada);
	public void remove(PlanAdicional planAdd);
	public void removeById(long id);
}
