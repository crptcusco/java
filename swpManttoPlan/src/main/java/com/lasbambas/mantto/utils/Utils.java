package com.lasbambas.mantto.utils;

import java.util.Date;

public class Utils {
	private Utils(){}
	
	/* Diff dias entre dos fechas */
	public static int nroDiasEntreFechas(Date fecha1, Date fecha2){
		final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000;
		return (int)((fecha2.getTime()-fecha1.getTime())/MILLSECS_PER_DAY);
	}
	
}
