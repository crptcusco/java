package com.lasbambas.mantto.data;

import java.util.List;

import com.lasbambas.mantto.data.projection.vEquipoFormat;
import com.lasbambas.mantto.model.Flota;
import com.lasbambas.mantto.model.Proceso;

public interface FlotaDao {
	public Flota findById(long id);
	public Flota findByFlota(String name);
	public List<Flota> findAllOrderedByFlota();
	public List<Flota> findAllByProceso(Proceso proceso);
	public List<vEquipoFormat> findAllFormat();
}
