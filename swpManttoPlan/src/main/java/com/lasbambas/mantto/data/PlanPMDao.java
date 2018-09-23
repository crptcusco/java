package com.lasbambas.mantto.data;

import java.util.Date;

import com.lasbambas.mantto.model.PlanEquipo;
import com.lasbambas.mantto.model.PlanPM;

public interface PlanPMDao {
	public PlanPM findById(long id);
	public PlanPM findByPlanEquipoAndDate(PlanEquipo planEquipo, Date date);
	public void register(PlanPM planPM);
	public void merge(PlanPM planPM);
}
