package com.lasbambas.mantto.data.projection;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@Entity
@JsonInclude(Include.NON_NULL)
public class spSourceDetalleFlota {
	public enum Filtro{
		PLAN_MANTTO,
		PLAN_EQUIPO
	}
	@Id
	private int id;
	private String flota_modelo_id;
	private Date fecha;
	private Integer durPM;
	private Double durADD;
	private Double durComp;
	private Integer nPMs;
	private Integer nADDs;
	private Integer nComps;
	private Double disp;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFlota_modelo_id() {
		return flota_modelo_id;
	}
	public void setFlota_modelo_id(String flota_modelo_id) {
		this.flota_modelo_id = flota_modelo_id;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Integer getDurPM() {
		return durPM;
	}
	public void setDurPM(Integer durPM) {
		this.durPM = durPM;
	}
	public Double getDurADD() {
		return durADD;
	}
	public void setDurADD(Double durADD) {
		this.durADD = durADD;
	}
	public Double getDurComp() {
		return durComp;
	}
	public void setDurComp(Double durComp) {
		this.durComp = durComp;
	}
	public Integer getnPMs() {
		return nPMs;
	}
	public void setnPMs(Integer nPMs) {
		this.nPMs = nPMs;
	}
	public Integer getnADDs() {
		return nADDs;
	}
	public void setnADDs(Integer nADDs) {
		this.nADDs = nADDs;
	}
	public Integer getnComps() {
		return nComps;
	}
	public void setnComps(Integer nComps) {
		this.nComps = nComps;
	}
	public Double getDisp() {
		return disp;
	}
	public void setDisp(Double disp) {
		this.disp = disp;
	}
	
}
