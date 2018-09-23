package com.lasbambas.mantto.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Entity implementation class for Entity: TargetModelo
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(schema = "PLN")

public class TargetModelo implements Serializable {
	public enum ESTADO_TARGET {
		HISTORICO,
		ACTUAL
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private Modelo modelo;
	@NotNull
	private float disponibilidad;
	@NotNull
	private ESTADO_TARGET estado_target;
	@ManyToMany(mappedBy="targetModelos")
	private Set<PlanMantto> planManttos;

	public TargetModelo() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public float getDisponibilidad() {
		return disponibilidad;
	}

	public void setDisponibilidad(float disponibilidad) {
		this.disponibilidad = disponibilidad;
	}

	public ESTADO_TARGET getEstado_target() {
		return estado_target;
	}

	public void setEstado_target(ESTADO_TARGET estado_target) {
		this.estado_target = estado_target;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((estado_target == null) ? 0 : estado_target.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TargetModelo other = (TargetModelo) obj;
		if (estado_target != other.estado_target)
			return false;
		if (id != other.id)
			return false;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
			return false;
		return true;
	}  
	
}
