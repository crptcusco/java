package com.lasbambas.mantto.data;

import java.util.List;

import com.lasbambas.mantto.data.projection.idsPlanEquipo_Equipo;
import com.lasbambas.mantto.data.projection.spSourceDetalleEquipo;
import com.lasbambas.mantto.data.projection.spSourceDetalleFlota;
import com.lasbambas.mantto.model.PlanMantto;
import com.lasbambas.mantto.model.UserMantto;

public interface PlanManttoDao {
	public PlanMantto findById(long id);
	public PlanMantto findByName(String name);
	public List<PlanMantto> findAllOrderedByCreacion();
	public List<PlanMantto> findAllByUser(UserMantto user);
	public void register(PlanMantto planMantto);
	public List<spSourceDetalleEquipo> findSourceDetalle(long id);
	public List<spSourceDetalleFlota> findSourceDetalleFlota(long id);
	public List<idsPlanEquipo_Equipo> findMapPlan_idEquipo_id(long id);
	public List<spSourceDetalleEquipo> findSourceDetalleByEquipo(long id);
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByEquipo(long id);
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByFlota(long id, long valor);
	public List<spSourceDetalleEquipo> findSourceDetalleByFlota(long id, long valor);
	public List<spSourceDetalleEquipo> findSourceDetalleByProceso(long id, long valor);
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByProceso(long id, long valor);
	public List<spSourceDetalleEquipo> findSourceDetalleByPlanEquipoId(long id);
	public List<spSourceDetalleFlota> findSourceDetalleFlotaByPlanEquipoId(
			long id);
}
