package com.lasbambas.mantto.controller.respons;

import java.util.List;

import com.lasbambas.mantto.data.projection.idsPlanEquipo_Equipo;
import com.lasbambas.mantto.model.PlanMantto;

public class planConfig {
	public PlanMantto plan;
	public List<idsPlanEquipo_Equipo> idsMap;
	public planConfig(PlanMantto plan, List<idsPlanEquipo_Equipo> idsMap) {
		this.plan = plan;
		this.idsMap = idsMap;
	}



}
