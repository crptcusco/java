package com.lasbambas.mantto.data.projection;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
@Entity
@JsonInclude(Include.NON_NULL)
public class spSourceDetalleEquipo {
	public enum Filtro{
		PLAN_MANTTO,
		PLAN_EQUIPO
	}
	@Id
	private int id;
	private long planEquipo_id;
	private String equipoComp_ids;
	private Long planPM_id;
	private Long planAdicional_id;
	private Date fecha;
	private Double durADD;
	private Double durComp;
	private Double durPM;
	private Integer frecuencia;
	private Integer nivel;
	private Integer estFecha;
	private Double disp;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getPlanEquipo_id() {
		return planEquipo_id;
	}
	public void setPlanEquipo_id(long planEquipo_id) {
		this.planEquipo_id = planEquipo_id;
	}
	public String getEquipoComp_ids() {
		return equipoComp_ids;
	}
	public void setEquipoComp_ids(String equipoComp_ids) {
		this.equipoComp_ids = equipoComp_ids;
	}
	public Long getPlanPM_id() {
		return planPM_id;
	}
	public void setPlanPM_id(Long planPM_id) {
		this.planPM_id = planPM_id;
	}
	public Long getPlanAdicional_id() {
		return planAdicional_id;
	}
	public void setPlanAdicional_id(Long planAdicional_id) {
		this.planAdicional_id = planAdicional_id;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
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
	public Double getDurPM() {
		return durPM;
	}
	public void setDurPM(Double durPM) {
		this.durPM = durPM;
	}
	public Integer getFrecuencia() {
		return frecuencia;
	}
	public void setFrecuencia(Integer frecuencia) {
		this.frecuencia = frecuencia;
	}
	public Integer getNivel() {
		return nivel;
	}
	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}
	public Integer getEstFecha() {
		return estFecha;
	}
	public void setEstFecha(Integer estFecha) {
		this.estFecha = estFecha;
	}
	public Double getDisp() {
		return disp;
	}
	public void setDisp(Double disp) {
		this.disp = disp;
	}	
	
}
