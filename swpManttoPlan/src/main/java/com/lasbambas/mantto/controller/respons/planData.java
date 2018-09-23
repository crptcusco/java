package com.lasbambas.mantto.controller.respons;

import java.util.List;

import com.lasbambas.mantto.data.projection.spSourceDetalleEquipo;
import com.lasbambas.mantto.data.projection.spSourceDetalleFlota;

public class planData {
	public List<spSourceDetalleEquipo> sourceEquipo;
	public List<spSourceDetalleFlota> sourceFlota;
	public planData(List<spSourceDetalleEquipo> sourceEquipo,
			List<spSourceDetalleFlota> sourceFlota) {
		this.sourceEquipo = sourceEquipo;
		this.sourceFlota = sourceFlota;
	}


}
