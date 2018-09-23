package com.lasbambas.mantto.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.lasbambas.mantto.model.Modelo.Socio;

@SuppressWarnings("serial")
@Entity
@Table(schema = "CNF",uniqueConstraints=@UniqueConstraint(columnNames={"modeloSistema_id", "tipoInspeccion"}))
public class TipoInspeccion implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@NotEmpty
	private String tipoInspeccion;
	@NotNull
	@ManyToOne
	private ModeloSistema modeloSistema;
	@NotNull
	private double frecuencia;
	@NotNull
	private Socio inspector; 
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public void setInspector(Socio inspector) {
		this.inspector = inspector;
	}
	public void setTipoInspeccion(String tipoInspeccion) {
		this.tipoInspeccion = tipoInspeccion;
	}
	public ModeloSistema getModeloSistema() {
		return modeloSistema;
	}
	public void setModeloSistema(ModeloSistema modeloSistema) {
		this.modeloSistema = modeloSistema;
	}
	public double getFrecuencia() {
		return frecuencia;
	}
	public void setFrecuencia(double frecuencia) {
		this.frecuencia = frecuencia;
	}
	
	public String getTipoInspeccion() {
		return tipoInspeccion;
	}
	public Socio getInspector() {
		return inspector;
	}
	
}
