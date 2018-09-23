package com.lasbambas.mantto.data.projection;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
@SuppressWarnings("serial")
@Entity
@JsonInclude(Include.NON_NULL)
public class spPaginacionHorometro implements Serializable {
private Long id;
private String proceso;
private String flota;
private String equipo;
private Date fecha;
private Double horoIni;
private Double horoFin;
private Double horas;
@Id
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getProceso() {
	return proceso;
}
public void setProceso(String proceso) {
	this.proceso = proceso;
}
public String getFlota() {
	return flota;
}
public void setFlota(String flota) {
	this.flota = flota;
}
public String getEquipo() {
	return equipo;
}
public void setEquipo(String equipo) {
	this.equipo = equipo;
}
public Date getFecha() {
	return fecha;
}
public void setFecha(Date fecha) {
	this.fecha = fecha;
}
public Double getHoroIni() {
	return horoIni;
}
public void setHoroIni(Double horoIni) {
	this.horoIni = horoIni;
}
public Double getHoroFin() {
	return horoFin;
}
public void setHoroFin(Double horoFin) {
	this.horoFin = horoFin;
}
public Double getHoras() {
	return horas;
}
public void setHoras(Double horas) {
	this.horas = horas;
}
}
