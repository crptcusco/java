package com.lasbambas.mantto.data.projection;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@SuppressWarnings("serial")
@NamedNativeQueries({
	@NamedNativeQuery(
	name = "call_vEquipoFormat",
	query = "select ROW_NUMBER()OVER (ORDER BY proceso_id,socio_id,flota,equipo) AS id, * from EQU.vEquipoFormat ORDER BY proceso_id,socio_id,flota,equipo",
	resultClass = vEquipoFormat.class
	)
})
@Entity
public class vEquipoFormat implements Serializable {
	@Id
	private int id;
	private int proceso_id;
	private String proceso;
	private int flota_id;
	private int modelo_id;
	private String codModelo; 
	private String flota_modelo_id;
	private String flota;
	private int socio_id;
	private String socio;
	private int equipo_id;
	private String equipo;
	
	public vEquipoFormat(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProceso_id() {
		return proceso_id;
	}

	public void setProceso_id(int proceso_id) {
		this.proceso_id = proceso_id;
	}

	public String getProceso() {
		return proceso;
	}

	public void setProceso(String proceso) {
		this.proceso = proceso;
	}

	public int getFlota_id() {
		return flota_id;
	}

	public void setFlota_id(int flota_id) {
		this.flota_id = flota_id;
	}

	public int getModelo_id() {
		return modelo_id;
	}

	public void setModelo_id(int modelo_id) {
		this.modelo_id = modelo_id;
	}

	public String getFlota() {
		return flota;
	}

	public void setFlota(String flota) {
		this.flota = flota;
	}

	public int getSocio_id() {
		return socio_id;
	}

	public void setSocio_id(int socio_id) {
		this.socio_id = socio_id;
	}

	public String getSocio() {
		return socio;
	}

	public void setSocio(String socio) {
		this.socio = socio;
	}

	public int getEquipo_id() {
		return equipo_id;
	}

	public void setEquipo_id(int equipo_id) {
		this.equipo_id = equipo_id;
	}

	public String getEquipo() {
		return equipo;
	}

	public void setEquipo(String equipo) {
		this.equipo = equipo;
	}

	public String getFlota_modelo_id() {
		return flota_modelo_id;
	}

	public void setFlota_modelo_id(String flota_modelo_id) {
		this.flota_modelo_id = flota_modelo_id;
	}

	public String getCodModelo() {
		return codModelo;
	}

	public void setCodModelo(String codModelo) {
		this.codModelo = codModelo;
	}
	
}
