package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@SuppressWarnings("serial")
@Entity
@Table(schema = "CNF")
public class Inspeccion implements Serializable {
	public enum Estado {
		NORMAL,
		CRITICO,
		ALERTA
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@NotEmpty
	private Date fecha;
	@NotEmpty
	private double horometro;
	@NotNull
	private Estado estado;
	@NotNull
	private String observacion;
	@ManyToOne
	private Equipo equipo;
	@ManyToOne
	private TipoInspeccion tipoInspeccion;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public double getHorometro() {
		return horometro;
	}
	public void setHorometro(double horometro) {
		this.horometro = horometro;
	}
	public Estado getEstado() {
		return estado;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public Equipo getEquipo() {
		return equipo;
	}
	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}
	public TipoInspeccion getTipoInspeccion() {
		return tipoInspeccion;
	}
	public void setTipoInspeccion(TipoInspeccion tipoInspeccion) {
		this.tipoInspeccion = tipoInspeccion;
	}
	
	
	
}
